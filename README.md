# Fullzoon's Cookies Renew (unofficial)

UNOFFICIAL. This mod is published without the original author's explicit consent. If the original author contacts me to request its removal, I undertake to take it down promptly.

Port of **Fullzoon's 满月的饼干Cookies** to RimWorld 1.6.

**I am not the author of this mod.** The wheat, the five biscuits, their recipes and their
artwork are Fullzoon's — all I did was bring them to 1.6, fix what was broken, and write the
English. Credit goes to them; mistakes in the port are mine.

Original mod: https://steamcommunity.com/sharedfiles/filedetails/?id=1623487558 (declares 1.0 and
nothing since). The page is still online; the mod is abandoned, not withdrawn.

## What the mod does

A wheat crop, and five biscuits baked from it at either vanilla stove.

| Biscuit | Ingredients | Joy | Mood | Value |
|---|---|---|---|---|
| **Egg biscuit** | 5 wheat, 1 egg | 0.10 | +3 | 3.0 |
| **Chocolate chip cookie** | 6 wheat, 1 chocolate, 2 milk | 0.13 | +5 | 3.6 |
| **Butter cookie** | 6 wheat, 4 milk | 0.15 | +5 | 4.3 |
| **Berry biscuit** | 6 wheat, 4 berries | 0.08 | +3 | 2.8 |
| **Insect jelly biscuit** | 8 wheat, 2 insect jelly | 0.20 | +7 | 5.5 |

Each recipe yields five and comes in an ×1, an ×5 and an ×10 form, so filling a stockpile does
not mean queueing fifteen bills. Work scales with the batch: 300, 1500, 3000.

Biscuits are gluttonous snacks in the mould of vanilla chocolate — 0.09 nutrition, `DesperateOnly`
so colonists avoid them for ordinary meals, and worth joy and a half-day mood memory when eaten for
pleasure.

The wheat sows on ordinary soil or in hydroponics, grows in 4.5 days and yields six grain. The
grain keeps forty days and can be used for biscuits and ordinary meals.

No DLC required. No assembly, no framework, no dependency. English, French, and Fullzoon's own
Chinese.

Content mod: removing it mid-save destroys any biscuits already baked and any wheat in the ground.

## What the port fixed

Two of these were live faults, not version drift. They are covered in full in
[ATTRIBUTION.md](ATTRIBUTION.md); in short:

**The mod redefined `PlantBase`** — the abstract def every plant in RimWorld inherits from — under
that exact name, and its copy was not faithful: no `BeautyOutdoors`, no `Plants` category,
`harvestWork` 250 instead of 200. Two abstract defs may share a `Name` without error;
`GetBestParentFor` resolves each `ParentName` to the copy from the highest-loading mod at or below
the def asking for it, so every plant of every mod loading after this one could quietly have been
reparented onto it.

**It also redefined `CookMealBase`**, the base of every cooking recipe, from 1.0 — so missing the
Anomaly exclusion of twisted meat. Not one of the fifteen recipes ever inherited from it.

Both copies are deleted. The wheat inherits the real `PlantBase` and carries its own
`harvestWork` of 250.

**A sixth thought, `AteFZfoods`, was worth +99 mood** for a day. Nothing referenced it, so it
never fired. Dropped.

**The egg biscuit asked for chicken eggs by name**, locking out the nine other unfertilised eggs
vanilla ships and every modded bird. It takes the `EggsUnfertilized` category now.

## Runs alongside Vanilla-like Wheat

Mlie's **Vanilla-like Wheat (Continued)** (`Mlie.VanillalikeWheat`) grows wheat too. Nothing
collides — the `defName`s differ — but two entries called *wheat plant* in one growing zone help
nobody, and the two crops work differently:

| | Fullzoon | Mlie |
|---|---|---|
| Crop | 4.5 days, yield 6, no research | 9.8 days, yield 17, research + growing 6 |
| Harvest | bake with it directly | must be milled into flour |
| Chain | none | SYR Processor Framework, ovens, bread, cake |

Where Mlie's mod is loaded, this one stands down: `FZPlant_Wheat` loses its `sowTags` and leaves
the sow menu, and the fifteen recipes take Mlie's `RawWheat` instead — they accept both, through
`MayRequire`. Neither mod is required by the other.

This mod's grain is labelled **wheat grain**, not *wheat*, so the two never read alike in a
stockpile filter.

## Compatibility with the original

The original `defName`s are kept to support save continuity. Migration from the original mod has not yet been validated in game; back up your save before switching.

The original has **no `packageId`** — 1.0 did not require one — so it cannot be declared in
`<incompatibleWith>`. Do not run the two together anyway: the `defName`s are the same and the game
will complain about every one of them.

## Credit and removal

The wheat, the biscuits, their recipes and their artwork are Fullzoon's work. Fullzoon declared
no licence — no file, no clause in the mod's own description — and the mod has not moved past 1.0.
It is republished here under the usual convention for abandoned mods: full credit, a link to the
original, and removal on request.

**If Fullzoon would rather this port did not exist, say so and it comes down** — no argument, no
delay.

If I do not answer within a reasonable time after being contacted, anyone may freely update this
or any other of my mods, including publishing a continuation of it. All credit must be preserved.

See [ATTRIBUTION.md](ATTRIBUTION.md) for what was taken and what was changed, and
[LICENSE](LICENSE) for what the licence does and does not cover.
