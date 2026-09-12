# Functional scenarios, to be played in game

This mod is XML and nothing else: no assembly, no Harmony, no tick, and a single patch operation.
So there is no out-of-game suite next door to run first — there is no code to run. Everything the
mod claims happens in a colony, and only a colony can answer for it. These are the scenarios that
do, written so each one has a single thing to watch and a single way of being wrong.

The mod has never been run in a game. Until scenario 0 passes, nothing below is worth playing.

**Setup for everything here.** Development mode on. A colony with a grower, a cook, a growing zone
on ordinary soil, a hydroponics basin, an electric stove, a fuelled stove and a campfire. In store,
by debug spawn: chocolate, milk, berries, insect jelly, a chicken egg and a duck egg. Time controls
at 3x for the slow ones, and the debug tool *Set growth to 100%* for anything that would otherwise
take four days and a half.

---

## 0. It loads, and the defs resolve

**Do.** Start the game with the mod active and load any save.

**Expect.** No red at startup. The mod does nothing at any other moment — no assembly, no tick, no
job — so a fault that is not here is not anywhere.

**Watch for in `Player.log`.** Four lines, each meaning something different:

- `Could not resolve cross-reference to Verse.ThingDef named FZRawWheat` — the item file did not
  load, and the fifteen recipes have lost their main ingredient.
- `Could not resolve cross-reference ... named EggsUnfertilized` — the egg category was renamed by
  a game update, and the egg biscuit has no egg.
- `XML error ... no parent named PlantBase` — the wheat has lost the vanilla base it now inherits
  from, which would mean Core itself failed to load first.
- `Patch operation Verse.PatchOperationConditional ... failed` — the Mlie patch. Being conditional
  it cannot fail on a missing target, so this line means the xpath itself is malformed.

**If it fails here, stop.** Everything below assumes the defs are live.

---

## 1. The wheat is where a crop should be

**Do.** Open a growing zone's plant selector on turn one, without researching anything. Then open
the plant selector of a hydroponics basin.

**Expect.** *wheat plant* in both lists, immediately. No research prerequisite exists on the def,
so a fresh colony can sow it.

**Why it matters.** `sowTags` carries `Ground` and `Hydroponic`. If the wheat appears in one list
and not in the other, one of the two tags was lost — and see scenario 10, where losing `Ground` is
exactly what the Mlie patch does on purpose.

## 2. It grows in four days and a half, and gives six grain

**Do.** Sow one tile. Read the growth percentage over a game day, then force it to 100% and
harvest it with a grower.

**Expect.** Four days and a half at full light and fertility. Six *wheat grain* from the one plant.
The harvest job is a touch slower than rice: 250 work against vanilla's 200.

**Why it matters.** That 250 is the one number this mod keeps from Fullzoon's redefinition of
`PlantBase` — the plant carries it itself now, rather than inheriting it. If harvesting feels
exactly like rice, the def has lost its own `harvestWork`.

## 3. The grain keeps forty days — and it is not baking-only

**Do.** Leave a stack of wheat grain out of a freezer and watch its rot tooltip. Then, separately,
queue *cook simple meal* at a stove with nothing but wheat grain in store.

**Expect.** The stack rots at forty days and is destroyed rather than left rotten. **And the cook
accepts the wheat grain for the simple meal.**

**Why it matters, and what is wrong.** `FZRawWheat` inherits `PlantFoodRawBase`, which puts it in
the `PlantFoodRaw` category — the same shelf as raw rice and potatoes. Every vanilla recipe that
filters on `FoodRaw` therefore takes it: simple, fine and lavish meals, pemmican, kibble. The
`README.md`, the `CHANGELOG.md` and the `About.xml` description all say the grain is *good for
nothing but baking*, and that sentence is false. Either the sentence goes, or the item leaves the
category — and leaving the category would also stop animals grazing on a dropped stack and change
what a hauler thinks it is holding, which is probably not wanted. **Settle it before publishing.**

## 4. Fifteen bills, two stoves, no campfire

**Do.** Open the bills tab of the electric stove, then of the fuelled stove, then of the campfire.

**Expect.** Fifteen entries at each of the two stoves — five biscuits, each in an x1, an x5 and an
x10 form. Nothing at the campfire.

**Why it matters.** `recipeUsers` names `ElectricStove` and `FueledStove` and nothing else. A
sixteenth entry, or any entry at the campfire, means a recipe was edited with the wrong list.

## 5. The batches multiply cleanly

**Do.** Run *bake egg biscuits*, then *bake egg biscuits x5*, then *bake egg biscuits x10*.

| Bill | Takes | Gives | Work |
|---|---|---|---|
| x1 | 5 grain, 1 egg | 5 biscuits | 300 |
| x5 | 25 grain, 5 eggs | 25 biscuits | 1500 |
| x10 | 50 grain, 10 eggs | 50 biscuits | 3000 |

