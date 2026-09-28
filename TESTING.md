# Testing

How this mod is tested, how many passes it needs, what each covers, and what has to be true before
`STATUS.md` may say `tested`. Revised on 2026-09-28, after the Pickle suite was written. **Nothing has been
played in a game yet**: not one scenario of the suite, not one of the manual list.

The mod is XML and nothing else: no assembly, no Harmony, no tick, one conditional patch. What can be proved
without a game is proved offline. What remains needs a colony, and the manual scenarios that describe it are in
[`_tools/FUNCTIONAL-SCENARIOS.md`](_tools/FUNCTIONAL-SCENARIOS.md), numbered 0 to 13. The suite that plays them is
in [`Tests/Pickle/`](Tests/Pickle/README.md).

## Where this stands

| Layer | State |
|---|---|
| Static checks: fields, references, types, DefInjected | shared scripts of the collection, run and green on 2026-09-28: `docs/runs/2026-09-28.md` |
| `_tools/Check-Recipes.ps1` | written and run green on 2026-09-28: the fifteen recipes are five biscuits at x1, x5 and x10, multiples of one another, at the two stoves. Seen failing on three injected faults |
| `Tests/Pickle/Check-Steps.ps1` | written and run green on 2026-09-28: 30 scenarios in 14 features parse, every step line resolves to exactly one step, and the counts each pass must show are computed from the tags. Seen failing on four injected faults |
| Pickle suite | **written, never played.** 30 scenarios in 14 features, no local C# |
| Functional scenarios 0 to 13 | written with setup, actions and expected results; **none played** |
| Compiled-code unit tests | not applicable: there is no code |

## What is Pickle's, what is offline, what stays manual, and why

Every scenario of the manual list has a disposition. Nothing is left in the air: a scenario is played by the
suite, proved offline, not applicable with its reason, or open with what it is waiting for.

| Scenario | Disposition | Where, or why |
|---|---|---|
| 0 It loads, the defs resolve | **Pickle** | `01` every def is in the database, `02` nothing in the log belongs to the mod |
| 1 The wheat can be sown | **Pickle, the data half** | `07` and `08` assert what becomes of the crop's `sowTags`. The sow menu is vanilla's list built from them, and nothing of this mod draws it: not applicable |
| 2 Growth time and yield | **Pickle, the data half** | `03` asserts 4.5 days, a yield of six and the harvested grain. The growth engine is the game's, and Pickle's time steps move the calendar and grow nothing: not applicable |
| 3 The grain rots at forty days and feeds ordinary meals | **not applicable** | rot is the game's; the grain feeds meals because it inherits vanilla's raw plant food category and vanilla's meal recipes filter on it. That is a claim about vanilla's filter: the game is not under test |
| 4 Fifteen bills at two stoves | **Pickle** | `09` both stoves accept all fifteen. "And no bill at the campfire" is offline: `Check-Recipes.ps1` asserts `recipeUsers` is exactly the two stoves |
| 5 The batches multiply | **offline**, and Pickle for x1 | `Check-Recipes.ps1` asserts x5 and x10 are five and ten times x1 in ingredients, product and work; `10` bakes an x1 for real |
| 6 Any unfertilised egg | **Pickle** | `10` second scenario, a duck egg being the only egg in the colony. That a fertilised egg is refused is the ingredient filter's UI: not applicable |
| 7 A biscuit is not a meal | **Pickle, the data half** | `03` asserts the inherited `DesperateOnly`. Watching a starving colonist choose or refuse it needs a colony with no other food, and `test-colony` holds meals and pemmican it would take first: not applicable, the choice being vanilla's food logic, the same as for vanilla chocolate |
| 8 Eaten for pleasure, joy and a memory | **Pickle for the memory; the pleasure path is a defect, open** | `12` the five memories are wired and worth +3, +5, +5, +3 and +7; `03` the joy kind. The colonist is never sent to a biscuit for pleasure: see below. Open until the owner rules |
| 9 Nothing else reparented | **Pickle** | `03` vanilla rice keeps its beauty and its harvest work of 200; the wheat inherits the same base |
| 10 Two wheats in one colony | **Pickle, conditional** | `07` alone, `08` beside Mlie, `11` a bake with Mlie's grain; passes 1 and 3 |
| 11 English, French, Chinese | **Pickle**, one pass per language | `04`, `05` and `06`, generated from the defs and the translations |
| 12 New colony, existing save, reload | **Pickle**, two of the three | `13` grain, biscuits, a plant and a bill survive a save and a reload. **An existing save:** `test-colony` was written without this mod (its list has no `nelim.fullzooncookies`), so every `@save` scenario is this mod added to a save that never had it. **A new colony:** not applicable, the mod adds no def a new game generates or seeds differently from a loaded one |
| 13 Migration from the original | **open, not Pickle** | needs a save made by the original, which cannot be produced here, and the original cannot be loaded beside this mod. Stays `unverified` until such a save exists, or is declared not applicable to `tested` with that reason |

