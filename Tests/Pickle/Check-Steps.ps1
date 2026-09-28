<#
.SYNOPSIS
  Checks that every step line of this suite's features resolves to exactly one step definition. No game,
  a few seconds.

.DESCRIPTION
  A step that does not exist costs a whole run on a machine shared by every session. This is the check that
  finds it before the ticket is taken. It is adapted from AncientBuildingsRenew/Tests/Pickle/Check-Steps.ps1,
  minus what that suite needs for its local steps: THIS suite has none, no Source/ and no assembly, so there
  is no pattern of its own to compile, to find duplicated or to find unused.

  Two things, both against Pickle's own expression engine and not against a guess:

    1. Every Given/When/Then/And/But line of every feature MATCHES exactly one expression among Pickle's own
       vocabulary (read from the installed assemblies) and the shared PickleTools this suite stages (read
       from the pass maps). Zero is an undefined step and fails its scenario. More than one is an
       "Ambiguous step", which fails a healthy scenario, since Pickle loads every suite's steps into one
       namespace and matches on the text alone.
    2. Every pass map names only tools that exist under PickleTools/, and ends with a newline. The staging
       reads a map with `while read`, which drops a last line that has no newline, without a word: the
       tool the last line names is then simply not staged and its scenarios are skipped by requirement.

  Static: it proves the text of a step exists, not that the step does what the scenario hopes. Nothing here
  has been played.

.EXAMPLE
  powershell.exe -ExecutionPolicy Bypass -File Tests/Pickle/Check-Steps.ps1
#>
param(
    [string]$PickleAssemblies = 'C:\Program Files (x86)\Steam\steamapps\workshop\content\294100\3791648678\Assemblies',
    [string]$Cecil = "$env:USERPROFILE\.nuget\packages\mono.cecil\0.11.5\lib\net40\Mono.Cecil.dll"
)
$ErrorActionPreference = 'Stop'
$suite = $PSScriptRoot                                                        # ...\Tests\Pickle
$repo = Split-Path (Split-Path (Split-Path $suite -Parent) -Parent) -Parent   # the collection root

foreach ($dll in 'CucumberExpressions.dll', 'RimWorks.Pickle.Core.dll') {
    $path = Join-Path $PickleAssemblies $dll
    if (-not (Test-Path $path)) { throw "$dll not found under $PickleAssemblies. Pass -PickleAssemblies with the installed Pickle mod's Assemblies folder." }
    [Reflection.Assembly]::LoadFrom($path) | Out-Null
}
if (-not (Test-Path $Cecil)) { throw "Mono.Cecil not found at $Cecil. Pass -Cecil, or restore it: it reads Pickle's step attributes without loading its game types." }
Add-Type -Path $Cecil

$core = [AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GetName().Name -eq 'RimWorks.Pickle.Core' }
$registryType = $core.GetType('RimWorks.Pickle.Core.Steps.PickleParameterTypeRegistry')
if (-not $registryType) { throw 'PickleParameterTypeRegistry no longer exists: Pickle renamed it, update this script.' }
$registry = [Activator]::CreateInstance($registryType)
function New-Expr($pattern) { New-Object CucumberExpressions.CucumberExpression($pattern, $registry) }

