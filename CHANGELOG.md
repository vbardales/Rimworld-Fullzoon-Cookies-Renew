# Changelog

All notable changes to this mod are documented here.

## [1.0.0] — unreleased

The tag and the GitHub release come with the publication, from the publishing CI, not by hand.

First release. Port of Fullzoon's **满月的饼干Cookies** to RimWorld 1.6.

### Fixed

- **`PlantBase` no longer redefined.** The mod shipped its own
  `<ThingDef Name="PlantBase" Abstract="True">`, a copy of the base every plant in the game
  inherits from — and an unfaithful one: no `BeautyOutdoors`, no `Plants` thing category,
  `harvestWork` 250 instead of 200. Two abstract defs may share a `Name` without error:
  `GetBestParentFor` resolves each `ParentName` to the copy from the highest-loading mod at or
  below the def asking for it, which is exactly what makes redeclaring a vanilla name dangerous
  rather than noisy — every def loading after this mod would have been reparented onto the copy.
  The copy is deleted; `FZPlant_Wheat` inherits the real `PlantBase` and carries
  `<harvestWork>250</harvestWork>` itself, so the wheat behaves as before.
- **`CookMealBase` no longer redefined.** Same pattern, for the base of every cooking recipe, and
  copied from 1.0 — so it lacked the Anomaly exclusion of `Meat_Twisted`. Not one of the fifteen
  recipes ever inherited from it; the copy is deleted and nothing else changed.
- **`AteFZfoods` dropped.** A sixth `ThoughtDef` worth +99 mood for a day, referenced by nothing.
  It never fired.
- **Egg biscuits accept every unfertilised egg.** The recipe named `EggChickenUnfertilized`,
  which locked out the nine other unfertilised eggs vanilla ships - duck, goose, turkey, emu,
  ostrich, cassowary, cobra, iguana and tortoise - and every modded bird. It now takes the
  `EggsUnfertilized` category.

### Added

- French translation, 69 keys.
- `Patches/VanillaLikeWheat.xml`: where `Mlie.VanillalikeWheat` is loaded, `FZPlant_Wheat` loses
  its `sowTags` and leaves the sow menu, so there is only one wheat crop to choose from. The
  patch tests for the def `PlantWheat`, not for the mod's display name, which is Mlie's to change.
- Each recipe also accepts Mlie's `RawWheat`, through
  `<li MayRequire="Mlie.VanillalikeWheat">RawWheat</li>`.
- `packageId` `nelim.fullzooncookies`. The original has none; 1.0 did not require it. The `renew` the
  id carried at the 0.1.0 prepublication was dropped before the first public version: the `nelim.`
  prefix already says the mod is mine, and the name, folder and repository say it is a port.
- An in-game test suite for Pickle, under `Tests/Pickle/`: 30 scenarios in 14 features and no code of its
  own. Three passes are required, bare English, bare French and beside Mlie's Vanilla-like Wheat, and a
  fourth for Chinese Simplified. Written on 2026-09-28 and not yet played. Development only; none of it is in
  `Mod/`, so none of it reaches a player.
- `_tools/Check-Recipes.ps1`, an offline check that the fifteen recipes are five biscuits at x1, x5 and x10,
  multiples of one another, at the two stoves. Development only.

### Changed

- Everything was in Chinese. All labels and descriptions are now English, and Fullzoon's Chinese
  is restored under `Languages/ChineseSimplified/DefInjected/` rather than lost.
- `FZRawWheat` is labelled **wheat grain**, not *wheat*, so it does not read identically to
  Mlie's wheat in a stockpile filter — and because that is what it is: threshed grain, ready to
  bake with, where Mlie's is straw and grain waiting for a quern.
- Recipe labels rewritten in the vanilla form: `做鸡蛋饼干*5` → `bake egg biscuits x5`. The
  `jobString` went from "Cooking FZfood meals." to "Baking biscuits."
- Labels lowercased throughout, following the vanilla convention of letting the game capitalise
  them on display.
- `<supportedVersions>` set to 1.6.

### Unchanged

- The five biscuits, the wheat, their stats, nutrition, joy and market values.
- The fifteen recipes and their ingredient counts.
- The six textures.
- The original `defName`s, so a save moves between the two mods without losing anything.

### Not carried over

- `FZfood.png`, a seventh texture no def references - a cut-out photograph of a double
  cheeseburger, unrelated to anything in the mod. Dropped, not archived.

## [0.1.0] — 2026-09-23

Creation of a publishIdFile. Prepublication: a first upload whose only purpose was to create the
Workshop item (private, as Steam creates every item, RimWorld never changing that) and obtain
`Mod/About/PublishedFileId.txt`, which holds the item ID `3806761765`.

The upload contained `Mod/` as it stood at commit `73d3406` (tree `1906c02`), unchanged since, plus
six generated `.dds` textures that sat beside the PNGs in `Mod/Textures/Things/Item/` (written at
14:13, two hours before the ID file at 16:34; untracked, now ignored, and never part of a later CI
upload, which ships tracked files only). The commit that adds the ID file is the commit of this
version. `packageId` was `nelim.fullzooncookiesrenew` at that upload; it became
`nelim.fullzooncookies` afterwards (see 1.0.0), so the item's own `About.xml` on Steam keeps the old
one until the next upload.

This entry does not say the mod is public or tested: see `STATUS.md`.
