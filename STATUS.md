---
localization:   complete
translation_en: complete
translation_fr: complete
settings_audit: not_applicable
mod:          Fullzoon's Cookies Renew (unofficial)
packageId:    nelim.fullzooncookies
repo:         Rimworld-Fullzoon-Cookies-Renew
visibility:   public
detached:     yes
stage:        done
workflow_stage: done
current_step: "waiting for request 20260928-131214-960-f08d, pass 1 of Tests/Pickle/README.md; the owner's ruling on scenario 13 is open (done -> tested)"
licence:      silent
licence_at:   no licence at any of the four places one could be - no LICENSE file in the mod, no mention in its About.xml, no linked repository, and nothing in the body of its Steam description. Read again on 2026-09-28 through the Steam Web API - last updated 2019-01-15, tag 1.0, no licence and no link in the description. The mod declares 1.0 and nothing since.
dependencies: none
showcase:     complete
tested_on:
workshop:     3806761765
remaining:
  - "unverified: the Pickle suite of `Tests/Pickle/` (32 scenarios in 15 features) has never been played, and neither has any manual scenario. Three passes are required, bare English, bare French and beside Mlie's wheat, and a fourth for Chinese Simplified if the install carries it. A first run will very probably fail somewhere: `Tests/Pickle/README.md` names what is least certain, the two bakes, and the way a dotted field path prints. Request 20260928-131214-960-f08d, pass 1, is in the queue."
  - "unverified: the joy giver `EatFZBiscuits`, added on 2026-09-28 on the owner's word, has never been seen working. Scenario 15 asks the game to choose it, and is the least deterministic scenario of the suite: a red there is to be read before it is blamed on the giver. Manual scenario 8 replays it by hand."
  - "unverified: whether the WSL install's Workshop cache holds Mlie's Vanilla-like Wheat (2717707382) and SYR Processor Framework (2633514537), which pass 3 stages. A missing one is a download through `Use-Wsl.ps1`."
  - "unverified: migration from the original mod (scenario 13). It needs a real save made by the original. Without one it must be declared not applicable to `tested` with that reason, since `tested` allows no manual test left to validate."
  - "unverified: whether Workshop item 3806761765 still holds the six `.dds` files of the 0.1.0 upload. The publication CI ships tracked files only, so the next upload should replace the folder. Look at the item after the first CI publish."
historical_remaining_2026_09_12:
  - unverified: the twelve scenarios of `_tools/FUNCTIONAL-SCENARIOS.md`, none of them played
  - defect: three documents say the wheat grain is good for nothing but baking, and it is not. Resolved on 2026-09-13, the README and the About description now say the grain feeds ordinary meals
  - defect: the icon's background is a wall of biscuits where the ModIcon block of `STYLE_RIMWORLD.md` asks for a plain near-black one. Accepted by the owner on 2026-09-13
session:      local_e26c87bd-50c9-4420-aba0-572f5dd2f69d
updated:      2026-09-28, joy giver added, audit replayed
audited_revision: 8b092c5cd13d84ce9f836a20d43d3f3183914971
---

# Fullzoon's Cookies Renew — status

## Where this mod stands

**Audit of 2026-09-28, later the same day: `preTest` becomes `done` again.** The section below, written that
morning, put the mod at `preTest` for one reason, and the reason is gone: the Pickle suite exists. The audit was
replayed for `preTest -> done` on the revision below, and nothing stands in its way. The section further down
keeps its reasoning as history.

`done` means ready to be played, not played. **Nothing has been played:** not one scenario of the suite, not one
manual scenario. The suite was written and checked offline, which is all `done` asks (`AUDIT.md`, the
clarification of 2026-09-21).

**Reading the game's code, to write the scenario for eating a biscuit for pleasure, found that it could not
happen, and the owner ruled the same day.** The mod's text says a colonist eats a biscuit for pleasure, and the
game never sent one: a colonist is sent to food for pleasure by a `JoyGiver_Ingest`, and the game's only one
lists `Chocolate` and `InsectJelly` by name. The owner ruled that the biscuits get a joy giver like the
chocolate's, and `EatFZBiscuits` (`Mod/Defs/JoyGiverDefs/`) now lists the five, with chocolate's own base
chance and joy kind. Nothing is patched. **It has not been seen working:** scenario 15 asks the game to choose
it and is the least deterministic scenario there is; see `remaining`. The text of the README and the About
description is true again, and was extended by a sentence saying so.