**The pleasure path, in full.** The biscuits carry a joy kind and an amount, so they pay joy whenever a colonist
ingests one. But the game's only ingesting joy giver, `JoyGiverDef EatChocolate` with `JoyGiver_Ingest`, searches
a fixed list, `Chocolate` and `InsectJelly`, and this mod does not add its biscuits to it. A colonist is therefore
never sent to a biscuit for pleasure; one is eaten only when a colonist is starving and has nothing else. The
README and the About description say the opposite. Read from the 1.6 assembly on 2026-09-28; recorded in
`STATUS.md`. Fixing the text or adding the biscuits to a joy giver is the owner's call. Once it is made, scenario 8's
pleasure half is replayed: a free colonist, biscuits in store, and the job `Ingest`.

The `@review` capture (`14`) asserts nothing: a person opens it.

## Passes

The original mod declares no `packageId`, so there is nothing to put in `incompatibleWith` and no incompatibility
pass is owed. Mlie's Vanilla-like Wheat (Workshop 2717707382, `Mlie.VanillalikeWheat`) is the one optional mod; it
requires SYR Processor Framework (2633514537), which the pass map lists first. The mod names none of them in a
`loadAfter`, so the pass map is where they are named.

| # | Pass | Mods | Language | Discovers, plays, skips by requirement |
|---|---|---|---|---|
| 1 | `sans-facultatifs` | Core, the DLC, Harmony, RimLogging, Pickle, LoadAudit, this mod | English | 24, 21, 3 |
| 2 | `sans-facultatifs` | the same | French | 16, 14, 2 |
| 3 | `avec-mlie` | the same plus SYR Processor Framework and Mlie's wheat | English | 23, 23, 0 |
| 4 | `sans-facultatifs`, only if the install carries the language | the same | ChineseSimplified | 16, 14, 2 |

Three passes are required, four with Chinese; a pass without the language is `unverified`, never skipped in
silence. One pass is one request, with its own `-DepMap` and `-Language` and a fresh `-EvidenceDir`; the exact
commands and filters are in `Tests/Pickle/README.md`. The numbers are computed from the tags by
`Check-Steps.ps1`, and a report that does not show them has found a wrong filter or a wrong tag. The skips in
passes 1, 2 and 4 are `08` and `11`, which need Mlie's mod: **a skip is not a pass**, and pass 3 is the only place
they play.

No French pass with Mlie's mod: the labels are this mod's own and Mlie's mod changes none of them. No gallery pass:
the Workshop images and their order belong to `PUBLICATION.md`, at the step after `tested`.

## What has to be true before `tested`

`done` means ready to be played. `tested` means it was, and all of this holds:

1. **No scenario is left in `@wip`.** A scenario put aside is repaired and replayed, or deleted with its reason
   written down. A `@wip` that remains is waiting, not passed. None is in the suite today.
2. **Every conditional scenario has run.** Each `@requires:<packageId>` had its pass, on a map that mounts that
   mod, and its report was read: `setName`, the suite and the scenario names checked before quoting it, since the
   report folder is shared by the whole machine. A scenario skipped for want of its condition is not passed. Here:
   `08` and `11` in pass 3, and `02` in every pass, for LoadAudit.
3. **No manual test is left to validate.** Each of scenarios 0 to 13 is automated and green, or listed above as
   not applicable with its reason. Two are open and must be closed first: 8, waiting on the owner's ruling, and
   13, waiting on a save made by the original or on a decision that it is not applicable.
4. The suites ran green, the discovered and played counts agree with the table above, `exitReason` was read before
   the numbers, and the `Player.log` of each pass was read. The `@review` capture was opened and looked at.
5. English and French were checked in the game, developer mode on: a missing key shows as accented gibberish only
   then, and a capture without it proves nothing about keys. `04`, `05` and `06` are that check for the defs.
6. Any scenario that failed was replayed green on a build containing its fix. **A first run will very probably
   fail somewhere**: nothing here has been played, and `Tests/Pickle/README.md` names what is least certain.

## Evidence: what to keep

Reports live on disk in `Tests/Pickle/Evidence/<run>/`, which is ignored by git, and never in the repository. Give
every request its own new `-EvidenceDir`: an existing one is never overwritten and the new report lands in
`<dir>-1`.

Keep, per pass, only what still proves something for the revision now in the repository:

- `summary.json` (or `summary.md`) and `junit.xml`, always;
- the `Player.log` of the pass;
- the `@review` captures that were actually opened, as JPEG, and nothing else from `screenshots/`;
- `no-report.txt`, if that is all the run left, which is a NO REPORT and never a pass.

Delete `report.html`, `messages.ndjson`, raw film frames, full-resolution PNGs, anything from a superseded build,
and everything older than the latest report of the same pass, unless it is the sole proof of a check the latest run
did not repeat. List what goes and what stays before deleting. `Remove-Item` stops on capture names longer than the
path limit: empty the folder with `robocopy <empty folder> <target> /MIR`, then remove the shell. Never delete a
report that `STATUS.md` still points to: repoint it first.

The history is one text line per run in `docs/runs/`, never a folder.

## When to rerun

A change to a recipe, a def, the patch or a translation invalidates the scenarios that read it and the static
checks; the others stay valid. Regenerate `04`, `05` and `06` with `Tests/Pickle/Generate-LabelFeatures.ps1` after
any text change. Mlie's mod changing invalidates pass 3 only. The audit of `STATUS.md` replays the static checks
each time, from the current revision and not from an old report.
