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
workflow_stage: playTests[1.0.0]
current_step: "playTests: scenario 15 red a fourth time (Guest wanders, no joy job found); find why EatFZBiscuits yields no job; then pass 3, pass 4, code review 8.m, non-regression after the commit"
licence:      silent
licence_at:   no licence at any of the four places one could be - no LICENSE file in the mod, no mention in its About.xml, no linked repository, and nothing in the body of its Steam description. Read again on 2026-09-28 through the Steam Web API - last updated 2019-01-15, tag 1.0, no licence and no link in the description. The mod declares 1.0 and nothing since.
upstream_mod_remotes: N/A
dependencies: none
showcase:     complete
tested_on:
  - "2026-09-28/29, bare set, Pickle 4.9.1, WSL. Pass 1 (English): 22 passed, 1 failed, 3 skipped of 26. Pass 2 (French): 15 passed, 0 failed, 2 skipped of 17. Evidence in Tests/Pickle/Evidence/ (ignored by git), one line per run in docs/runs/2026-09-28.md"
workshop:     3806761765
remaining:
  - "unverified: after deploy, Pickle replay of the scenarios that display the three French texts reworded on 2026-10-11 (TRANSLATIONS.md, text edit after validation), French pass"
  - "defect: `Art/Preview-source.png` mean value 0.261, AUDIT 2.e asks 0.30 or more; the source is the owner's, nothing regenerated"
  - "defect: scenario 15 (a colonist is sent to a biscuit for pleasure by `EatFZBiscuits`) is red five times (2026-10-15 ticket `20261015-002924-167-508f`: food policy forced, `[joy]` all true, Guest in Wait_Wander, so not the policy; next: read why JoyGiver_Ingest yields no job), earlier red four times (2026-09-28, 2026-09-29, 2026-10-11: Guest hauled; 2026-10-12 ticket `20261012-043541-820-5432`, joy-only schedule step in place: Guest in GotoWander, never Ingest), 2026-09-28 pass 1 and 2026-09-29 replay `20260929-110314-718-412a`: the guest took `Play_Horseshoes`, then `Skygaze`, never `Ingest`. The giver is unproven, not refuted. The scenario was reworked (draft/undraft repeated six times); its replay `20260929-230410-312-d521` has no result on disk and is absent from the queue list of 2026-10-02. File scenario 15 again, alone, small ticket."
  - "unverified: pass 3 (beside Mlie's wheat, English, 25 scenarios) and pass 4 (Chinese Simplified, only if the install carries it) have never been played. Scenarios 08 and 11 are skipped in passes 1, 2 and 4, and a skip is not a pass."
  - "unverified: the `@review` capture of feature 14 (kept as JPEG in the pass 1 evidence) has not been opened and looked at, and the `Player.log` of passes 1 and 2 were not read in this audit"
  - "unverified: the non-regression passes (whole suite, English and French, on the final revision) are filed together at the very end, once 15, 08, 11 and the Chinese pass are green (order rule of AUDIT.md, 2026-10-02)"
  - "unverified: whether the WSL install's Workshop cache holds Mlie's Vanilla-like Wheat (2717707382) and SYR Processor Framework (2633514537), which pass 3 stages. A missing one is a download through `Use-Wsl.ps1`."
  - "unverified: whether Workshop item 3806761765 still holds the six `.dds` files of the 0.1.0 upload. The publication CI ships tracked files only, so the next upload should replace the folder. Look at the item after the first CI publish."
historical_remaining_2026_09_12:
  - unverified: the twelve scenarios of `_tools/FUNCTIONAL-SCENARIOS.md`, none of them played
  - defect: three documents say the wheat grain is good for nothing but baking, and it is not. Resolved on 2026-09-13, the README and the About description now say the grain feeds ordinary meals
  - defect: the icon's background is a wall of biscuits where the ModIcon block of `STYLE_RIMWORLD.md` asks for a plain near-black one. Accepted by the owner on 2026-09-13
session:      local_e26c87bd-50c9-4420-aba0-572f5dd2f69d
updated:      2026-10-11, full audit replay, French validated by Virginie, writeTests closed
audited_revision: 155738e6dfaa314e0f6c6e5793d9a8a01a001110
protocols_read_sha: 117fb9642df7e57bece2318904c644a9c39296df
echo_review_sha: 75ecf138232d5810bc6aae314efcaa37101c7357
social_preview_sha256: a53eaa6f910171f31a17dfa5266890628bdbdba27ed04347b7098ea5dbd5a202
---

# Fullzoon's Cookies Renew - status