### Replay of `preTest -> done`, revision `8b092c5cd13d84ce9f836a20d43d3f3183914971` (`8b092c5`)

| Criterion | Result |
| --- | --- |
| Functional scenarios written with setup, actions and expected results | Met. Scenarios 0 to 13 of `_tools/FUNCTIONAL-SCENARIOS.md`. Scenario 8 now says what is wrong with its own expectation |
| Automated tests written, executed and green | Met. The four shared validators (`Check-XmlFields`, `Check-DefRefs`, `Check-TypeRefs`, `Check-DefInjected`) were replayed on `8b092c5`, after `Mod/` gained the joy giver: 8 files, 28 defs, 138 keys, no fault. `_tools/Check-Recipes.ps1` and `Tests/Pickle/Check-Steps.ps1` were written today and pass. No compiled-code test applies: there is no code |
| Pickle scenarios written, and their scope justified | Met. 32 scenarios in 15 features, no local C#. `TESTING.md` gives every one of the 14 manual scenarios a disposition, played by the suite, proved offline, not applicable with its reason, or open |
| XML tests written, executed and green | Met, same evidence as the automated line |
| Every non-applicability justified in writing | Met, in the table of `TESTING.md`. One scenario is open and is not claimed as not applicable: 13. Scenario 8 was open until the joy giver was added |
| Results correspond to the delivered version | Met. The validators ran on the revision that holds the final `Mod/`; nothing in `Mod/` has moved since |
| Nothing artificial to fill a box | Two of the 14 manual scenarios are left out of Pickle on purpose, and the pleasure path has no scenario because it would assert a defect |

The suite was **not** run, and the audit does not need it to be: playing it is a criterion of `done -> tested`.
`Check-Steps.ps1` says it parses and that every step exists, and prints what each pass must show: pass 1
discovers 26 and plays 23, pass 2 discovers 17 and plays 15, pass 3 discovers 25 and plays 25, pass 4 discovers
17 and plays 15.

## Where this mod stood that morning, kept as history

> **Replaced on 2026-09-28, later the same day** by the section above. Kept as it was written.


**Audit of 2026-09-28: `done` becomes `preTest`.** This section and the audit below supersede the
"current result" of 2026-09-13, which said `done` and stays further down as history.

One criterion is not met, and it is the only one. `preTest -> done` asks for Pickle suites written,
or their absence justified in writing, and `Tests/Pickle/` does not exist while nothing says why
Pickle would not apply. It does apply: eating a biscuit for joy, sowing the wheat, a recipe at the
stove and the coexistence with Mlie's wheat can only be shown by a game that runs. Silence is not a
justification, so the mod does not stand at `done`. Everything before that transition is
re-established on the current revision and the current protocols, below.

What did not move the stage: everything that needs the game. Those checks are `unverified` in
`remaining` and in `tested_on`, never a reason to go back.

**The Workshop item exists.** A prepublication on 2026-09-23 created item `3806761765`, private as
Steam creates every item. `Mod/About/PublishedFileId.txt` had been sitting untracked since; it is
committed today (`3f23830`, `Add published Workshop file ID for 0.1.0`) and `CHANGELOG.md` opens
on `0.1.0`, with `1.0.0` unreleased above it. This is an act, not a state: `prepublished` in the
chain is still ahead.

**The packageId lost its `renew` today**, the owner's call: `nelim.fullzooncookies`. The item was
uploaded with `nelim.fullzooncookiesrenew`, so its own `About.xml` on Steam keeps that until the
next upload. Nothing held the old one: no `ModsConfig.xml` line, no save, and no other mod of the
collection naming it. `PublishedFileId.txt` is unchanged, so the next upload updates the item.

## Workflow audit — 2026-09-28

> Written that morning. Its `preTest -> done` row is replaced by the replay above; every other row stands.

