# Testing

How this mod is tested, how many passes it needs, what each covers, and what has to be true before
`STATUS.md` may say `tested`. Written on 2026-09-28. **Nothing in the game has been run yet**, and
the Pickle suite this document plans does not exist: see "Where this stands".

The mod is XML and nothing else: no assembly, no Harmony, no tick, one conditional patch. Everything
that can be proved without a game is proved by the shared validators (`docs/runs/`). What remains
needs a colony, and the scenarios that describe it are in
[`_tools/FUNCTIONAL-SCENARIOS.md`](_tools/FUNCTIONAL-SCENARIOS.md), numbered 0 to 13.

## Where this stands

| Layer | State |
|---|---|
| Static checks (fields, references, types, DefInjected) | written by the collection, run and green on 2026-09-28: `docs/runs/2026-09-28.md` |
| Functional scenarios 0 to 13 | written with setup, actions and expected results; **none played** |
| Pickle suite (`Tests/Pickle/`) | **not written.** This is what blocks `done`; `STATUS.md` carries it in `remaining` |
| Compiled-code unit tests | not applicable: there is no code |

## What is Pickle's, what is manual, and why

Only what a running game can show belongs in Gherkin. Everything below needs one, so all of it
is a candidate; the column says how, and where a scenario cannot be automated it says why.

| Scenario | Pickle | Notes |
|---|---|---|
| 0 It loads, the defs resolve | yes | one scenario per pass: no error attributed to the mod at start |
| 1 The wheat can be sown | yes | ground and hydroponics, no research |
| 2 Growth time and yield | yes | growth is forced, the yield of six is read |
| 3 The grain rots at forty days and feeds ordinary meals | yes | the second half is the documented behaviour: a simple meal accepts the grain |
| 4 Fifteen bills, two stoves, none at the campfire | yes | bill lists read by recipe |
| 5 Batches multiply cleanly | yes | x1, x5 and x10 for one biscuit; the other four recipes are covered by the static checks |
| 6 Any unfertilised egg, not a fertilised one | yes | |
| 7 A biscuit is not a meal | yes | |
| 8 Eaten for pleasure: joy and a memory | yes | the five joy amounts and mood effects |
| 9 Nothing else reparented | yes | a vanilla plant keeps its beauty and its category |
| 10 Two wheats in one colony | yes, conditional | tagged `@requires:Mlie.VanillalikeWheat`; see the passes |
| 11 English, French, Chinese | one pass per language | never a language switch inside a run |
| 12 New colony, existing save, reload | partly | save and reload are automatable; a fresh colony through the menu is costly and is played once, in the final pass |
| 13 Migration from the original mod | **no, and not applicable to Pickle** | it needs a save made by the original, which cannot be produced here, and the original cannot be loaded beside this mod. It stays manual and `unverified` until such a save exists, or is declared not applicable to `tested` with that reason |

The `@review` captures (scenarios 1, 4, 8 and the gallery) assert nothing: a person opens each one.

## Passes

The original mod declares no `packageId`, so there is nothing to put in `incompatibleWith` and no
incompatibility pass is owed. Mlie's Vanilla-like Wheat is the only optional mod (Workshop
2717707382, `Mlie.VanillalikeWheat`); it is named in no `loadAfter`, so it has to be named in the
pass map.

| # | Pass | Mods | Language | Covers |
|---|---|---|---|---|
| 1 | `sans-facultatifs` | Core, the DLC, Harmony, RimLogging, Pickle, this mod | English | scenarios 0 to 9, 12 |
| 2 | `sans-facultatifs` | the same | French | 0, 11 |
| 3 | `avec-mlie` (`wsl-deps.avec-mlie.map`) | the same plus `Mlie.VanillalikeWheat 2717707382` | English | 0, 10, and 4 to 6 again with the second grain |
| 4 | `avec-mlie` | the same | French | 0, 11 |
| 5 | `galerie` | the bare set | English | the Workshop captures, in the order `PUBLICATION.md` will give |
| 6 | Chinese Simplified, only if the install has the language | the bare set | ChineseSimplified | 0, 11 |

Five passes are required, six if the install carries Chinese; a pass without it is `unverified`,
never skipped silently. One pass is one request, each with its own `-DepMap` and `-Language`, and a
fresh `-EvidenceDir`. The map for pass 3 ends with a newline.

## What has to be true before `tested`

`done` means ready to be played. `tested` means it was, and all of this holds:

1. **No scenario is left in `@wip`.** A scenario put aside is repaired and replayed, or deleted with
   its reason written down. A `@wip` that remains is waiting, not passed.
2. **Every conditional scenario has run.** Each `@requires:<packageId>` had its pass, on a map that
   mounts that mod, and its report was read: `setName`, the suite and the scenario names checked
   before quoting it, since the report folder is shared by the whole machine. A scenario skipped
   for want of its condition is not passed. Here: scenario 10, pass 3.
3. **No manual test is left to validate.** Each of scenarios 0 to 13 is either automated and green,
   or listed as not applicable with its reason. Scenario 13 needs that decision.
4. The suites ran green, the discovered and played counts agree, `exitReason` was read before the
   numbers, and the `Player.log` of each pass was read. The `@review` captures were opened.
5. English and French were checked in the game, with the developer mode on, since a missing key
   shows as accented gibberish only then. A capture without it proves nothing about keys.
6. Any scenario that failed was replayed green on a build containing its fix.

## Evidence: what to keep

Reports live on disk in `Tests/Pickle/Evidence/<run>/`, which is ignored by git, and never in the
repository. Give every request its own new `-EvidenceDir`: an existing one is never overwritten and
the new report lands in `<dir>-1`.

Keep, per pass, only what still proves something for the revision now in the repository:

- `summary.json` (or `summary.md`) and `junit.xml`, always;
- the `Player.log` of the pass;
- the `@review` captures that were actually opened, as JPEG, and nothing else from `screenshots/`;
- `no-report.txt`, if that is all the run left, which is a NO REPORT and never a pass.

Delete `report.html`, `messages.ndjson`, raw film frames, full-resolution PNGs, anything from a
superseded build, and everything older than the latest report of the same pass, unless it is the
sole proof of a check the latest run did not repeat. List what goes and what stays before deleting.
`Remove-Item` stops on capture names longer than the path limit: empty the folder with
`robocopy <empty folder> <target> /MIR`, then remove the shell. Never delete a report that
`STATUS.md` still points to: repoint it first.

The history is one text line per run in `docs/runs/`, never a folder.

## When to rerun

A change to a recipe, a def, the patch or a translation invalidates the scenarios that read it and
the static checks; the others stay valid. Mlie's mod changing invalidates pass 3 only. The audit of
`STATUS.md` replays the static checks each time, from the current revision and not from an old
report.
