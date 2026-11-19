param([Parameter(Mandatory)][string]$ModRoot, [string]$SharedDir)

# Own values and facts of this mod's content: the fifteen recipes are five biscuits at x1, x5 and x10, each x5 and x10 being
# its x1 recipe times five and ten (ingredient counts, product count, work), each offered at the two vanilla stoves and at
# nothing else, one product each. The x5 and x10 are separate RecipeDefs typed by hand: a slip (25 grain and 4 milk) loads
# without a word. The shared checks verify that a field exists and that a def resolves, none reads a number.
# One consumer, nothing shareable; run by the generated Tests/Test-Mod.ps1 after the shared checks. Prints findings, exit 1 on any.
# Reads the XML as shipped, not the def as the game merges it (inheritance and patches belong to Tests/Pickle).
$ErrorActionPreference = 'Stop'
$root = (Resolve-Path -LiteralPath $ModRoot).Path
$script:findings = @()

function It([string]$name, [scriptblock]$body) {
    try { $problems = @(& $body | Where-Object { $_ }) } catch { $problems = @("threw: $($_.Exception.GetBaseException().Message)") }
    foreach ($p in $problems) { $script:findings += "[$name] $p" }
}

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

It 'Fifteen recipes: five biscuits at x1, x5, x10, two stoves' {
    $file = Join-Path $root 'Mod/Defs/RecipeDefs/Recipes_FZfood_Meals.xml'
    if (-not (Test-Path -LiteralPath $file)) { "recipe file not found: $file"; return }
    $xml = [System.Xml.XmlDocument]::new()
    $xml.XmlResolver = $null
    $xml.Load($file)
    $recipes = @($xml.SelectNodes('/Defs/RecipeDef') | ForEach-Object { Read-Recipe $_ })
    if ($recipes.Count -ne 15) { "expected 15 recipes, found $($recipes.Count)" }

    # CookFZEggBiscuit / Cook5FZEggBiscuit / Cook10FZEggBiscuit share the suffix after the multiplier.
    $groups = @($recipes | Group-Object { $_.DefName -replace '^Cook(5|10)?', '' })
    if ($groups.Count -ne 5) { "expected 5 biscuits, found $($groups.Count): $($groups.Name -join ', ')" }

    foreach ($g in $groups) {
        $one = $g.Group | Where-Object { $_.DefName -eq "Cook$($g.Name)" }
        if (-not $one) { "$($g.Name): no x1 recipe"; continue }
        foreach ($factor in 5, 10) {
            $r = $g.Group | Where-Object { $_.DefName -eq "Cook$factor$($g.Name)" }
            if (-not $r) { "$($g.Name): no x$factor recipe"; continue }
            $label = $r.DefName
            if ($r.Work -ne $one.Work * $factor) { "$label work is $($r.Work), expected $($one.Work * $factor)" }
            if ($r.Ingredients.Count -ne $one.Ingredients.Count) { "$label has $($r.Ingredients.Count) ingredient slots, $($one.DefName) has $($one.Ingredients.Count)" }
            else {
                for ($i = 0; $i -lt $one.Ingredients.Count; $i++) {
                    if ($r.Ingredients[$i].What -ne $one.Ingredients[$i].What) { "$label slot $i takes '$($r.Ingredients[$i].What)', $($one.DefName) takes '$($one.Ingredients[$i].What)'" }
                    if ($r.Ingredients[$i].Count -ne $one.Ingredients[$i].Count * $factor) { "$label slot $i wants $($r.Ingredients[$i].Count) of '$($r.Ingredients[$i].What)', expected $($one.Ingredients[$i].Count * $factor)" }
                }
            }
            $rProducts = ($r.Products | ForEach-Object { $_.Def }) -join ','
            $oneProducts = ($one.Products | ForEach-Object { $_.Def }) -join ','
            if ($rProducts -ne $oneProducts) { "$label makes '$rProducts', $($one.DefName) makes '$oneProducts'" }
            elseif ($r.Products[0].Count -ne $one.Products[0].Count * $factor) { "$label makes $($r.Products[0].Count) $($r.Products[0].Def), expected $($one.Products[0].Count * $factor)" }
        }
    }
    foreach ($r in $recipes) {
        if ($r.Users -ne 'ElectricStove,FueledStove') { "$($r.DefName) is offered at '$($r.Users)', expected ElectricStove,FueledStove" }
        if ($r.Products.Count -ne 1) { "$($r.DefName) has $($r.Products.Count) products, expected 1" }
    }
}

if ($script:findings.Count) { $script:findings | ForEach-Object { Write-Host "FAIL  $_" -ForegroundColor Red }; exit 1 }
Write-Host 'PASS: the fifteen recipes hold (five biscuits at x1, x5 and x10, two stoves).' -ForegroundColor Green
exit 0