Revision audited: `47304c60e6ad57a5d5015de96639898e8cd984d8` (`47304c6`), `Mod/` changed since 2026-09-20 only by the packageId and
the `ATTRIBUTION.md` copy. At the start the working tree held, untracked: `PublishedFileId.txt`, six
generated `.dds` in `Mod/Textures`, and two Explorer `.ico` in `Art/`. The first was committed, the
others are now ignored. `Mod/desktop.ini` (an Explorer folder icon, ignored) is on disk and not
tracked. No game was started.

**`stage` codes.** The field has six values and the chain twelve states. `port` is before
`horsMonoRepo`; `showcase` covers `Preview générée` up to `l10n`; `preTest`, `done`, `tested` and
`published` are their own state. `workflow_stage` carries the exact state, here `preTest` as well.

| Transition | Result on this revision |
| --- | --- |
| dansMonoRepo -> horsMonoRepo | Validated. Standalone repository, `origin` on the public GitHub repository, working tree pushed. `STATUS.md`, English `README.md`, `ATTRIBUTION.md`, `LICENSE`, `CHANGELOG.md`. Visibility and `silent` are consistent with `ATTRIBUTION.md`, and the source declares no 1.6 support. Names agree, `(unofficial)` included. The two shipped copies match their roots by hash |
| horsMonoRepo -> ModIcon générée | Validated. No build applies. Icon 128 x 128, 34,124 bytes, looked at in full and at 32 px, head and wink and ponytail still read. The owner accepted it on 2026-09-13, background and weight included; nothing was regenerated or resized |
| ModIcon générée -> Preview générée | Validated. 896 x 504, 666,456 bytes, looked at in full and at 268 px, no camera defect found |
| Preview générée -> preOptions | Validated. Accent and secondary ink are visibly apart, the English description ends on `[url=...]Source code on GitHub[/url]` at the standalone repository, prefix and suffix are at 65 % in the secondary ink, tag and 1.6 badge present. The palette is in `Art/preview-palette.json` and loaded by `Art/preview.html`. Contrast per element is in `Art/preview-qa/results.json`, all above 4.5:1 |
| preOptions -> options | Validated, `settings_audit: not_applicable`. No assembly, no settings class, no main-button def in `Mod/`, so no empty page and no shortcut. Recipe and batch choices, sowing and filters are the game's own controls |
| options -> l10n | Replayed against the current `TRANSLATIONS.md`. Validated. 69 translatable strings, all in native Def fields, English from the source values, French and Chinese by DefInjected, 138 keys and 0 errors. The counts-and-plurals rule of 2026-09-25 does not apply: no counted phrase, no parameter, only the `x5` and `x10` of a batch label |
| l10n -> preTest | Validated. Core only for the required references. Mlie's Vanilla-like Wheat (`Mlie.VanillalikeWheat`, installed item 2717707382, supports 1.6) is optional, guarded by `MayRequire` on every one of the 30 references and by a conditional patch that tests the def. No `loadAfter`, no `LoadFolders`. Cited from the audit of 2026-09-13 and rechecked against the installed item |
| preTest -> done | **Not met.** The four static scripts were rerun and pass (below); fourteen functional scenarios are written. No Pickle suite and no written reason for its absence |
| done -> tested | Not reached. Nothing was played |

**Checks run**, all offline, logged in `docs/runs/2026-09-28.md`:

- `Check-XmlFields.ps1`: 7 files, no unknown field.
- `Check-DefRefs.ps1`: 27 defs, 1 abstract parent, no unresolved reference, every `ParentName` resolved.
- `Check-TypeRefs.ps1`: no foreign type.
- `Check-DefInjected.ps1`: 138 keys, 0 errors.
- Root and `Mod/` copies of `LICENSE` and `ATTRIBUTION.md` compared by hash, identical.
- Both delivered images opened and looked at. Nothing was generated.

**The original mod has no repository**, checked and written into `ATTRIBUTION.md` on 2026-09-28: the
Workshop page through the Steam API (updated 2019-01-15, no link), the installed copy's `About.xml`,
and GitHub by the author's name and by the mod's defNames. So the provenance is the Workshop files
as installed and there is nothing to send a pull request to. The Workshop comments are the only
route to the author.

**Evidence** stays on disk. The one tracked folder, `Art/preview-qa`, is untracked and ignored; its
two images (568 KB) were deleted, being regenerated by `Art/render-preview.cjs`, and `results.json`
stays. `.dds`, `.ico` and `Tests/Pickle/Evidence/` are ignored. What to keep from a run is written
in `TESTING.md`.

