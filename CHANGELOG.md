# Changelog

All notable changes to this mod are documented here.

## [1.0.0] — 2026-09-05

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
  which locked out duck, goose, turkey, emu, ostrich and cassowary eggs, and every modded bird.
  It now takes the `EggsUnfertilized` category.

### Added

- French translation, 69 keys.
- `Patches/VanillaLikeWheat.xml`: where `Mlie.VanillalikeWheat` is loaded, `FZPlant_Wheat` loses
  its `sowTags` and leaves the sow menu, so there is only one wheat crop to choose from. The
  patch tests for the def `PlantWheat`, not for the mod's display name, which is Mlie's to change.
- Each recipe also accepts Mlie's `RawWheat`, through
  `<li MayRequire="Mlie.VanillalikeWheat">RawWheat</li>`.
- `packageId` `nelim.fullzooncookies`. The original has none; 1.0 did not require it.

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