# The attribute argument is a C# literal: undo its escaping to get the pattern Pickle sees.
$attr = '\[(?:Given|When|Then)\("((?:[^"\\]|\\.)*)"[^\]]*\]'
function Read-Patterns($dir, $source) {
    foreach ($f in Get-ChildItem -LiteralPath $dir -Filter *.cs -ErrorAction SilentlyContinue) {
        $text = [IO.File]::ReadAllText($f.FullName)
        foreach ($m in [regex]::Matches($text, $attr)) {
            [pscustomobject]@{ Source = $source; Pattern = ($m.Groups[1].Value -replace '\\\\', '\' -replace '\\"', '"') }
        }
    }
}

$bad = 0
$others = @()

# Pickle's own vocabulary. Two assemblies carry steps: Vanilla, and the runner itself (the save steps).
foreach ($name in 'RimWorks.Pickle.Vanilla.dll', 'RimWorks.Pickle.dll') {
    $asm = [Mono.Cecil.AssemblyDefinition]::ReadAssembly((Join-Path $PickleAssemblies $name))
    foreach ($t in $asm.MainModule.GetTypes()) {
        foreach ($m in $t.Methods) {
            foreach ($a in $m.CustomAttributes | Where-Object { $_.AttributeType.Name -in 'GivenAttribute', 'WhenAttribute', 'ThenAttribute' }) {
                $others += [pscustomobject]@{ Source = 'pickle'; Pattern = [string]$a.ConstructorArguments[0].Value }
            }
        }
    }
}
# Handled by the runner without an attribute the extraction sees. Not derived from the assembly: the evidence
# is that Pickle's own Features\save-reload.feature uses each of them verbatim, and that other suites' passes
# ran to their end on them (the same four as AncientBuildingsRenew's checker).
foreach ($p in 'the save {string} is loaded', 'I save and reload', 'I save and reload as {string}', 'the save round trips') {
    $others += [pscustomobject]@{ Source = 'pickle-engine'; Pattern = $p }
}

# The shared tools this suite stages: every line of every pass map naming a path under PickleTools/.
$staged = @()
foreach ($map in Get-ChildItem -LiteralPath $suite -Filter 'wsl-deps*.map') {
    $bytes = [IO.File]::ReadAllBytes($map.FullName)
    if ($bytes.Length -gt 0 -and $bytes[$bytes.Length - 1] -ne 10) {
        Write-Host "NO NEWLINE  $($map.Name) does not end with a newline: the staging would drop its last line in silence" -ForegroundColor Red; $bad++
    }
    foreach ($line in [IO.File]::ReadAllLines($map.FullName)) {
        if ($line -match '^\s*(\S+)\s+path:PickleTools/([^/\s]+)/') { $staged += $Matches[2] }
    }
}
foreach ($tool in $staged | Sort-Object -Unique) {
    $src = Join-Path $repo "PickleTools\$tool\Source"
    if (-not (Test-Path -LiteralPath $src)) { Write-Host "MISSING  a pass map stages PickleTools/$tool and $src does not exist" -ForegroundColor Red; $bad++; continue }
    foreach ($p in Read-Patterns $src ('tool:' + $tool)) { $others += $p }
}

$exprs = @()
foreach ($o in $others) {
    try { $exprs += [pscustomobject]@{ Source = $o.Source; Pattern = $o.Pattern; Regex = (New-Expr $o.Pattern).Regex } } catch { }
}

# Every feature line resolves to exactly one expression.
$lines = 0
$perFile = @{}
$undefined = @(); $ambiguous = @()
foreach ($file in Get-ChildItem -LiteralPath (Join-Path $suite 'Mod\Pickle\Features') -Filter *.feature) {
    foreach ($raw in [IO.File]::ReadAllLines($file.FullName, [Text.Encoding]::UTF8)) {
        $line = $raw.Trim()
        if ($line -notmatch '^(Given|When|Then|And|But)\s+(.+)$') { continue }
        $step = $Matches[2].Trim()
        $lines++
        $perFile[$file.Name] = 1 + [int]$perFile[$file.Name]
        $hits = @($exprs | Where-Object { $_.Regex.IsMatch($step) })
        if ($hits.Count -eq 0) { $undefined += "$($file.Name): $step"; continue }
        if ($hits.Count -gt 1) { $ambiguous += [pscustomobject]@{ Where = "$($file.Name): $step"; Hits = ($hits | ForEach-Object { "[$($_.Source)] $($_.Pattern)" }) } }
    }
}

Write-Host ''
Write-Host "$($exprs.Count) expressions in the namespace (Pickle and $(@($staged | Sort-Object -Unique).Count) shared tool(s)), $lines step lines across the features."

foreach ($u in $undefined | Sort-Object -Unique) { Write-Host "UNDEFINED  $u" -ForegroundColor Red; $bad++ }
foreach ($a in $ambiguous) {
    Write-Host "AMBIGUOUS  $($a.Where)" -ForegroundColor Red
    foreach ($h in $a.Hits) { Write-Host "           $h" -ForegroundColor DarkRed }
    $bad++
}


# --- The features parse, and what each pass should play --------------------------------------------------
# Pickle parses every feature with the Gherkin parser it ships: a syntax error there loses the feature at
# startup. Parsing here says so first. The tags then give, for each pass, the number of scenarios a run
# should DISCOVER, PLAY and SKIP BY REQUIREMENT: the numbers a report has to match (Authoring guide, section 7:
# scenarios played against scenarios discovered). Those are computed from the tags and from the filter each
# pass uses (README.md), not measured: a run that disagrees has found either a wrong filter or a wrong tag.
foreach ($d in 'Cucumber.Messages.dll', 'Gherkin.dll') { [Reflection.Assembly]::LoadFrom((Join-Path $PickleAssemblies $d)) | Out-Null }
$parser = New-Object Gherkin.Parser
$scenarios = @()
foreach ($file in Get-ChildItem -LiteralPath (Join-Path $suite 'Mod\Pickle\Features') -Filter *.feature | Sort-Object Name) {
    try { $doc = $parser.Parse($file.FullName) }
    catch { Write-Host "UNPARSEABLE  $($file.Name): $($_.Exception.InnerException.Message)$($_.Exception.Message)" -ForegroundColor Red; $bad++; continue }
    $featureTags = @($doc.Feature.Tags | ForEach-Object { $_.Name })
    # A misspelt keyword ("Scenari:") is not a syntax error to Gherkin: the line becomes the feature's description
    # and every step under it belongs to no scenario. So the steps found in the text must all be in a scenario.
    $inScenarios = 0
    foreach ($c in $doc.Feature.Children) { $inScenarios += @($c.Steps).Count }
    if ($inScenarios -ne [int]$perFile[$file.Name]) { Write-Host "ORPHAN STEPS  $($file.Name): $($perFile[$file.Name]) step lines in the text, $inScenarios inside a scenario or background: a keyword is misspelt" -ForegroundColor Red; $bad++ }
    foreach ($c in $doc.Feature.Children) {
        if ($c.GetType().Name -ne 'Scenario') { continue }
        $scenarios += [pscustomobject]@{ File = $file.Name; Name = $c.Name; Tags = @($featureTags + @($c.Tags | ForEach-Object { $_.Name })) }
    }
}

# The mods each pass stages and the tags its filter leaves out (README.md carries the commands).
$loadAudit = 'nelim.pickletools.loadaudit'
$mlie = @('Mlie.VanillalikeWheat', 'syrchalis.processor.framework')
$passes = @(
    @{ Name = 'sans-facultatifs, English';  Mods = @($loadAudit);        Left = @('@fr-only', '@zh-only') },
    @{ Name = 'sans-facultatifs, French';   Mods = @($loadAudit);        Left = @('@en-only', '@zh-only', '@save') },
    @{ Name = 'avec-mlie, English';         Mods = @($loadAudit) + $mlie; Left = @('@fr-only', '@zh-only', '@wheat-alone') },
    @{ Name = 'sans-facultatifs, Chinese';  Mods = @($loadAudit);        Left = @('@en-only', '@fr-only', '@save') }
)
Write-Host ''
Write-Host "$($scenarios.Count) scenarios in $((Get-ChildItem -LiteralPath (Join-Path $suite 'Mod\Pickle\Features') -Filter *.feature).Count) features. What each pass should discover, play and skip by requirement:"
foreach ($p in $passes) {
    $inRun = @($scenarios | Where-Object { $t = $_.Tags; -not ($p.Left | Where-Object { $t -contains $_ }) })
    $skipped = @($inRun | Where-Object { $_.Tags | Where-Object { $_ -like '@requires:*' } | Where-Object { $need = $_.Substring(10); -not ($p.Mods | Where-Object { $_ -ieq $need }) } })
    Write-Host ("  {0,-28} discovers {1,2}, plays {2,2}, skips by requirement {3}" -f $p.Name, $inRun.Count, ($inRun.Count - $skipped.Count), $skipped.Count)
}

Write-Host ''
if ($bad -gt 0) {
    Write-Host "$bad PROBLEM(S). An undefined step fails its scenario, an ambiguous one fails a healthy scenario." -ForegroundColor Red
    exit 1
}
Write-Host 'EVERY FEATURE PARSES, EVERY STEP LINE IS IN A SCENARIO AND RESOLVES TO EXACTLY ONE STEP' -ForegroundColor Green
exit 0