**Documents read**, with their versions and the ones that were of no use: `docs/PROTOCOLS-READ.md`.

## Next transition: done -> tested

Strictly what it takes, in the order that saves machine time:

1. **Scenario 13**: a save made by the original mod, or a decision that it is not applicable to `tested`, with
   the reason written down. This is the owner's.
2. **Play the suite**, one request per pass, from `Tests/Pickle/README.md`: bare English (filed, waiting), bare
   French, beside Mlie's wheat, and Chinese if the install has it. Expect reds on the first run and read the
   cook, the fuel and the haul before blaming a recipe, and what the colonist did before blaming the joy giver.
   Each red is fixed and replayed green.
3. **Open the `@review` capture** of `14` and look at it, and read every `Player.log`.
4. The three conditions added on 2026-09-25 to 28, in `TESTING.md`: no scenario left in `@wip`, every conditional
   scenario has run on a map that mounts its mod, no manual test left to validate.

A request ships the working tree as it stands when its ticket is played, so the one already filed will play the
tree with the joy giver and scenario 15, not the one it was filed at. Keep the tree on the revision under test
until each `RUN_DONE`.

## What `tested` will ask

Beyond the game running the scenarios, three checks, all in `TESTING.md`: no scenario left in
`@wip`; every conditional scenario has run on a map that mounts its mod (here scenario 10, with
Mlie's wheat); no manual test left to validate, each being automated and green or listed not
applicable with its reason (here scenario 13).

## Recommendations, none of them a blocker

- `STYLE_RIMWORLD.md` now names `Art/Preview.png` as the un-overlaid source. Here it is
  `Art/Preview-source.png`, which the render script reads. Renaming means touching that script.
- The icon weighs 34 KB where the guide says 20 to 30 KB. Accepted with the icon; unchanged.
- The MIT scope in `LICENSE` lists the port's text, patch and packaging but not its own icon and
  banner. The owner may want them named there.
- Name the tool that generated the two images. `About.xml` credits the AI assistant that did the
  port work, and nothing says what made the pictures.
- Before `prepublished`: `PUBLICATION.md` with the single Markdown description, `IF I GO QUIET`,
  `AI-GENERATED` and `THANKS`; register rows in `WORKSHOP_COMMENTS.md` for Fullzoon's page
  (1623487558) and for Mlie's Vanilla-like Wheat (2717707382), whose credit goes to its author and to
  Mlie, checked on the page. The Steam page description as it stands should be `About.xml` at
  `73d3406`.


## Current result after authorized follow-up — 2026-09-13

> **Superseded on 2026-09-28.** `stage` is `preTest` since that audit, no longer `done`. The text below is kept as it was written.

**Stage: done**, meaning ready for final in-game validation, not tested.
This section supersedes the remaining-work statements and transition failures in the
initial audit below, which are retained as historical evidence.

- Preview composition passed and the user accepted the ModIcon style.
- About.xml now ends with the required Steam-formatted Source code on GitHub link,
  matching its URL and the remote already verified during this session.
- README/About now state that grain can be used for biscuits and ordinary meals.
  No gameplay Def or translation was changed. Snack wording no longer claims that
  desperate colonists never eat biscuits as food. The unsupported in-game-testing
  assertion was removed; README now identifies original-save migration as unverified.
- Functional scenarios now cover English, French and Chinese UI (11), a new colony
  and an existing 1.6 save with save/restart/reload (12), and original-mod migration
  on a backup (13). Setup, actions, expected results and result-recording instructions
  are written; execution of all scenarios remains pending.
- Settings remain not_applicable; EN/FR coverage and the successful shared automated
  XML/field/reference/DefInjected checks remain valid because the gameplay XML and
  language resources are unchanged. Compilation and compiled-code unit tests remain
  not applicable for this XML-only mod.

Dependency verification used installed Workshop item 2717707382: About.xml declares
Mlie.VanillalikeWheat and supports 1.6. Its LoadFolders loads /, 1.6 and Assets;
1.6 Defs contain both PlantWheat and RawWheat. Its Processor Framework requirement
belongs to that optional mod, not to this mod. All 30 RawWheat references (ingredient
and fixed filters across fifteen recipes) carry the matching MayRequire guard.
The conditional patch uses only concrete Defs, requires no XML parent from the other
mod, and introduces no mandatory framework dependency. No additional load-order
constraint was identified for this Def-presence/removal operation.

Follow-up checks executed successfully: all 17 distributed XML documents parsed;
About description's exact final link checked against its URL; all 30 optional guards
checked against the installed package ID; the patch's actual XPath condition/removal
was simulated against the local plant XML with and without the installed external
PlantWheat Def, producing the expected sowTags presence/absence. This is an XML
simulation, not a RimWorld runtime integration test. git diff --check passed.

Audited base commit remains 72fb2227fd7265015586381ce8663a3a98bfed2e plus this session's
local edits. Follow-up changed README.md, Mod/About/About.xml and
_tools/FUNCTIONAL-SCENARIOS.md in addition to the previously recorded Preview assets
and this file. Existing edits were preserved. No commit, push or publication was made.

**Next transition: done -> tested.** Run scenarios 0-13, record actual results and logs,
check English/French UI and new/existing saves, and rerun affected cases after any fix.
Original-save migration stays unverified if an appropriate source save is unavailable.
No game session was performed by the assistant. No missing runtime result is a pass.

## Workflow audit — 2026-09-13

> **Superseded on 2026-09-28** by the audit above. Kept as history.

This audit supersedes the historical interpretation below. `stage` uses the literal
workflow names, not letter codes. Current stage: **Preview générée** (Preview generated).
The initial audit changed done to horsMonoRepo because of the icon background.
On 2026-09-13, the user explicitly accepted the existing ModIcon ("moi, ça me va la modicon").
This project-specific style exception closes that finding without changing the image.
The already validated Preview artifact therefore establishes Preview générée.
The first blocked transition is now **Preview generated -> preOptions**.

Scope: autonomous repository `C:/Users/nelim/Documents/rimworld/FullzoonCookiesRenew`,
distributed folder `Mod/`, commit `72fb2227fd7265015586381ce8663a3a98bfed2e` plus
pre-existing local changes in `Mod/About/About.xml`, `README.md` and `STATUS.md`.
The initial diff was 11 insertions / 4 deletions across those files. The audit changes
only this status document; it does not implement fixes, generate assets or publish.
Historical notes and findings are retained below and in `historical_remaining_2026_09_12`.

Read: parent `AGENTS.md`, `PUBLISHING.md`, `STYLE_RIMWORLD.md`, `MOD_SETTINGS.md`,
`TRANSLATIONS.md`, and the user's workflow. The user's clarification makes in-game
settings verification a final `tested` requirement, not an `options` prerequisite.

### Ordered transition results

| Transition | Finding in the audited working tree |
| --- | --- |
| dansMonoRepo -> horsMonoRepo | Validated. Local `.git` and repository root confirmed; origin points to the standalone GitHub repository. `git ls-remote origin HEAD` returned the audited commit; `gh repo view ... --json visibility,url` returned PUBLIC and the expected URL. STATUS and English README/ATTRIBUTION/LICENSE/CHANGELOG exist. Distributed LICENSE and ATTRIBUTION copies have identical SHA-256 hashes to the root copies. Package ID, display name, folder and repository naming are coherent; the unofficial suffix is present in About/README/STATUS. |
| horsMonoRepo -> ModIcon generated | Validated with explicit user acceptance on 2026-09-13. PNG is 128 x 128, 34,124 bytes, and was directly viewed. The mascot is present; the user accepts the repeated-biscuit background as a project-specific exception to the plain near-black ground. Build is not applicable: XML content, no source project or assembly to compile or refresh. No missing feature was identified; the inaccurate baking-only description remains a documented content defect. |
| ModIcon generated -> Preview generated | Independent artifact check validated. Delivered PNG directly viewed: 896 x 504, 506,638 bytes, below 1 MB. Bakery subject and text are readable; no concrete camera defect found. No historical generation report or recorded comparison with a game screenshot is required. |
| Preview generated -> preOptions | Defects. English description exists, but does not end with `[url=https://github.com/vbardales/Rimworld-Fullzoon-Cookies-Renew]Source code on GitHub[/url]`. Preview has full-size Renew, no `(unofficial)` tag, no 1.6 badge, and no secondary ink treatment distinct from the accent. `Art/preview.html` uses the older layout, differing title/summary inks and no palette JSON; the required current composition is not established. |
| preOptions -> options | Independently validated as not applicable, with the settings inventory below. |
| options -> l10n | Independently validated for source/resource coverage, not in-game rendering; see translation audit. |
| l10n -> preTest | Core-only required references and parents pass the installed-game validator. Optional wheat integration is guarded by MayRequire and a conditional patch, not a mandatory dependency. Runtime integration remains unverified; see dependency scope below. |
| preTest -> done | XML automated checks executed successfully; no separate C# logic suite is applicable. Twelve functional scenarios (0-11) have setup/actions/expectations. Final-test planning still needs explicit English UI and existing-save migration coverage: scenario 11 names French/Chinese, and migration is mentioned as an unanswered case rather than an executable scenario. |
| done -> tested | Unverified. No game session, Player.log review, translated UI interaction, new-game/existing-save regression or integration run was performed in this audit. Historical notes likewise state that the scenarios have not been played. |

### Rights and documentation

`licence: silent` and public visibility retain the documented project decision in
ATTRIBUTION.md, not an inferred upstream permission. The installed upstream copy at
`C:/Program Files (x86)/Steam/steamapps/workshop/content/294100/1623487558` has only
About/Defs/Textures, declares targetVersion 1.0.2096, and has no licence or repository
link in About.xml. The historical Steam-description check is explicitly recorded in
ATTRIBUTION.md; it was not refreshed online during this audit. This is the workflow's
documented classification, not a new grant of rights. LICENSE explicitly excludes
Fullzoon's original content from MIT and scopes MIT to the port additions. Credit,
original link, unofficial notice and removal commitment are present.

The baking-only sentence is actually present in README/About, not CHANGELOG in this
revision. `FZRawWheat` inherits Core `PlantFoodRawBase`, whose category is PlantFoodRaw;
Core meal recipes accept that food. This contradicts the documentation, without
requiring an in-game test to establish the data mismatch. About also claims
"in-game testing" in its AI credit paragraph despite no recorded game validation:
that claim is unsupported, not evidence that testing happened. README's guarantee
of lossless save migration likewise remains unverified.

### Settings audit

Inventory covers all delivered Defs, the conditional patch and all repository files.
The mod supplies five fixed snacks, fifteen stove recipes, one crop, its grain and
five mood memories. Recipe selection and batch choice are existing game bill controls;
sowing and ingredient filters are native game controls. Stats are content balance
constants, not an existing user configuration contract. Compatibility automatically
removes duplicate crop selection when the external wheat Def is present. No concrete
need for a separate user setting was identified. No C# Mod/ModSettings implementation,
custom settings page, MainButtonDef or settings shortcut exists. No empty page is
introduced. Result: **not_applicable**, justified by behavior inventory, not merely
absence of C#. Persistence, input limits, reset and shortcut tests are not applicable.
No RIMMSQOL or other customization integration is claimed as tested.

### Translation audit

Inventory: 14 ThingDef strings (seven labels/descriptions), 45 RecipeDef strings
(fifteen labels/descriptions/jobStrings), and 10 nested thought-stage strings.
All 69 use native translatable Def fields. English is supplied by source values;
no redundant English folder is required. All 69 French entries are nonempty and
unique; comparison with the source-field inventory returned no missing or extra keys.
Text and meaning were reviewed, including x5/x10 labels and thought handles. These
strings contain no format parameters, grammar tokens or rich-text tags requiring
parameter reconciliation. No code-owned UI text, Keyed usage or patch-added text exists.
Metadata/docs are outside the in-game localization gate.

`../scripts/Check-DefInjected.ps1 -TransMod <repo>/Mod` ran against the installed
RimWorld classes and data: **138 keys checked, 0 errors**, including Chinese and
French; 11,613 Defs indexed, 30 patch operations applied by the validator. No unresolved
translation targets reported. This is static validation, not proof of game loading.
English/French rendering, fallback behavior and clipping remain unverified in game.

### Executed checks and limits

Installed game data used by the validators: **1.6.4871 rev590**, read from the local
RimWorld `Version.txt`. No game process was launched for this audit.

- `git rev-parse --show-toplevel`, `git status --short`, `git diff --stat`,
  `git rev-parse HEAD`, `git remote -v`: scope and local modifications confirmed.
- GitHub read-only checks initially failed in the sandbox; the permitted read-only
  retry succeeded. Both repository visibility and pushed HEAD were verified live.
- Parsed every distributed XML using PowerShell's XML parser: **17 files passed**.
- `../scripts/Check-XmlFields.ps1 -ModPath <repo>/Mod`: **7 files checked; no unknown
  fields; every element maps to a 1.6 field**.
- `../scripts/Check-DefRefs.ps1 -ModPath <repo>/Mod`: **27 concrete Defs, 1 abstract
  parent; well-formed XML; no missing/wrong-type references; all parents resolved**.
  The listed comp/patch classes are native game classes. These shared written scripts
  are the applicable automated XML checks; absence of a mod-local test suite alone is
  not a failure for this XML-only mod. No compiled-code unit tests are applicable.
- PowerShell inventory comparison: **69 source strings / 69 French entries**, no
  duplicate/empty/missing/extra French entries. Image dimensions and byte sizes read
  from the actual PNGs. Both delivered images inspected directly with the image viewer.
- LICENSE/ATTRIBUTION hashes compared across root and Mod: both pairs identical.
- Delivered image SHA-256: ModIcon `413140293532861FA9C8668D2B36CDE78030C301740A4E407AE49FF8964DE2DA`;
  Preview `640E8202E1A024FB129FA20F4A676B43EA0C7975CB205E712FE588D69C3B8E0D`.
- `git diff --check`: passed after the status update; pre-existing README/About edits retained.

The reference validator's clean result does not certify optional MayRequire targets
with the integration installed. Recipes guard both ingredient and fixed filters with
`Mlie.VanillalikeWheat`; the patch tests PlantWheat and removes this mod's sowTags.
No LoadFolders, version-specific subfolder or external assembly exists. No mandatory
framework or DLC was identified. Exact current external-package compatibility and
present/absent game behavior are not claimed as tested.

### Preview overlay update — 2026-09-13

The user authorized recomposing the existing illustration. The Preview defects in the
initial audit table above are now resolved; that table describes the pre-edit artifact.
The final GitHub description link and other documentation findings remain outstanding,
so stage stays Preview générée. The ModIcon remains unchanged and accepted.

Source preserved: Art/Preview-source.png. Previous composition archived as
Art/Preview-before-2026-09-13.png and Art/preview-before-2026-09-13.html.
Current composition: Art/preview.html; sole palette source: Art/preview-palette.json;
reproducible local rendering: Art/render-preview.cjs (Node, playwright, sharp, installed Chrome).
The cream veil follows the grain; secondary warm brown follows wood and biscuit tones;
the saturated red-orange accent follows the berry-cookie details and separates visibly
from the brown secondary. No new illustration was generated.

Fullzoon's is an attribution prefix, explicitly approved by the user on 2026-09-13.
Both Fullzoon's and Renew are 65% size with secondary ink; Cookies stays at full size; the unofficial tag is on its own line, and the
1.6 badge matches About.xml. Title and summary share the same primary ink. Text starts
at 50/54 px, with the current charter spacing and sizes. Segoe UI Semibold was verified
through Chrome platform-font inspection for the title; CSS uses Segoe UI throughout.
The renderer awaited document.fonts.ready and image decoding before capture.

Delivered Mod/About/Preview.png: 896 x 504, 666456 bytes. Direct visual review at full
size and 268 px confirmed readable title/version, reduced Renew, visible accent rule,
distinct secondary/accent colors, and no clipping or overlap. Contrast minima across
the actual background regions: Cookies 11.32:1, Fullzoon's 5.59:1, Renew 5.59:1, tag 5.54:1, summary 5.56:1;
badge 5.14:1. Evidence: Art/preview-qa/results.json, background.png and thumbnail.png.
The previous image hash and byte count above are historical and superseded by this update.

### Required next work and independent remaining work

To cross the **next** transition (Preview generated -> preOptions), bring Preview
description into compliance, including the final GitHub description link. Preview composition is now validated.
The existing ModIcon is accepted by the user; no icon change is required.
Correct the documented baking-only claim to match the retained behavior, or explicitly
decide on a behavior change and validate that change; this audit does not choose a redesign.

Later work remains separate: explicitly cover English UI and existing-save migration in the
functional plan, and perform the required final game scenarios. Missing game results
are **unverified**, not observed runtime defects. No optional recommendation is used
to lower the stage, and no camera-comparison or generation-history requirement is added.

## Historical status — retained, superseded by the audit above

Read by a sweep across every mod, rather than by asking each thread in turn. It lives at the root,
never inside `Mod/`, so Steam never receives it.

The sweep reads what the disk shows. Four fields it cannot read, and they are this thread's to
keep from here on:

- **`stage`** — `done`, against the `preTest` the sweep had guessed. The session group for this
  mod reads *Rimworld - done*, and the group wins: it is set by hand, and the sweep only guesses.
  The two say the same thing anyway, once `done` is read as *the work is finished* rather than
  *it is published*. The content, the two images, the six documents and the twelve scenarios are
  all in. What is left is a game, not development.
- **`tested_on`** — empty, and accurate. RimWorld has never loaded this mod. There is no
  `Player.log` to read, which is why the first scenario is a startup with nothing else to watch.
- **`dependencies`** — `none`, and the `MayRequire` scattered through the recipes is not a
  contradiction. The About declares no `modDependencies` and no `loadAfter`, because the mod needs
  nothing: it uses Core defs only. Mlie's Vanilla-like Wheat appears in the fifteen recipes as an
  optional second grain, and in `Patches/VanillaLikeWheat.xml` as a conditional that tests for a
  def rather than for a mod. Both are inert when that mod is absent. Integrations, not
  requirements.
- **`remaining`** — three lines. The first is the whole of the testing. The two others are known
  faults left standing on purpose, each waiting on a decision rather than on work.

`remaining` kinds, as a reminder: `feature` for something missing from a first release, `defect`
for a known fault left unfixed, `unverified` for what could not be checked.

**The two defects are hers to settle, and each is one edit away.** The grain one is a sentence
that is false in `README.md`, in `CHANGELOG.md` and in the `About.xml` description — so it will be
on the Steam page the day this is published, which is what makes it a defect rather than a note.
The icon one is a style break and not a fault in the file: it renders, it reads at 32 px, and it
is the only icon in the repository whose background is a scene rather than a plain ground.

`showcase` is `complete` and was earned twice in a day. The preview was engraved on 2026-09-12
under the old rule, then re-engraved the same day under the new one: the veil takes a colour from
the picture instead of the same near-black as every other mod, and the ink follows by luminance.
So this sheet carries no showcase debt.

`workshop` stays empty, and that is accurate: there is no `PublishedFileId.txt` in the folder, so
nothing has been uploaded. It is not a `remaining` line, being neither a feature nor a fault nor a
check, but it is a step still waiting. The listing will be public, as the repository is.

## When these change

- **`tested_on`** — the day she plays it and a `Player.log` is read. That also rewrites the first
  `remaining` line, which should then name the scenarios that failed rather than all twelve.
- **`stage`** — `tested` once a log has come back clean, `published` once the Workshop item
  exists. Either way, check the session group first: it is the one she sets.
- **`workshop`** — the day `PublishedFileId.txt` appears in the folder.
- **`remaining`** — a defect leaves the day she rules on it, whichever way she rules: the grain
  sentence goes or the item leaves its category, the icon is accepted or regenerated.
- **`updated`** — every time any of the above moves.

The `session` field was left alone. It comes from the sweep, and here it happens to name this very
conversation.

`licence` vocabulary: `open` an explicit licence, `silent` no licence and a dead source, `alive`
no licence but a living source, `forbidden` a written refusal, `original` owing nothing to anyone
— not a name, not an idea traceable to one mod, not a value derived from its assets. `silent`
here: Fullzoon's mod stopped at 1.0 and declares no licence at any of the four places one could
be. The fourth of those — the body of the Steam description — is the check that was missed once on
たたら製鉄, where a ban on redistribution was written there and nowhere else. It was made here
before anything was copied, and `ATTRIBUTION.md` sets it out in full.
