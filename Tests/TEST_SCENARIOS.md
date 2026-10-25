# Functional scenarios, to be played in game

Mod XML only: no assembly, no Harmony, no tick, one patch operation.
Shared XML/reference/translation validators give automated static checks (see STATUS.md). Runtime behavior still need colony. Scenarios below do that, each with one thing to watch, one way to be wrong.

Mod never run in game. Until scenario 0 pass, nothing below worth playing.

**Setup for everything here.** Development mode on. Colony with grower, cook, growing zone
on ordinary soil, hydroponics basin, electric stove, fuelled stove, campfire. In store,
by debug spawn: chocolate, milk, berries, insect jelly, chicken egg, duck egg. Time 3x for slow ones, debug tool *Set growth to 100%* for anything else taking four days and a half.

---

## 0. It loads, and the defs resolve

**Do.** Start game with mod active, load any save.

**Expect.** No mod-related errors at startup. Continue later scenarios even after clean startup; XML behavior can still fail in use.

**Watch for in `Player.log`.** Four lines, each different meaning:

- `Could not resolve cross-reference to Verse.ThingDef named FZRawWheat` — item file not loaded, fifteen recipes lost main ingredient.
- `Could not resolve cross-reference ... named EggsUnfertilized` — egg category renamed by game update, egg biscuit has no egg.
- `XML error ... no parent named PlantBase` — wheat lost vanilla base it inherits from, meaning Core itself failed to load first.
- `Patch operation Verse.PatchOperationConditional ... failed` — Mlie patch. Inspect full operation error and active mod list; missing removal target or conflicting patch can also cause failure.

**If fails here, stop.** Everything below assumes defs live.

---

## 1. The wheat is where a crop should be

**Do.** Open growing zone plant selector on turn one, no research. Then open hydroponics basin plant selector.

**Expect.** *wheat plant* in both lists, immediately. No research prerequisite on def, fresh colony can sow it.

**Why it matters.** `sowTags` carries `Ground` and `Hydroponic`. Wheat in one list not other = one tag lost — see scenario 10, where losing `Ground` is exactly what Mlie patch does on purpose.

## 2. It grows in four days and a half, and gives six grain

**Do.** Sow one tile. Read growth percentage over a game day, then force 100% and harvest with grower.

**Expect.** Four days and a half at full light and fertility. Six *wheat grain* from one plant.
Harvest job slightly slower than rice: 250 work vs vanilla 200.

**Why it matters.** That 250 is the one number mod keeps from Fullzoon's redefinition of
`PlantBase` — plant carries it itself now, not inherited. Harvest feels exactly like rice = def lost own `harvestWork`.

## 3. The grain keeps forty days — and it is not baking-only

**Do.** Leave stack of wheat grain out of freezer, watch rot tooltip. Then separately queue *cook simple meal* at stove with only wheat grain in store.

**Expect.** Stack rots at forty days, destroyed rather than left rotten. **And cook accepts wheat grain for simple meal.**

**Why it matters, and what is wrong.** `FZRawWheat` inherits `PlantFoodRawBase`, putting it in
`PlantFoodRaw` category — same shelf as raw rice and potatoes. Every vanilla recipe filtering on `FoodRaw` takes it: simple, fine, lavish meals, pemmican, kibble. Earlier baking-only claim in README/About corrected 2026-09-13; grain category and gameplay unchanged.

## 4. Fifteen bills, two stoves, no campfire

**Do.** Open bills tab of electric stove, then fuelled stove, then campfire.

**Expect.** Fifteen entries at each of two stoves — five biscuits, each in x1, x5, x10 form. Nothing at campfire.

**Why it matters.** `recipeUsers` names `ElectricStove` and `FueledStove` only. Sixteenth entry, or any entry at campfire, = recipe edited with wrong list.

## 5. The batches multiply cleanly

**Do.** Run *bake egg biscuits*, then *bake egg biscuits x5*, then *bake egg biscuits x10*.

| Bill | Takes | Gives | Work |
|---|---|---|---|
| x1 | 5 grain, 1 egg | 5 biscuits | 300 |
| x5 | 25 grain, 5 eggs | 25 biscuits | 1500 |
| x10 | 50 grain, 10 eggs | 50 biscuits | 3000 |

**Why it matters.** x5 and x10 separate defs, not multiplier: every count typed by hand. Same check applies to other four biscuits, x1 costs: 6 grain with 1
chocolate and 2 milk, 6 grain and 4 milk, 6 grain and 4 berries, 8 grain and 2 insect jelly.
All five give five biscuits for 300 work at x1.

## 6. Any unfertilised egg, not only a chicken's

**Do.** With only duck egg in store, queue *bake egg biscuits*. Then put fertilised chicken egg in store, queue again.

**Expect.** Duck egg taken. Fertilised egg not.

**Why it matters.** Fullzoon's recipe named `EggChickenUnfertilized` outright, locking out nine other unfertilised eggs vanilla ships — duck, goose, turkey, emu, ostrich, cassowary, cobra,
iguana, tortoise — and every modded bird. Now takes `EggsUnfertilized` category; fertilised eggs sit in own category, stay out.

## 7. A biscuit is not a meal

**Do.** Leave colonist with biscuits in store, no meals. Watch them go hungry.

**Expect.** They walk past biscuits until hunger reaches *starving*, then eat exactly one.

**Why it matters.** `preferability` is `DesperateOnly`, `maxNumToIngestAtOnce` is 1, vanilla
chocolate arrangement. Colonist eating biscuits while merely *hungry* reads other preferability, meaning abstract base did not apply.

