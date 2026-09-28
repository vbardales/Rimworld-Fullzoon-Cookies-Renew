# Pickle suite for Fullzoon's Cookies Renew

In-game scenarios for a mod that ships defs and one conditional patch, no code. **Written on 2026-09-28 and
never played.** No request was filed, no game was started, and everything below that says what a scenario
shows is what it is written to show. `../../TESTING.md` says what belongs here, what stays manual and why.
Nothing in this folder is part of `Mod/`, which is what Steam receives whole.

There is no local C#: no `Source/`, no assembly. The suite uses Pickle's own steps and the two steps of
`PickleTools/LoadAudit`, and it is played on `test-colony`, the save Pickle ships.

## What is asserted

| Feature | Tags | Passes | Asserts |
|---|---|---|---|
| `01-the-mod-loads` | | all | the mod is loaded, and its seven things, five memories and fifteen recipes are in the database the game built, and so is the joy giver that sends a colonist to a biscuit |
| `02-the-load-is-clean` | `@requires` LoadAudit | all | nothing in the game log, from the start of the run, belongs to the mod as an error, a warning, an unresolved def or a message repeated five times |
| `03-def-claims` | | all | as the game merged them: vanilla rice keeps the plant base's beauty and its harvest work of 200; the wheat inherits the same base and keeps its own 250, grows in 4.5 days and yields six; each biscuit inherits `DesperateOnly` and `Gluttonous` from the snack base |
| `04-labels-en`, `05-labels-fr`, `06-labels-zh` | `@en-only`, `@fr-only`, `@zh-only` | one language each | the label and description of the crop, the grain and the five biscuits, and the label of the fifteen bills, as the loaded defs hold them in the language the game started in. **Generated** |
| `07-wheat-alone` | `@wheat-alone` | without Mlie | the other wheat is absent and the patch changed nothing |
| `08-wheat-beside-mlie` | `@requires` Mlie | with Mlie | the other wheat is there, the patch took by this mod, and the crop still exists with its grain |
| `09-bills-at-the-stoves` | `@save` | all but the languages | both vanilla stoves accept all fifteen bills, queued without an error |
| `10-a-real-bake` | `@save @slow` | English passes | a colonist bakes five egg biscuits from grain and a chicken egg, then from grain and a duck egg |
| `11-a-real-bake-with-mlie-grain` | `@requires` Mlie, `@save @slow` | with Mlie | the same bake with Mlie's `RawWheat` |
| `12-the-memories` | `@save` | English passes | the five memories are wired and worth +3, +5, +5, +3 and +7 |
| `13-the-save-round-trips` | `@save` | English passes | grain, biscuits, a plant of the crop and a queued bill come back after a save and a reload |
| `14-a-capture` | `@save @review` | English passes | one capture of the five biscuits and the grain, for a person to open |
| `15-a-colonist-goes-to-a-biscuit` | `@save @slow` | English passes | a colonist with time to spare is sent to an insect jelly biscuit by the joy giver, eats it and keeps its memory |

Thirty-two scenarios in fifteen features. What each pass should discover, play and skip is computed by
`Check-Steps.ps1` from the tags, and is the number a report has to match.

## Three limits worth knowing before reading a green

**The joy giver, and what is not here.** Until 2026-09-28 a colonist never chose a biscuit for pleasure: the
game's only ingesting joy giver, `EatChocolate`, searches `Chocolate` and `InsectJelly` by name, and the port had
no giver of its own. It has one now, `EatFZBiscuits`, and `01` asserts it exists. `15` asks the game to use it,
and is the least deterministic scenario of the suite, since it asks the game to *choose*. The memories are
tested by giving them in `12`, which proves they are wired, not when they fire; `15` is where one fires. A
colonist starving beside a biscuit is not tested, because `test-colony` holds meals and pemmican that it would
take first.

**The bakes are the least certain part.** `10` and `11` lean on a cook made able by two vanilla backstories
(`SewerKid57`, `StewKeeper95`), on a fuelled stove that starts empty and is refuelled from the stockpile, and on
`I wait for bill`, which allows 120 real seconds. The scenarios assert the cook's capabilities before they rely
on them, and are tagged `@slow @timeout:300`. If the first run fails there, read the cook, the fuel and the
haul before blaming a recipe.