**Why it matters.** The x5 and the x10 are separate defs, not a multiplier: every count in them was
typed by hand. The same check applies to the other four biscuits, whose x1 costs are 6 grain with 1
chocolate and 2 milk, 6 grain and 4 milk, 6 grain and 4 berries, and 8 grain and 2 insect jelly.
All five give five biscuits for 300 work at x1.

## 6. Any unfertilised egg, not only a chicken's

**Do.** With only a duck egg in store, queue *bake egg biscuits*. Then put a fertilised chicken egg
in store and queue it again.

**Expect.** The duck egg is taken. The fertilised egg is not.

**Why it matters.** Fullzoon's recipe named `EggChickenUnfertilized` outright, which locked out the
nine other unfertilised eggs vanilla ships — duck, goose, turkey, emu, ostrich, cassowary, cobra,
iguana and tortoise — and every modded bird. It takes the `EggsUnfertilized` category now, and
fertilised eggs sit in a category of their own, so they stay out.

## 7. A biscuit is not a meal

**Do.** Leave a colonist with biscuits in store and no meals. Watch them go hungry.

**Expect.** They walk past the biscuits until hunger reaches *starving*, and then eat exactly one.

**Why it matters.** `preferability` is `DesperateOnly` and `maxNumToIngestAtOnce` is 1, the vanilla
chocolate arrangement. A colonist who eats biscuits while merely *hungry* is reading some other
preferability, which would mean the abstract base did not apply.

## 8. Eaten for pleasure, it pays joy and a memory

**Do.** Give a colonist free time with biscuits in store. Watch the recreation bar and the mood tab.

**Expect.** Recreation rises by the biscuit's own amount — 0.10 for the egg biscuit, 0.13 for the
chocolate chip cookie, 0.15 for the butter cookie, 0.08 for the berry biscuit, 0.20 for the insect
jelly biscuit — under the *gluttonous* recreation type. A mood memory appears for half a day,
worth +3, +5, +5, +3 and +7 in the same order, each with its own line of text.

**Why it matters.** Fullzoon also shipped `AteFZfoods`, a sixth thought worth **+99 mood** that
nothing referenced. It is dropped. If a +99 memory ever shows up in that tab, a `tasteThought` is
pointed at the wrong def.

## 9. Nothing else in the game was reparented

**Do.** Open the info card of a rice plant, then of a plant from a mod loading after this one.

**Expect.** Both still carry Beauty, still sit under *Plants* in the resource readout, and still
harvest at vanilla speed.

**Why it matters.** This is the fault the port exists for. Fullzoon declared his own
`<ThingDef Name="PlantBase">` and `<RecipeDef Name="CookMealBase">` — the abstract bases every
plant and every cooking recipe in the game inherit from — under those exact names, and RimWorld
resolves a `ParentName` to the copy from the highest-loading mod at or below the def asking for
it. Every plant of every mod loading after this one could have been reparented onto a copy that
carried no `BeautyOutdoors`, no `Plants` category and a harvest work of 250. Both copies are
deleted. A plant with no beauty in its info card would mean one came back.

## 10. Two wheats in one colony

**Do.** Play once with Mlie's *Vanilla-like Wheat (Continued)* active, and once without. Both
times, open a growing zone's plant selector and a stove's bill list.

**Expect.** Without it: *wheat plant* in the sow menu, recipes taking `FZRawWheat`. With it: one
*wheat plant* in the sow menu, Mlie's, and the fifteen recipes accepting Mlie's `RawWheat` as well
as this mod's grain. Tiles of `FZPlant_Wheat` already sown keep growing and stay harvestable — the
patch removes the sow tags, not the plant.

**Why it matters.** The patch tests for the def `PlantWheat`, not for the mod's displayed name:
`PatchOperationFindMod` compares `ModMetaData.Name` by exact string equality, and that name is
Mlie's to change. If both wheats appear in the sow menu with that mod active, the xpath no longer
matches — the def was renamed, or the operation was edited.

## 11. French and Chinese read through

**Do.** Restart in French, then in Chinese (Simplified). Open the sow menu, a stove's bill list, an
item's info card, and a mood tab carrying a biscuit memory.

**Expect.** Every label and every description in the chosen language. No raw key on screen —
`FZRawWheat.label` printed literally means the DefInjected path or the file name no longer matches
the def it targets.

**Why it matters.** 69 keys in each language, against 69 translatable strings. The French is the
port's own work; the Chinese is Fullzoon's, restored rather than thrown away.

---

## What these scenarios cannot answer

- **Side by side with the original mod.** The defNames are identical, so the two cannot be loaded
  together: the game complains about every one of them. That a save moves from one to the other is
  the thing the port preserved, and it can only be tested by swapping the mods between two loads of
  the same colony.
- **The Workshop listing.** Preview, icon and description are read by Steam, not by the game.