**Preview (2026-10-12, `75ecf138232d5810bc6aae314efcaa37101c7357`):** panel layout (dark veil, light ink, set by the Audit session at Virginie's request, her approval), echo `Art/echo-preview.png` kept: accent colour, flipped, panelWidth 50; it overlaps the summary text, **kept as is on Virginie's word (2026-10-12)**. ModIcon cropped in badge mode. Social preview uploaded 2026-10-12, og:image sha256 checked equal.

## Where this mod stands

**Audit of 2026-10-02, revision `155738e`: `done` holds.** Nothing went back. Between 2026-09-28 and now `Mod/`
changed only in `About/Preview.png` (badge in the corner); no def, patch or text moved. This section corrects
what the sections below say about "nothing played": the game ran twice on this mod.

- **Replayed offline on 2026-10-02:** `Check-XmlFields` (8 files, no unknown field), `Check-DefRefs` (28 defs, 1 abstract
  parent, no unresolved reference), `Check-TypeRefs` (0 foreign type), `Check-DefInjected` (138 keys, 0 errors, 30 patch
  operations), `_tools/Check-Recipes.ps1` (15 recipes hold). `Tests/Pickle/Check-Steps.ps1` could **not** be replayed:
  it wants the Pickle assemblies under `workshop/content/294100/3791648678`, which this machine's Windows Steam no longer
  has. Not a defect; the two Pickle passes below resolved every step.
- **Played, WSL, bare set** (Pickle 4.9.1, `exitReason` read before the counts): pass 1 English 22 passed, 1 failed,
  3 skipped of 26, only scenario 15 red; pass 2 French 15 passed, 0 failed, 2 skipped of 17, clean. Counts agree with
  `Check-Steps.ps1`. The 2026-09-28 unfiltered "replay 15" (32 scenarios, 7 red) was a wrong filter: its six red were the
  Chinese features played in an English pass, and its seventh was scenario 15 again. It proved nothing the other runs do
  not, and was deleted.
- **Rules read since the last audit** (see `docs/PROTOCOLS-READ.md`): French gender agreement (2026-09-30), done on the five
  DefInjected files below; PR to the original's repository (none exists, `upstream_mod_remotes: N/A`); the order of passes
  of 2026-10-02 (never-played and red first, non-regression together at the end); the WSL cleanup at sleep time (nothing
  of this mod's was downloaded there yet that is known: pass 3's two Workshop items are to be checked then).
- **Prepublication:** `Mod/About/PublishedFileId.txt` (`3806761765`) is tracked, `CHANGELOG.md` opens on `0.1.0`, no
  `.dds` is tracked and `*.dds`, `*.ico`, `Tests/Pickle/Evidence/` are ignored.
- **Evidence** on disk went from 90 MB to under 1 MB: kept `2026-09-28-pass1-bare-en` (the `@review` capture as JPEG),
  `2026-09-29-pass1-replay-15-2` (latest word on scenario 15, red) and `2026-09-29-pass2-bare-fr`. No field of this file
  pointed at the deleted folder.

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

## Work of playTests, in the order that saves machine time

Strictly what it takes, in the order that saves machine time:

1. **Play the suite**, one request per pass, from `Tests/Pickle/README.md`: bare English (filed, waiting), bare
   French, beside Mlie's wheat, and Chinese if the install has it. Expect reds on the first run and read the
   cook, the fuel and the haul before blaming a recipe, and what the colonist did before blaming the joy giver.
   Each red is fixed and replayed green.
2. **Open the `@review` capture** of `14` and look at it, and read every `Player.log`.
3. The three conditions added on 2026-09-25 to 28, in `TESTING.md`: no scenario left in `@wip`, every conditional
   scenario has run on a map that mounts its mod, no manual test left to validate.

Nothing is left to the owner: scenario 13, the migration from the original, was dropped on 2026-09-28 at her word.
A request ships the working tree as it stands when its ticket is played, so the one already filed will play the
tree with the joy giver and scenario 15, not the one it was filed at. Keep the tree on the revision under test
until each `RUN_DONE`.

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

**Gender agreement (2026-09-30 rule).** Read all five French DefInjected files in full:
`RecipeDef/Recipes_FZfood_Meals.xml` (45 strings: labels, descriptions, jobStrings),
`ThingDef/Items_FZMeal.xml` (5 items), `ThingDef/Items_FZRawWheat.xml`,
`ThingDef/Plants_FZWheat.xml`, `ThoughtDef/Thoughts_FZfood.xml` (5 memory stages: label +
description). No text in this mod agrees with a pawn: item/recipe text describes food, not
a colonist, and the thought stages use `avoir`-auxiliary participles ("a mangé", "J'ai
mangé") which do not agree with the subject's gender. No adjective, participle or noun
referring to a pawn was found anywhere in the inventory. No three-segment switch is needed;
none is missing.

Review by Virginie, 2026-10-11, revision `8826c43` (`FRENCH_REVIEW.md` regenerated from it at `0fc56a8`, with the Chinese original): validated in chat. Corrections she asked for and applied: `FZPlant_Wheat.description`, `FZRawWheat.description` and `AteFZCookies.stages.ate_butter_cookie.description` reworded; no text needs a gender branch. `translation_fr` is `complete`.