**Field values are asserted as strings.** `def "X" field "plant.harvestWork" is "250"` compares what the game
prints for the field. A whole number, a decimal and an enum name each have a precedent in another suite of the
collection (`baseCost is "400"`, `alternateGraphicChance is "0.8"`, `category is "Item"`). A dotted path into a
nested object is Pickle's documented form and no other suite uses one: `plant.harvestWork` and
`ingestible.preferability` are the first, and the first run settles whether they print as written here.

## Regenerating the labels

`04`, `05` and `06` are written by `Generate-LabelFeatures.ps1` from `Mod/Defs` and `Mod/Languages`, so a text is
never typed twice. Run it whenever a label, a description or a translation changes; `git diff` says what moved.

```text
powershell.exe -ExecutionPolicy Bypass -File Tests/Pickle/Generate-LabelFeatures.ps1
```

## Checking without the game

```text
powershell.exe -ExecutionPolicy Bypass -File Tests/Pickle/Check-Steps.ps1
powershell.exe -ExecutionPolicy Bypass -File _tools/Check-Recipes.ps1
```

`Check-Steps.ps1` compiles Pickle's own vocabulary and the staged tool's, and checks that every step line of
every feature resolves to exactly one step, that every feature parses and holds no step outside a scenario, and
that a pass map ends with a newline and names a tool that exists. It was seen failing on an invented step, on a
missing newline, on a missing tool and on a misspelt keyword, and it prints the counts above. It proves the text
of a step exists, not that the step does what a scenario hopes.

## Passes

One request per pass, deposited from the collection root and never a launcher run by hand: `AUDIT.md` first, and
`Rimworld-Ticket-Dispatcher/docs/WELCOME.md` for the protocol. A first or a final validation plays every scenario
of its pass; a fix or an exploration plays as little as possible, `-Filter '::<scenario name>'`. The exclusions
below are not a subset chosen to save time: they leave out what makes no sense in that pass, such as the French
labels in an English game. The name in the filter is the test companion's display name, which has no apostrophe
so that it needs none in PowerShell.

```text
Submit-PickleRun.ps1 -Mod FullzoonCookiesRenew -Owner local_<session id> -Label "<what is tested> <sha>" -EvidenceDir FullzoonCookiesRenew/Tests/Pickle/Evidence/<a new folder>
```

| # | Pass | Extra arguments | Discovers, plays, skips |
|---|---|---|---|
| 1 | bare, English | `-DepMap wsl-deps.sans-facultatifs.map -Language English -Filter 'Fullzoon Cookies Renew - Pickle tests,!@fr-only,!@zh-only'` | 26, 23, 3 |
| 2 | bare, French | `-DepMap wsl-deps.sans-facultatifs.map -Language French -Filter 'Fullzoon Cookies Renew - Pickle tests,!@en-only,!@zh-only,!@save'` | 17, 15, 2 |
| 3 | with Mlie, English | `-DepMap wsl-deps.avec-mlie.map -Language English -Filter 'Fullzoon Cookies Renew - Pickle tests,!@fr-only,!@zh-only,!@wheat-alone'` | 25, 25, 0 |
| 4 | bare, Chinese, if the install has it | `-DepMap wsl-deps.sans-facultatifs.map -Language ChineseSimplified -Filter 'Fullzoon Cookies Renew - Pickle tests,!@en-only,!@fr-only,!@save'` | 17, 15, 2 |

Skipped by requirement is what a pass without Mlie's mod must show for `08` and `11`: skipped counts, exclusions
do not, which is why `!@wheat-alone` and the language tags are exclusions and the requirements are not. **The
skip is not a pass.** Pass 3 is the only one where `08` and `11` play, and its report has to be read for them.

The original mod declares no `packageId`, so there is nothing to put in `incompatibleWith` and no incompatibility
pass is owed. Pass 3 needs Mlie's Vanilla-like Wheat (2717707382) and SYR Processor Framework (2633514537) in
the WSL install's Workshop cache; whether they are there has not been checked.

## Evidence

Reports go to `Tests/Pickle/Evidence/<run>/`, ignored by git, never in the repository. What to keep from a run and
what to delete is in `../../TESTING.md`. The history is one line per run in `../../docs/runs/`.
