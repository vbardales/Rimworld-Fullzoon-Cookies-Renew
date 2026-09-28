<#
.SYNOPSIS
  Writes the three label features (English, French, Chinese) from the defs and the translations of Mod/.

.DESCRIPTION
  A label that reaches the loaded def is a claim only a game can settle: the offline inventory proves
  that a translation key resolves to a field, not that the game found the language folder and applied
  it. The features assert, for the crop, the grain and the five biscuits, the label and the description
  as the loaded def holds them, and the label of the fifteen bills.

  They are generated so that the text is never typed twice. Run this again whenever a label, a
  description or a translation changes, then `git diff` says what moved. English comes from the Def
  values themselves (there is no English language folder, and none is needed); French and Chinese come
  from Languages/<language>/DefInjected.

  Each language has its own feature and its own tag (@en-only, @fr-only, @zh-only), because the game
  is started in ONE language and an assertion on another language's text can only fail. A pass leaves
  the two other tags out with an exclusion in its filter: see README.md.

.EXAMPLE
  powershell.exe -ExecutionPolicy Bypass -File Tests/Pickle/Generate-LabelFeatures.ps1
#>
$ErrorActionPreference = 'Stop'
$mod = Join-Path $PSScriptRoot '..\..\Mod'
$out = Join-Path $PSScriptRoot 'Mod\Pickle\Features'
if (-not (Test-Path -LiteralPath $mod)) { throw "Mod folder not found: $mod" }
New-Item -ItemType Directory -Force -Path $out | Out-Null

function Read-Xml($path) { $x = New-Object System.Xml.XmlDocument; $x.Load($path); $x }

# --- English: the Def values -------------------------------------------------------------------------
$things = [ordered]@{}   # defName -> @{ label; description }
$recipes = [ordered]@{}  # defName -> label
foreach ($f in Get-ChildItem -LiteralPath (Join-Path $mod 'Defs') -Recurse -Filter *.xml) {
    $x = Read-Xml $f.FullName
    foreach ($n in $x.SelectNodes('/Defs/ThingDef[defName and not(@Abstract="True")]')) {
        $things[$n.SelectSingleNode('defName').InnerText.Trim()] = @{
            label       = $n.SelectSingleNode('label').InnerText.Trim()
            description = $n.SelectSingleNode('description').InnerText.Trim()
        }
    }
    foreach ($n in $x.SelectNodes('/Defs/RecipeDef[defName]')) {
        $recipes[$n.SelectSingleNode('defName').InnerText.Trim()] = $n.SelectSingleNode('label').InnerText.Trim()
    }
}
if ($things.Count -ne 7)   { throw "expected 7 things (crop, grain, five biscuits), found $($things.Count)" }
if ($recipes.Count -ne 15) { throw "expected 15 recipes, found $($recipes.Count)" }

# --- French and Chinese: DefInjected ------------------------------------------------------------------
function Read-Injected($language) {
    $dict = @{}
    $dir = Join-Path $mod "Languages\$language\DefInjected"
    foreach ($f in Get-ChildItem -LiteralPath $dir -Recurse -Filter *.xml) {
        $x = Read-Xml $f.FullName
        foreach ($n in $x.SelectNodes('/LanguageData/*')) { $dict[$n.Name] = $n.InnerText.Trim() }
    }
    $dict
}

function Quote($text, $where) {
    if ($text -match "[`r`n]") { throw "$where holds a line break: a Gherkin step is one line" }
    '"' + ($text -replace '\\', '\\' -replace '"', '\"') + '"'
}

function Write-Feature($file, $tag, $title, $intro, $get) {
    $t = New-Object System.Text.StringBuilder
    $intro = $intro -replace (' ' + [regex]::Escape($stamp)), ("`n# " + $stamp)
    [void]$t.AppendLine(($intro -replace "`r", '').TrimEnd())
    [void]$t.AppendLine($tag)
    [void]$t.AppendLine("Feature: $title")
    [void]$t.AppendLine('')
    [void]$t.AppendLine('  Scenario: the labels a player reads in the menus')
    [void]$t.AppendLine('    Given the main menu is open')
    $first = $true
    foreach ($d in $things.Keys) {
        $kw = if ($first) { 'Then' } else { 'And' }; $first = $false
        [void]$t.AppendLine("    $kw def `"$d`" field `"label`" is $(Quote (& $get $d 'label') "$d.label")")
    }
    [void]$t.AppendLine('')
    [void]$t.AppendLine('  Scenario: the descriptions a player reads in the information windows')
    [void]$t.AppendLine('    Given the main menu is open')
    $first = $true
    foreach ($d in $things.Keys) {
        $kw = if ($first) { 'Then' } else { 'And' }; $first = $false
        [void]$t.AppendLine("    $kw def `"$d`" field `"description`" is $(Quote (& $get $d 'description') "$d.description")")
    }
    [void]$t.AppendLine('')
    [void]$t.AppendLine('  Scenario: the fifteen bills a player can queue at a stove')
    [void]$t.AppendLine('    Given the main menu is open')
    $first = $true
    foreach ($d in $recipes.Keys) {
        $kw = if ($first) { 'Then' } else { 'And' }; $first = $false
        [void]$t.AppendLine("    $kw def `"$d`" field `"label`" is $(Quote (& $get $d 'recipe') "$d.label")")
    }
    [IO.File]::WriteAllText((Join-Path $out $file), $t.ToString().Replace("`r`n", "`n"), (New-Object System.Text.UTF8Encoding($false)))
    Write-Host "wrote $file"
}

$stamp = 'Generated by Tests/Pickle/Generate-LabelFeatures.ps1: do not edit by hand, run it again.'

Write-Feature '04-labels-en.feature' '@en-only' 'the English labels and descriptions reach the loaded definitions' @"
# The English text as the loaded defs hold it, in a game started in English. English lives in the Def values
# themselves: there is no English language folder, and none is needed. $stamp
# Played only in the English passes; the French and Chinese twins are 05 and 06.
"@ {
    param($d, $what)
    if ($what -eq 'recipe') { $recipes[$d] } else { $things[$d][$what] }
}

$fr = Read-Injected 'French'
Write-Feature '05-labels-fr.feature' '@fr-only' 'the French labels and descriptions reach the loaded definitions' @"
# The French twin of 04, read in a game started in French (-Language French). A text still in English here
# is a translation the game did not apply, whatever the offline inventory says: a language folder the game
# does not find fails silently, and the offline check only proves that the keys resolve. $stamp
# Played only in the French pass.
"@ {
    param($d, $what)
    $key = if ($what -eq 'recipe') { "$d.label" } else { "$d.$what" }
    if (-not $fr.ContainsKey($key)) { throw "French has no $key" }
    $fr[$key]
}

$zh = Read-Injected 'ChineseSimplified'
Write-Feature '06-labels-zh.feature' '@zh-only' 'the Chinese labels and descriptions reach the loaded definitions' @"
# Fullzoon's own Chinese, restored under Languages/ChineseSimplified, read in a game started in Simplified
# Chinese (-Language ChineseSimplified). $stamp
# Played only in the Chinese pass, and only if the install carries the language.
"@ {
    param($d, $what)
    $key = if ($what -eq 'recipe') { "$d.label" } else { "$d.$what" }
    if (-not $zh.ContainsKey($key)) { throw "Chinese has no $key" }
    $zh[$key]
}