## 8. Eaten for pleasure, it pays joy and a memory

**Do.** Give colonist free time with biscuits in store. Watch recreation bar and mood tab.

**Expect.** Colonist goes to biscuit on own, recreation rises by biscuit's own amount — 0.10
egg biscuit, 0.13 chocolate chip cookie, 0.15 butter cookie, 0.08 berry biscuit,
0.20 insect jelly biscuit — under *gluttonous* recreation type. Mood memory appears for half a day,
worth +3, +5, +5, +3, +7 same order, each own line of text.

**What was wrong, and is fixed, found 2026-09-28 by reading game's code, not playing.** Colonist sent to food *for pleasure* by `JoyGiver_Ingest`, whose class reads fixed list of defs. Game's only one, `JoyGiverDef EatChocolate`, lists `Chocolate` and `InsectJelly`, port had no giver of own, so **no free colonist ever went to biscuit**: eaten only by starving colonist with nothing better,
preferability `DesperateOnly`. README and About description said opposite. Owner ruled biscuits get giver like chocolate's, `EatFZBiscuits` now lists the five, with chocolate's base
chance and joy kind.

**Play it as written.** Nothing seen working yet. Suite plays it (`Tests/Pickle/.../15-a-colonist-goes-
to-a-biscuit.feature`) for one biscuit, proves five memories wired in `12`. By hand, read job colonist takes when recreation low: `Ingest`, without hunger. **Two things to see with chocolate
beside it:** colonist with both chooses between them, both feed same tolerance, sharing
joy kind. Biscuit never chosen while chocolate is = giver's chance, not fault.

**Why it matters.** Fullzoon also shipped `AteFZfoods`, sixth thought worth **+99 mood** that
nothing referenced. Dropped. If +99 memory ever shows in that tab, a `tasteThought` points at wrong def.

## 9. Nothing else in the game was reparented

**Do.** Open info card of rice plant, then plant from mod loading after this one.

**Expect.** Both still carry Beauty, still sit under *Plants* in resource readout, still
harvest at vanilla speed.

**Why it matters.** This is the fault port exists for. Fullzoon declared own
`<ThingDef Name="PlantBase">` and `<RecipeDef Name="CookMealBase">` — abstract bases every
plant and every cooking recipe in game inherit from — under those exact names, and RimWorld
resolves `ParentName` to copy from highest-loading mod at or below def asking.
Every plant of every mod loading after this one could be reparented onto copy
with no `BeautyOutdoors`, no `Plants` category, harvest work 250. Both copies
deleted. Plant with no beauty in info card = one came back.

## 10. Two wheats in one colony

**Do.** Play once with Mlie's *Vanilla-like Wheat (Continued)* active, once without. Both
times, open growing zone plant selector and stove bill list.

**Expect.** Without: *wheat plant* in sow menu, recipes taking `FZRawWheat`. With: one
*wheat plant* in sow menu, Mlie's, fifteen recipes accepting Mlie's `RawWheat` as well
as this mod's grain. Tiles of `FZPlant_Wheat` already sown keep growing, stay harvestable — patch removes sow tags, not plant.

**Why it matters.** Patch tests for def `PlantWheat`, not mod's displayed name:
`PatchOperationFindMod` compares `ModMetaData.Name` by exact string equality, name is
Mlie's to change. Both wheats in sow menu with mod active = xpath no longer
matches — def renamed, or operation edited.

## 11. English, French and Chinese read through

**Do.** Restart in English, then French, then Chinese (Simplified). Open sow menu, stove bill list, item info card, mood tab carrying biscuit memory.

**Expect.** Every label and description in chosen language. No raw key on screen —
`FZRawWheat.label` printed literally = DefInjected path or file name no longer matches
targeted def.

**Why it matters.** 69 keys in each language, against 69 translatable strings. French is port's own work; Chinese is Fullzoon's, restored not thrown away.

---

## 12. New colony and existing-save persistence

**Preconditions.** RimWorld 1.6, Core and this mod only, development mode enabled.
Use new test colony and separate backup copy of existing 1.6 colony without this mod.
Never overwrite original save. Record game version, language, mod list.

**Do.** Start new colony, run scenarios 0-8. Keep grain, each biscuit, planted
wheat tile, growing-zone crop selection, stove bills, stockpile filters. Save,
quit, restart, reload. Repeat by adding mod to existing colony copy,
creating same objects, saving/reloading. Repeat UI inspection in English and French.

**Expect.** Both colonies load without mod-related errors; contents, counts, crop selection,
bills, filters survive reload. Wheat grows, can be harvested; recipes still execute.
No untranslated owned labels, clipped text, empty settings page or settings MainButton.
Inspect Player.log at startup, after actions, after reload; record actual results.

## 13. Migration from the original mod

**Dropped on 2026-09-28.** Owner ruled compatibility with saves from original mod not a goal, and
promise removed from README and CHANGELOG. Scenario kept as number so others
keep theirs; nothing to play. Preconditions needed save only original can make, and
nothing in port relies on answer.

## Result recording

For each scenario, record date, game version, ordered mod list, language, save origin,
expected versus observed result, pass/fail/unverified, Player.log evidence location.
After any fix, rerun affected scenario plus startup and reload checks. No
exception at startup alone does not prove later gameplay behavior.

## What these scenarios cannot answer

- **Side by side with the original mod.** defNames identical, so the two cannot load
  together: game complains about every one. That is warning README gives, not
  played: original declares no `packageId`, so game cannot be told to refuse the pair.
- **The Workshop listing.** Preview, icon, description read by Steam, not game.