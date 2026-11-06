<#
.SYNOPSIS
  Prints, for each Pickle pass of this suite, how many scenarios a run should discover, play and skip by requirement.
  Computed from the feature tags and the filter of each pass (README.md), not measured: a report that disagrees has
  found a wrong filter or a wrong tag. No game, no assembly.

.DESCRIPTION
  What is NOT here: parsing the features, resolving every step line to exactly one step, the pass map checks.
  Those are the shared scripts/Check-Steps.ps1 (powershell -File scripts\Check-Steps.ps1 -ModRoot <this mod>).

.EXAMPLE
  powershell.exe -ExecutionPolicy Bypass -File Tests/Pickle/Pass-Counts.ps1
#>
$ErrorActionPreference = 'Stop'
$features = Join-Path $PSScriptRoot 'Mod\Pickle\Features'
$scenarios = @()
foreach ($file in Get-ChildItem -LiteralPath $features -Filter *.feature | Sort-Object Name) {
    $featureTags = @()
    $pending = @()
    $seenFeature = $false
    foreach ($line in [IO.File]::ReadAllLines($file.FullName)) {
        $t = $line.Trim()
        if ($t -match '^@') { $pending += @($t -split '\s+' | Where-Object { $_ -like '@*' }); continue }
        if ($t -match '^Feature:') { $featureTags = $pending; $pending = @(); $seenFeature = $true; continue }
        if ($t -match '^(Scenario|Scenario Outline):') {
            $scenarios += [pscustomobject]@{ File = $file.Name; Tags = @($featureTags + $pending) }
            $pending = @()
            continue
        }
        if ($t -ne '' -and $t -notmatch '^#') { $pending = @() }
    }
    if (-not $seenFeature) { throw "$($file.Name): no Feature: line" }
}

# The mods each pass stages are read from its pass map (first token of every line that is not a comment), so the
# list cannot drift from the map. Left = the tags the pass filter leaves out (README.md carries the commands).
function Get-Staged([string]$map) {
    @(Get-Content -LiteralPath (Join-Path $PSScriptRoot $map) | Where-Object { $_.Trim() -and $_ -notmatch '^\s*#' } | ForEach-Object { ($_.Trim() -split '\s+')[0] })
}
$bare = Get-Staged 'wsl-deps.sans-facultatifs.map'
$passes = @(
    @{ Name = 'sans-facultatifs, English';  Mods = $bare; Left = @('@fr-only', '@zh-only') },
    @{ Name = 'sans-facultatifs, French';   Mods = $bare; Left = @('@en-only', '@zh-only', '@save') },
    @{ Name = 'avec-mlie, English';         Mods = (Get-Staged 'wsl-deps.avec-mlie.map'); Left = @('@fr-only', '@zh-only', '@wheat-alone') },
    @{ Name = 'sans-facultatifs, Chinese';  Mods = $bare; Left = @('@en-only', '@fr-only', '@save') }
)
Write-Host "$($scenarios.Count) scenarios in $((Get-ChildItem -LiteralPath $features -Filter *.feature).Count) features. What each pass should discover, play and skip by requirement:"
foreach ($p in $passes) {
    $inRun = @($scenarios | Where-Object { $t = $_.Tags; -not ($p.Left | Where-Object { $t -contains $_ }) })
    $skipped = @($inRun | Where-Object { $_.Tags | Where-Object { $_ -like '@requires:*' } | Where-Object { $need = $_.Substring(10); -not ($p.Mods | Where-Object { $_ -ieq $need }) } })
    Write-Host ("  {0,-28} discovers {1,2}, plays {2,2}, skips by requirement {3}" -f $p.Name, $inRun.Count, ($inRun.Count - $skipped.Count), $skipped.Count)
}
