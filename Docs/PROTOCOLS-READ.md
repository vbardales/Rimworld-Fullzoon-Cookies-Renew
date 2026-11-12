# Protocol documents read

Which document was read, at which version, and whether it was of any use to this mod. The point is
to know, when one of them moves, whether it is worth reading again. Read on 2026-09-28, in the
session `local_e26c87bd-50c9-4420-aba0-572f5dd2f69d`.

The protocol documents are versioned in `vbardales/Rimworld-protocols` (git dir
`../rimworld-protocols.git`, work tree = the collection root), not in the collection's own
repository: `git log` run from there returns the commit that removed them. Versions below come
from the protocols repository. A file with uncommitted changes is identified by its hash, which is
the only thing that pins what was read.

## Protocols

| Document | Version read | Useful here? |
|---|---|---|
| `AGENTS.md` | `3a1d2cb` 2026-09-24, clean, `a19ad03796` | **Yes.** The two gates (settings, then translations) before `preTest`; the rule on test evidence |
| `AUDIT.md` | `c5ca0c0` 2026-09-26 **plus uncommitted changes**, `8a2f3ccb3c`. Read first at `c73fef75e7`, then again after step 12 (`done -> showcase`, 2026-09-28) was added | **Yes**, it is the audit that was applied |
| `PUBLISHING.md` | `95c6dfd` 2026-09-28, clean, `fa8058f54b` | **Yes.** Start from the original's repository; the `(unofficial)` rule; the packageId rule of 2026-09-27; what the 0.1.0 prepublication is |
| `TRANSLATIONS.md` | `f5c2d9d` 2026-09-25, clean, `ffd31ca283` | **Yes.** Replayed for step 12, including the counts-and-plurals rule of 2026-09-25 (does not apply: no counted phrase, no parameter) |
| `MOD_SETTINGS.md` | `b83933b` 2026-09-23, clean, `436bfb7403` | **Yes**, briefly: an XML-only mod with no settings needs its absence justified, and it is |
| `STYLE_RIMWORLD.md` | `7311308` 2026-09-25 **plus uncommitted changes**, `10238d561c` | **Yes** for the preview overlay, the palette file, the icon check and the Explorer icons. Not the prompt blocks: no image is generated here |
| `WORKSHOP_COMMENTS.md` | `dea856b` 2026-09-28 **plus uncommitted changes**, `405dc82217` | **Later.** Needed at `tested -> prepublished`. Neither Fullzoon's page (1623487558) nor Mlie's Vanilla-like Wheat (2717707382) has a row in the register yet |
| `scripts/SEARCHING.md` | `372c447` 2026-09-23 **plus uncommitted changes**, `3695b05797` | **No.** No corpus search was needed. Its warning about unbounded `find` and `grep` was honoured. Read again only for a defName-collision search |

## Tools and queue

| Document | Version read | Useful here? |
|---|---|---|
| `PickleTools/README.md` | `c771bef` 2026-09-25, `2e26bfc661` | **Yes**, the table of shared tools: LoadAudit is the one this suite stages |
| `PickleTools/Headless/README.md` | `ed4e73a` 2026-09-26, `fe33491fb3` | **Partly.** Passes, `wsl-deps` maps, exit codes and the evidence directory shaped `TESTING.md`. No run was launched |
| `PickleTools/docs/steps.md` | `96eda0f` 2026-09-28, `29f9265d9b` | **Partly.** The tool sections and the ExpansionSteps, LoadAudit and ScreenshotMode tables were read for the suite; the rest of it was not |
| `Rimworld-Release-Admin/docs/OPERATIONS.md` | `3c03f51` 2026-09-26, `82bcd0f7db` | **Partly.** The first-publication path and the CI rules; nothing is published from here yet |
| `Rimworld-Ticket-Dispatcher/docs/WELCOME.md` | `77ca9d7` 2026-09-27, `e25a71e7cf` | **Yes.** The rules on `desktop.ini` and `.ico` in `Mod/`, on deleting evidence with long names, and where protocol versions live |
| `Rimworld-Ticket-Dispatcher/docs/SUBMIT.md` | `d07b2b8` 2026-09-26, `cfe2c10876` | **Not yet.** Needed the day a run is submitted |

Not in the list given for the first session and read afterwards, to write the suite:

| Document | Version read | Useful here? |
|---|---|---|
| `PickleTools/Authoring/README.md` | `8d3ca6d` 2026-09-26, `897a405797` | **Yes**, it is the guide the suite was written from: layout, pass maps, `@requires`, the timeouts, evidence |
| Pickle's own `Docs/steps.md`, upstream repository `RimWorks/Rimworld-Pickle`, tag `v4.9.1` | read from GitHub, `31322` bytes. The installed Pickle is 4.9.1 (`4.9.1+e22b90a`); the current `v4.10.2` differs only by a world-camera section | **Yes**, it is the catalogue the steps come from. The staged copy in the WSL install was not read: the WSL did not answer in time |

## This mod's own documents

| Document | State on 2026-09-28 |
|---|---|
| `STATUS.md` | read in full, rewritten by the audit of that day |
| `README.md`, `ATTRIBUTION.md`, `LICENSE`, `Mod/About/About.xml` | read in full |
| `CHANGELOG.md` | read and reorganised: `1.0.0` unreleased above the new `0.1.0` |
| `_tools/FUNCTIONAL-SCENARIOS.md` | read: scenarios 0 to 13, all manual, none played |
| `TESTING.md` | did not exist, written on that day, revised the same day after the suite |
| `docs/runs/` | did not exist, opened on that day |
| `Tests/Pickle/` | written on that day, never played |
| `PUBLICATION.md`, `BACKLOG.md`, `NOTES.md`, `BUGS.md` | do not exist |

## Second pass, 2026-10-02 (session `local_3bd3240e-8e04-46ee-8ebb-6a591416d67f`)

`AUDIT.md` was read in full again. For the others only the **diff since the version recorded above** was read
(`git --git-dir=../rimworld-protocols.git diff <old> -- <file>`); a file not listed as read in full was not re-read in
full. A document whose hash is unchanged below is not worth reading again.

| Document | Version now | What changed since the first pass, and does it touch this mod? |
|---|---|---|
| `AGENTS.md` | `7fd7475` 2026-09-29, `44dddcbc8f` | Reworded shorter; the two gates and the evidence rule are the same, plus: published mods get `docs/runs/history.md` trimmed. **No effect now** (not published) |
| `AUDIT.md` | `d1fdbe1` 2026-10-02, `daab030ccf` | Read in full. New: Pickle pass order (never-played and red first, non-regression together at the end); WSL cleanup of downloaded Workshop mods at sleep time; `tested` needs no `@wip`, every `@requires` run, no manual test left. **All applied** |
| `PUBLISHING.md` | `4e8f11a` 2026-10-02, `11de03424f` | New: PR to the original's repo is systematic (none exists here); gallery `0-preview.png` rule and one-digit numbering; Preview badge; animal-mod integrations (**does not apply: no animal**). Useful at `tested -> prepublished` |
| `TRANSLATIONS.md` | `af8427f` 2026-10-02, `7b4d9a23bd` | New: French gender agreement and neutral forms (2026-09-30). **Replayed in STATUS.md**: no text agrees with a pawn. `translation_fr` stays `partial` until Virginie reads it |
| `MOD_SETTINGS.md` | `b83933b` 2026-09-23 | Unchanged commit. Not re-read; not useful again for an XML mod without settings |
| `STYLE_RIMWORLD.md` | `c105a43` 2026-10-01 plus uncommitted changes, `773961397c` | Not re-read. Preview typography and line-art protocol moved; nothing is regenerated here |
| `WORKSHOP_COMMENTS.md` | `7fd7475` 2026-09-29, `cdd3381ba9` | Not re-read; needed at `tested -> prepublished` |
| `scripts/SEARCHING.md` | `50de695` 2026-09-28, `45f0fa13cc` | Not re-read; not useful, no search needed |
| `PickleTools/README.md`, `Headless/README.md`, `docs/steps.md`, `Authoring/README.md` | no commit; hashes `1d28b27e67`, `c023a674fb`, `8639a06971`, `75329decf2` | Not re-read in full. Useful again when a pass is filed or a step is added |
| `Rimworld-Release-Admin/docs/OPERATIONS.md`, `Rimworld-Ticket-Dispatcher/docs/WELCOME.md`, `SUBMIT.md` | no commit; hashes `347a0d63b9`, `1bdd1eed63`, `7ab5e437d4` | Not re-read. `SUBMIT.md` becomes needed the day scenario 15 or pass 3 is filed |

This mod's own `BACKLOG.md`, `NOTES.md`, `BUGS.md` and `PUBLICATION.md` still do not exist. `PUBLICATION.md` is owed at
`tested -> prepublished`; `BACKLOG.md` only if a PR to the original becomes possible (it has no repository).
