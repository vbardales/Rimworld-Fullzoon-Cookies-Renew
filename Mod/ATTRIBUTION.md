# Fullzoon's Cookies — attribution

A 1.6 port of **满月的饼干Cookies**, by **Fullzoon**
([1623487558](https://steamcommunity.com/sharedfiles/filedetails/?id=1623487558)).

The Chinese title reads "full moon's cookies" — 满月, *full moon*, being a play on the author's
own name. Fullzoon's own English for it, in the mod's description, is "Fullzoon's Cookies", and
that is the name this port carries.

## Status: public

The source mod is **dead** — it declares `targetVersion` 1.0.2096 and nothing since — and **no
licence is declared anywhere**, checked at the four places one could be: no `LICENSE` file in the
mod, no mention in its `About.xml`, no linked repository, and nothing in the body of the
description of its Steam page.

That fourth check is the one that was missed on たたら製鉄, where the ban on redistribution was
written into the description and nowhere else. It was made here before anything was copied.

This is the usual convention for ports on the RimWorld Workshop: republished with **credit by
name** and **removal on request, without argument**. The `<author>` field keeps Fullzoon's name,
and the removal clause is in the description.

## What the mod is

31 defs: five biscuits on a shared abstract base, fifteen recipes (each biscuit at ×1, ×5, ×10),
a wheat crop and its harvest, six thoughts — and the two copied vanilla bases below. No assembly,
no framework, no research, no DLC. Its ingredients are all vanilla, its workbenches are the two
vanilla stoves.

## Two defs that were fighting the game

Both of these predate the port. They are the reason it exists.

### `PlantBase`

`Defs/ThingDefs/Plants/Plants_Wheat.xml` opened with:

```xml
<ThingDef Name="PlantBase" Abstract="True">
```

That is the name of the abstract def **every plant in RimWorld inherits from** — every crop, every
tree, every bush, in Core and in every other mod. Two abstract defs may carry the same `Name`
without any error: `XmlInheritance` keeps a list per name, and `GetBestParentFor` resolves each
`ParentName` to the copy from the highest-loading mod at or below the def asking for it. That is
what makes redeclaring a vanilla name dangerous rather than noisy — every def in every mod loading
after this one would have been reparented onto Fullzoon's copy, silently.

Fullzoon's copy was not a faithful one. Against vanilla's `PlantBase` it was missing
`BeautyOutdoors` and the `Plants` thing category, and it set `harvestWork` to 250 where vanilla
says 200. Winning that race would have applied those three differences to every plant loaded.

**Fixed by deleting the copy.** `FZPlant_Wheat` now inherits the real `PlantBase`, and carries
`<harvestWork>250</harvestWork>` itself so the wheat behaves as it did before.

### `CookMealBase`

`Defs/RecipeDefs/Recipes_FZfood_Meals.xml` opened with the same pattern for the base of every
cooking recipe. The copy was faithful to **1.0** — which means it lacked the line vanilla has now:

```xml
<li MayRequire="Ludeon.RimWorld.Anomaly">Meat_Twisted</li>
```

Had it won the race, every vanilla meal would have accepted twisted meat in its default
ingredient filter.

**Fixed by deleting the copy** — and it cost nothing, because **not one of the fifteen recipes
ever inherited from it.** Each declares its own `fixedIngredientFilter` and its own
`workSkill`. The def was dead weight that happened to be dangerous.

## Other defects, all older than the port

- **`AteFZfoods`**, a sixth `ThoughtDef` worth **+99 mood** for a day. No biscuit named it as its
  `tasteThought`; nothing referenced it at all. It never fired. Dropped rather than carried
  forward.
- **`EggChickenUnfertilized` by name.** The egg biscuit could only be baked from chicken eggs —
  not duck, goose, turkey, emu, ostrich, cassowary, cobra, iguana or tortoise, and not a modded
  bird. It now takes the `EggsUnfertilized` category.
- **The wheat has no texture of its own.** `FZPlant_Wheat` points at `Things/Plant/RicePlant`,
  vanilla's rice. In game the crop is a rice field. Left as it is: inventing a plant texture is
  not porting.
- **`FZfood.png`**, a seventh texture no def references - and it is a cut-out photograph of a
  double cheeseburger, which has nothing to do with anything in the mod. A leftover in the folder.
  Not shipped and not kept: a stock photograph of unknown provenance is not this repository's to
  carry.

## Compatibility with Vanilla-like Wheat

`Mlie.VanillalikeWheat` grows wheat as well: `PlantWheat`, labelled *wheat plant*, harvested as
`RawWheat`. The two mods do not collide — the `defName`s differ — but they do overlap:

| | Fullzoon | Mlie |
|---|---|---|
| Crop | `FZPlant_Wheat`, 4.5 days, yield 6 | `PlantWheat`, 9.8 days, yield 17, research + growing 6 |
| Harvest | `FZRawWheat`, bake with it directly | `RawWheat`, must be milled into `Flour` |
| Chain | none | SYR Processor Framework, two ovens, bread, cake, hardtack |

Two entries called *wheat plant* in the same growing zone is a nuisance, so:

- Each recipe accepts **either** grain, through
  `<li MayRequire="Mlie.VanillalikeWheat">RawWheat</li>`.
- `Patches/VanillaLikeWheat.xml` removes `FZPlant_Wheat`'s `sowTags` when Mlie's mod is loaded,
  which takes it out of the sow menu.
- This mod's grain is labelled **wheat grain**, not *wheat*, so the two never read alike in a
  stockpile filter. It is the honest name for it as well: Fullzoon's is threshed grain ready to
  bake, Mlie's is straw and grain that has to go through a quern.

**The patch tests the def, not the mod.** `PatchOperationFindMod` was the obvious tool and was
rejected: reading its IL, it matches `ModMetaData.Name` by exact string equality — "Vanilla-like
wheat (Continued)", capitals and parentheses included — and that string is Mlie's to change.
A `PatchOperationConditional` on `Defs/ThingDef[defName="PlantWheat"]` keys on what actually
causes the problem.

## What changed in the port

- The two abstract copies deleted, `AteFZfoods` dropped, the egg filter widened. Above.
- **Everything was in Chinese.** All labels and descriptions are now English; Fullzoon's own
  Chinese is restored under `Languages/ChineseSimplified/DefInjected/` rather than lost.
- **A French translation added**, 69 keys.
- Labels lowercased, following the vanilla convention of letting the game capitalise them.
- Recipe labels turned from `做鸡蛋饼干*5` into `bake egg biscuits x5`, and the `jobString`
  from "Cooking FZfood meals." into "Baking biscuits."
- `<supportedVersions>` set to 1.6; a `packageId` added, which 1.0 did not require.

## What did not change

The five biscuits, the wheat, their stats, their nutrition and joy values, their market values,
the fifteen recipes and their ingredient counts, and the six textures. The original `defName`s
are kept.

## Notes from the port

- **1.0 to 1.6 cost nothing in field names.** Every element in the mod still maps to a field on
  the 1.6 class — checked with `scripts/Check-XmlFields.ps1`, which walks each def against the
  real class by reflection. `foodType Seed`, `preferability DesperateOnly`, `harvestTag`,
  `uiIconForStackCount`, `socialPropernessMatters`: all still there.
- **`FZRawWheat` is a copy of vanilla `RawRice`** in all but its texture — same parent, same
  market value, same `foodType Seed`, same forty-day rot. And `FZPlant_Wheat` is a copy of
  `Plant_Rice` slowed from 3 days to 4.5, using the rice texture.
- **The biscuits are `DesperateOnly`**, which reads like a mistake and is not: vanilla chocolate
  is `DesperateOnly` too. It is how a snack is kept out of the meal rotation while still being
  eaten for joy.
- The original ships no `PublishedFileId` problem, no `AssetBundle`, and no `LoadFolders.xml`:
  its `Defs`, `Textures` and `About` sit at the root, which is what 1.6 still expects for a
  single-version mod.
