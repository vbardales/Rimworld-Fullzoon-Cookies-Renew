---
localization: complete
translation_en: complete
translation_fr: complete
settings_audit: not_applicable
mod:          Fullzoon's Cookies Renew (unofficial)
packageId:    nelim.fullzooncookiesrenew
repo:         Rimworld-Fullzoon-Cookies-Renew
visibility:   public
detached:     yes
stage:        done
licence:      silent
licence_at:   no licence at any of the four places one could be - no LICENSE file in the mod, no mention in its About.xml, no linked repository, and nothing in the body of its Steam description. The mod declares 1.0 and nothing since.
dependencies: none
showcase:     complete
tested_on:
workshop:
remaining:
  - unverified: execute scenarios 0-13 in game, inspect Player.log, verify EN/FR UI, new and existing saves, original-mod migration, and optional Vanilla-like Wheat integration.
historical_remaining_2026_09_12:
  - unverified: the twelve scenarios of `_tools/FUNCTIONAL-SCENARIOS.md`, none of them played
  - defect: three documents say the wheat grain is good for nothing but baking, and it is not.
    `FZRawWheat` inherits `PlantFoodRawBase` and sits in `PlantFoodRaw`, so every vanilla recipe
    filtering on `FoodRaw` takes it - simple, fine and lavish meals, pemmican, kibble. Cutting the
    sentence and taking the item out of the category are both real answers and are not the same
    mod; scenario 3 states the finding and leaves the choice
  - defect: the icon's background is a wall of biscuits where the ModIcon block of
    `STYLE_RIMWORLD.md` asks for a plain near-black one. Cropped to 88 % of its frame it passes
    the 32 px test, the wink and the ponytail reading clearly, but it is off-style and the call is
    hers
session:      local_e26c87bd-50c9-4420-aba0-572f5dd2f69d
updated:      2026-09-13, evidence-based workflow audit
audited_revision: 72fb2227fd7265015586381ce8663a3a98bfed2e
---

# Fullzoon's Cookies Renew — status

## Current result after authorized follow-up — 2026-09-13

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
