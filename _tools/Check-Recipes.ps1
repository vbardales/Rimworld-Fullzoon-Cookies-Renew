<#
.SYNOPSIS
  Checks the shape of the fifteen recipes: each biscuit at x5 and x10 is its x1 recipe times five and
  ten, in ingredient counts, product count and work, and every recipe is offered at the two vanilla
  stoves and at nothing else. No game, a second.

.DESCRIPTION
  The x5 and the x10 are not a multiplier the game applies: they are separate RecipeDefs whose every
  number was typed by hand, so a slip (25 grain and 4 milk) would load without a word and only show
  when somebody queued the bill. The shared validators check that a field exists and that a def
  resolves. None of them reads a number, and Pickle cannot say it more cheaply than this.

  What it reads is the XML as shipped, not the def as the game merges it. It asserts nothing about
  inheritance or patches: that is what Tests/Pickle does.

  Exit code 0 when every recipe holds, 1 otherwise, with each fault named.

.EXAMPLE
  powershell.exe -ExecutionPolicy Bypass -File _tools/Check-Recipes.ps1
#>
param(
    [string]$RecipeFile = (Join-Path $PSScriptRoot '..\Mod\Defs\RecipeDefs\Recipes_FZfood_Meals.xml')
)
$ErrorActionPreference = 'Stop'
if (-not (Test-Path -LiteralPath $RecipeFile)) { throw "recipe file not found: $RecipeFile" }
$xml = New-Object System.Xml.XmlDocument
$xml.Load((Resolve-Path -LiteralPath $RecipeFile).Path)

$bad = 0
function Fail($msg) { Write-Host "FAIL  $msg" -ForegroundColor Red; $script:bad++ }

# Everything a recipe carries that must scale, as one comparable shape.
function Read-Recipe($node) {
    $ingredients = @()
    foreach ($li in $node.SelectNodes('ingredients/li')) {
        $what = @($li.SelectNodes('filter/thingDefs/li') | ForEach-Object { $_.InnerText.Trim() }) +
                @($li.SelectNodes('filter/categories/li') | ForEach-Object { 'category:' + $_.InnerText.Trim() })
        $ingredients += [pscustomobject]@{ What = ($what -join '|'); Count = [double]$li.SelectSingleNode('count').InnerText }
    }
    $products = @($node.SelectSingleNode('products').ChildNodes | Where-Object { $_.NodeType -eq 'Element' } |
        ForEach-Object { [pscustomobject]@{ Def = $_.Name; Count = [double]$_.InnerText } })
    [pscustomobject]@{
        DefName     = $node.SelectSingleNode('defName').InnerText.Trim()
        Work        = [double]$node.SelectSingleNode('workAmount').InnerText
        Ingredients = $ingredients
        Products    = $products
        Users       = (@($node.SelectNodes('recipeUsers/li') | ForEach-Object { $_.InnerText.Trim() } | Sort-Object) -join ',')
    }
}

$recipes = @($xml.SelectNodes('/Defs/RecipeDef') | ForEach-Object { Read-Recipe $_ })
if ($recipes.Count -ne 15) { Fail "expected 15 recipes, found $($recipes.Count)" }

# CookFZEggBiscuit / Cook5FZEggBiscuit / Cook10FZEggBiscuit share the suffix after the multiplier.
$groups = $recipes | Group-Object { $_.DefName -replace '^Cook(5|10)?', '' }
if ($groups.Count -ne 5) { Fail "expected 5 biscuits, found $($groups.Count): $($groups.Name -join ', ')" }

foreach ($g in $groups) {
    $one = $g.Group | Where-Object { $_.DefName -eq "Cook$($g.Name)" }
    if (-not $one) { Fail "$($g.Name): no x1 recipe"; continue }
    foreach ($factor in 5, 10) {
        $r = $g.Group | Where-Object { $_.DefName -eq "Cook$factor$($g.Name)" }
        if (-not $r) { Fail "$($g.Name): no x$factor recipe"; continue }
        $label = "$($r.DefName)"
        if ($r.Work -ne $one.Work * $factor) { Fail "$label work is $($r.Work), expected $($one.Work * $factor)" }
        if ($r.Ingredients.Count -ne $one.Ingredients.Count) { Fail "$label has $($r.Ingredients.Count) ingredient slots, $($one.DefName) has $($one.Ingredients.Count)" }
        else {
            for ($i = 0; $i -lt $one.Ingredients.Count; $i++) {
                if ($r.Ingredients[$i].What -ne $one.Ingredients[$i].What) { Fail "$label slot $i takes '$($r.Ingredients[$i].What)', $($one.DefName) takes '$($one.Ingredients[$i].What)'" }
                if ($r.Ingredients[$i].Count -ne $one.Ingredients[$i].Count * $factor) { Fail "$label slot $i wants $($r.Ingredients[$i].Count) of '$($r.Ingredients[$i].What)', expected $($one.Ingredients[$i].Count * $factor)" }
            }
        }
        $rProducts = ($r.Products | ForEach-Object { $_.Def }) -join ','
        $oneProducts = ($one.Products | ForEach-Object { $_.Def }) -join ','
        if ($rProducts -ne $oneProducts) { Fail "$label makes '$rProducts', $($one.DefName) makes '$oneProducts'" }
        elseif ($r.Products[0].Count -ne $one.Products[0].Count * $factor) { Fail "$label makes $($r.Products[0].Count) $($r.Products[0].Def), expected $($one.Products[0].Count * $factor)" }
    }
}

foreach ($r in $recipes) {
    if ($r.Users -ne 'ElectricStove,FueledStove') { Fail "$($r.DefName) is offered at '$($r.Users)', expected ElectricStove,FueledStove" }
    if ($r.Products.Count -ne 1) { Fail "$($r.DefName) has $($r.Products.Count) products, expected 1" }
}

Write-Host ''
if ($bad -gt 0) { Write-Host "$bad PROBLEM(S) in $($recipes.Count) recipes." -ForegroundColor Red; exit 1 }
Write-Host "EVERY ONE OF THE $($recipes.Count) RECIPES HOLDS: five biscuits, each at x1, x5 and x10, at two stoves" -ForegroundColor Green
exit 0
