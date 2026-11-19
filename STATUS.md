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
workflow_stage: writeShotlist[1.0.0]
current_step: "writeShotlist (replay 2026-11-19, 9.0 and 9.0 bis open: scenes 5 and 6 have no plan score): scenes 5 and 6 written 2026-11-19 (566e3fb, window steps from NPT, not played), gallery dep map added. Small ticket scenes 2 to 4 filed (id 391d, tree 566e3fb). Next: read it, fix reds, then full series (rate-gallery)"
licence:      silent
licence_at:   no licence at any of the four places one could be - no LICENSE file in the mod, no mention in its About.xml, no linked repository, and nothing in the body of its Steam description. Read again on 2026-09-28 through the Steam Web API - last updated 2019-01-15, tag 1.0, no licence and no link in the description. The mod declares 1.0 and nothing since.
upstream_mod_remotes: N/A
dependencies: none
ecosystem_line: 1.0   # PiI search of 2026-11-14 for the 1.0.0 line (docs/inventory/ecosystem-steam/FullzoonCookiesRenew.md), ecosystem-links block 2026-11-19 (0ef2ef1); AUDIT 2.h
workshop_required_items: n/a, not released yet
optional_integrations: "2026-11-19, revision 890ff96: DankPyon.Medieval.Overhaul 3219596926, dismarzero.VGP.VGPGardenGourmet 2007062982, Mlie.RC2.Core 2562519366, Mlie.VanillalikeWheat 2717707382, sumghai.MousekinRace 2494193063, all kind patch, in Mod/About/OptionalCompat.xml, Check-OptionalCompat OK"
showcase:     complete
tested_on:
  - "2026-11-15 pickle b81c890 (Mod unchanged since 0d49abe): non-regression 575e English 23 of 28, fcfb with Mlie 25 of 27, 3f30 Chinese 15 of 17, French 780b 14 of 17 then replay 7219 green, feature 14 capture 51ca looked at. Skipped are conditionals covered by passes 3, 5, 6. Lines in Docs/runs/pickle.md"
  - "2026-09-28/29, bare set, Pickle 4.9.1, WSL. Pass 1 (English): 22 passed, 1 failed, 3 skipped of 26. Pass 2 (French): 15 passed, 0 failed, 2 skipped of 17. Evidence deleted 2026-10-19 (older than the last `Mod/` commit), one line per run in Docs/runs/pickle.md"
  - "2026-11-03, pass 3 beside Mlie's wheat, English, ticket `20261030-162201-656-b18a`, tree `2785d66`: 23 passed, 2 failed of 25 (08 step name, 15 wait too short; both fixed in `9368ab4`). Line in Docs/runs/pickle.md"
  - "2026-11-09, pass 4 bare, Chinese Simplified, ticket `20261109-002213-075-df2a`, tree `e9fa2e4`: 15 passed, 0 failed, 2 skipped of 17. Evidence `Tests/Pickle/Inbox/2026-11-09-pass4-zh`, line in Docs/runs/pickle.md"
  - "2026-11-09, replay of 08 and 15 beside Mlie's wheat, English, ticket `20261109-001111-438-9824`, tree `9368ab4`: 2 passed, 0 failed. Evidence `Tests/Pickle/Evidence/2026-11-08-pass3-reds`, line in Docs/runs/pickle.md"
workshop:     3806761765
remaining:
  - "9.0 and 9.0 bis open: shotlist table holds scenes 1 to 4 only; run score-gallery on scenes 5 (bake-5-the-bills) and 6 (bake-6-the-memory), add their rows with plan score, then replay to return to shootGallery. Ticket 391d (scenes 2 to 4) stays queued"
  - "pending migration (AGENTS.md hygiene 2026-11-19): merge Tests/TEST_SCENARIOS.md into Tests/Pickle/README.md (PROTOCOLS-READ, Docs/runs and Rule-OwnValues.ps1 done 2026-11-19). Test-Mod.ps1 generation by CI/CD still to ask (needs the mounted junction); Rule-OwnValues row awaits Audit validation"
  - "unverified: passes 5 (RC2) and 6 (Medieval Overhaul) green 2026-11-14; WSL install may lack both mods and their dependencies). Untested ingredients: VGP Rawwheat, Mousekin_RawWheat, Medieval Overhaul milks. Not accepted on purpose: Lapin wheat, VV feed wheat, Stoneborn cave wheat (flour), other berries and chocolates (no category fits)"
  - "defect: `Art/Preview-source.png` mean value 0.261, AUDIT 2.e asks 0.30 or more; the source is the owner's, nothing regenerated"
  - "unverified: whether Workshop item 3806761765 still holds the six `.dds` files of the 0.1.0 upload. The publication CI ships tracked files only, so the next upload should replace the folder. Look at the item after the first CI publish."
historical_remaining_2026_09_12:
  - unverified: the twelve scenarios of `_tools/FUNCTIONAL-SCENARIOS.md`, none of them played
  - defect: three documents say the wheat grain is good for nothing but baking, and it is not. Resolved on 2026-09-13, the README and the About description now say the grain feeds ordinary meals
  - defect: the icon's background is a wall of biscuits where the ModIcon block of `STYLE_RIMWORLD.md` asks for a plain near-black one. Accepted by the owner on 2026-09-13
  - "gallery (Audit rule 2026-10-18, via TM): no Workshop gallery scenario exists yet, only review feature 14. At shootGallery run skill write-shotlist first: one story at the Sanctuary, Nelim protagonist, dress from NPT catalogues (PickleTools/ColonistRace/docs), wheat field, stoves, biscuit in hand, joy-eating, animals facing camera once, subtitles in PUBLICATION.md. Closing 9a (gameplay Pickle steps) and 9b (GALLERY-PROPS.md entries) due at release. Ack sent to TM, unconfirmed"
session:      local_4bf25320-c1bd-45a2-9b16-82a32a4168fd
updated:      2026-11-19, audit replay: back to writeShotlist (9.0 and 9.0 bis), ecosystem_line 1.0 written
audited_revision: 155738e6dfaa314e0f6c6e5793d9a8a01a001110
protocols_read_sha: 12c4022e5236021ecfb0fd81f8a4c6f64249f982
code_review_sha: ba9da570fb2cd5bfa0cb30875ce2640393189686
echo_review_sha: 75ecf138232d5810bc6aae314efcaa37101c7357
social_preview_sha256: 0fabd38956bc5f427c24378602b32dee06daeca1826ab71b2fca510582308574
---
# Fullzoon's Cookies Renew - status

**Preview (2026-10-12, `75ecf138232d5810bc6aae314efcaa37101c7357`):** panel layout (dark veil, light ink, set by Audit session at Virginie's request, her approval), echo `Art/echo-preview.png` kept: accent colour, flipped, panelWidth 50; overlaps summary text, **kept as is on Virginie's word (2026-10-12)**. ModIcon cropped in badge mode. Social preview uploaded 2026-10-12, og:image sha256 checked equal.

## Where this mod stands

**Audit of 2026-10-02, revision `155738e`: `done` holds.** Nothing went back. Between 2026-09-28 and now `Mod/`
changed only in `About/Preview.png` (badge in corner); no def, patch or text moved. This section corrects
what sections below say about "nothing played": game ran twice on this mod.

- **Replayed offline 2026-10-02:** `Check-XmlFields` (8 files, no unknown field), `Check-DefRefs` (28 defs, 1 abstract
  parent, no unresolved reference), `Check-TypeRefs` (0 foreign type), `Check-DefInjected` (138 keys, 0 errors, 30 patch
  operations), `_tools/Check-Recipes.ps1` (15 recipes hold). `Tests/Pickle/Check-Steps.ps1` **not** replayable:
  needs Pickle assemblies under `workshop/content/294100/3791648678`, which this machine's Windows Steam no longer
  has. Not defect; two Pickle passes below resolved every step.
- **Played, WSL, bare set** (Pickle 4.9.1, `exitReason` read before counts): pass 1 English 22 passed, 1 failed,
  3 skipped of 26, only scenario 15 red; pass 2 French 15 passed, 0 failed, 2 skipped of 17, clean. Counts agree with
  `Check-Steps.ps1`. 2026-09-28 unfiltered "replay 15" (32 scenarios, 7 red) was wrong filter: its six red were
  Chinese features played in English pass, seventh was scenario 15 again. Proved nothing other runs do
  not, deleted.
- **Rules read since last audit** (file `Docs/PROTOCOLS-READ.md` deleted 2026-11-19, `protocols_read_sha` replaces it): French gender agreement (2026-09-30), done on five
  DefInjected files below; PR to original's repository (none exists, `upstream_mod_remotes: N/A`); order of passes
  of 2026-10-02 (never-played and red first, non-regression together at end); WSL cleanup at sleep time (nothing
  of this mod's downloaded there yet that is known: pass 3's two Workshop items to be checked then).
- **Prepublication:** `Mod/About/PublishedFileId.txt` (`3806761765`) tracked, `CHANGELOG.md` opens on `0.1.0`, no
  `.dds` tracked and `*.dds`, `*.ico`, `Tests/Pickle/{Evidence,Inbox,Parked}/` ignored.
- **Evidence** on disk went from 90 MB to under 1 MB: kept `2026-09-28-pass1-bare-en` (`@review` capture as JPEG),
  `2026-09-29-pass1-replay-15-2` (latest word on scenario 15, red) and `2026-09-29-pass2-bare-fr`. No field of this file
  pointed at deleted folder.

**Audit of 2026-09-28, later same day: `preTest` becomes `done` again.** Section below, written that
morning, put mod at `preTest` for one reason, reason gone: Pickle suite exists. Audit replayed for `preTest -> done` on revision below, nothing stands in way. Section further down
keeps its reasoning as history.

`done` means ready to be played, not played. **Nothing has been played:** not one scenario of suite, not one
manual scenario. Suite written and checked offline, all `done` asks (`AUDIT.md`, clarification of 2026-09-21).

**Reading game's code, to write scenario for eating biscuit for pleasure, found it could not
happen, owner ruled same day.** Mod's text says colonist eats biscuit for pleasure, game
never sent one: colonist sent to food for pleasure by `JoyGiver_Ingest`, game's only one
lists `Chocolate` and `InsectJelly` by name. Owner ruled biscuits get joy giver like
chocolate's, `EatFZBiscuits` (`Mod/Defs/JoyGiverDefs/`) now lists the five, with chocolate's own base
chance and joy kind. Nothing patched. **Not seen working:** scenario 15 asks game to choose
it, least deterministic scenario there is; see `remaining`. README and About
description text true again, extended by a sentence saying so.

## Work of playTests, in the order that saves machine time

Strictly what it takes, in order that saves machine time:

1. **Play the suite**, one request per pass, from `Tests/Pickle/README.md`: bare English (filed, waiting), bare
   French, beside Mlie's wheat, Chinese if install has it. Expect reds on first run, read
   cook, fuel and haul before blaming recipe, what colonist did before blaming joy giver.
   Each red fixed and replayed green.
2. **Open `@review` capture** of `14`, look at it, read every `Player.log`.
3. Three conditions added 2026-09-25 to 28, in `TESTING.md`: no scenario left in `@wip`, every conditional
   scenario has run on map that mounts its mod, no manual test left to validate.

Nothing left to owner: scenario 13, migration from original, dropped 2026-09-28 at her word.
Request ships working tree as it stands when its ticket played, so one already filed will play
tree with joy giver and scenario 15, not one it was filed at. Keep tree on revision under test
until each `RUN_DONE`.

### Settings audit

Inventory covers all delivered Defs, conditional patch, all repository files.
Mod supplies five fixed snacks, fifteen stove recipes, one crop, its grain and
five mood memories. Recipe selection and batch choice are existing game bill controls;
sowing and ingredient filters native game controls. Stats are content balance
constants, not existing user configuration contract. Compatibility automatically
removes duplicate crop selection when external wheat Def present. No concrete
need for separate user setting identified. No C# Mod/ModSettings implementation,
custom settings page, MainButtonDef or settings shortcut exists. No empty page
introduced. Result: **not_applicable**, justified by behavior inventory, not merely
absence of C#. Persistence, input limits, reset and shortcut tests not applicable.
No RIMMSQOL or other customization integration claimed tested.

### Translation audit

Inventory: 14 ThingDef strings (seven labels/descriptions), 45 RecipeDef strings
(fifteen labels/descriptions/jobStrings), 10 nested thought-stage strings.
All 69 use native translatable Def fields. English supplied by source values;
no redundant English folder required. All 69 French entries nonempty and
unique; comparison with source-field inventory returned no missing or extra keys.
Text and meaning reviewed, including x5/x10 labels and thought handles. Strings
contain no format parameters, grammar tokens or rich-text tags needing
parameter reconciliation. No code-owned UI text, Keyed usage or patch-added text exists.
Metadata/docs outside in-game localization gate.

`../scripts/Check-DefInjected.ps1 -TransMod <repo>/Mod` ran against installed
RimWorld classes and data: **138 keys checked, 0 errors**, including Chinese and
French; 11,613 Defs indexed, 30 patch operations applied by validator. No unresolved
translation targets reported. Static validation, not proof of game loading.
English/French rendering, fallback behavior and clipping remain unverified in game.

**Gender agreement (2026-09-30 rule).** Read all five French DefInjected files in full:
`RecipeDef/Recipes_FZfood_Meals.xml` (45 strings: labels, descriptions, jobStrings),
`ThingDef/Items_FZMeal.xml` (5 items), `ThingDef/Items_FZRawWheat.xml`,
`ThingDef/Plants_FZWheat.xml`, `ThoughtDef/Thoughts_FZfood.xml` (5 memory stages: label +
description). No text in mod agrees with pawn: item/recipe text describes food, not
colonist, thought stages use `avoir`-auxiliary participles ("a mangé", "J'ai
mangé") which do not agree with subject's gender. No adjective, participle or noun
referring to pawn found anywhere in inventory. No three-segment switch needed;
none missing.

Review by Virginie, 2026-10-11, revision `8826c43` (`FRENCH_REVIEW.md` regenerated from it at `0fc56a8`, with Chinese original): validated in chat. Corrections she asked for and applied: `FZPlant_Wheat.description`, `FZRawWheat.description` and `AteFZCookies.stages.ate_butter_cookie.description` reworded; no text needs gender branch. `translation_fr` is `complete`.
Review by Virginie, 2026-10-18, revision `a2b76eb` (`FRENCH_REVIEW.md` regenerated at it): validated in chat after two ChatGPT passes. Correction applied: `FZPlant_Wheat.description` now follows English (any baked use). `translation_fr` stays `complete`.

## NSB

First sync, 2026-11-15, at the start of `shootGallery` (no shotlist yet: the tables below are the plan `write-shotlist` starts from, not a played gallery). NSB changed nothing the mod used before: the mod had no NSB line. NPT: read once in full for the steps this story needs. Rules said back (owner, 2026-11-05 and 2026-11-07): everything in NSB is free to use; a colonist or domestic animal outside NSB needs Virginie's express validation (an animal the mod adds is authorized, this mod adds none); no change to a colonist's properties without her words; every outfit is free; every animal the mod includes must be in a shot.

Places read: 2026-11-15 Tribe read: 2026-11-19 Steps read: 2026-11-19

Sync 2026-11-19: NSB moved since 2026-11-15 (Iori, BiB gene renames, VALIDE for Miel, Quo, Quaren, Daichi, Dalia, Ada; save-rebuild plan `RECONSTRUCTION-SAUVEGARDE.md`, nothing built; sex-stable test, save holds only Nelim as colonist). None of it touches Nelim, Shogun or the three places used; their validations in `VALIDE.md` stand. NPT moved: vanilla face section in `face-parts.md` only, no step added or removed, no scenario affected. Shotlist and scenarios unchanged. Only if the save is rebuilt (v2): the 20-gallery scenarios load `Nelims-tribe`, to repoint then.

Left alone: no scenario written (stage rule: shotlist and scenarios start at `write-shotlist`). Found while reading: NSB has no wheat field and no stove named in its place docs; the cotton field is farm zone 16, so wheat is sown there by a scenario step; a stove is built or spawned by a step, to confirm with NPT at `write-shotlist` (ask NPT, never a local step).

| Place | Shots that use it | Changes made for the gallery | Last read |
| --- | --- | --- | --- |
| `cotton-field` (211, 106), farm zone 16, validated 2026-11-07 | wheat field | sow wheat on zone 16 by step, plan only | 2026-11-15 |
| `hearth-hall` (181, 115), to embellish; `dining-nook` (176, 108) | stoves, biscuit in hand, joy-eating | none planned; a stove to place by step (ask NPT) | 2026-11-15 |
| `statue-garden` (155, 99), validated | optional, biscuit in hand outdoors | none | 2026-11-15 |

| Colonist | Shots | Outfit per shot | Last read of profile | Exceptions |
| --- | --- | --- | --- | --- |
| Nelim (in the save, cooking 12, major passion) | protagonist: field, stoves, biscuit in hand, joy-eating | daily `LTS_Tunika` emerald with `Apparel_PAESmallEarrings` (validated 2026-11-04); a cook outfit is free, shotlist says which and why | 2026-11-15 | none |

| Animal | Shots | Outfit | Last read of its sheet | Exceptions |
| --- | --- | --- | --- | --- |
| Shogun (labrador, Nelim's, in the save) | one shot facing the camera (step `the animal {string} faces {word}` exists) | `Apparel_leatherdogcollar` by default, wardrobe validated 2026-11-06 | 2026-11-15 (catalogue and wardrobe lines) | none |

| Animal the mod includes (rule 5) | Shot(s) | Status |
| --- | --- | --- |
| none: the mod adds a crop, a grain, five snacks, recipes and memories, no `PawnKindDef` and no race | not applicable | nothing missing |

## Shotlist

Written 2026-11-15 at `shootGallery[1.0.0]`, header in `Tests/Pickle/Mod/Pickle/Features/20-gallery.feature`. No capture yet: rating the plan. Story: a baking morning at the Sanctuary, 08:00 to 11:00, Nelim protagonist (tunic `LTS_Tunika`, earrings, `Roo_HD_Hair_Highpony`, smile), Shogun in every scene. Director pass by an Opus sub-agent: kept nearly every remark (see the header). Scenes 5 and 6 are interface windows (no subtitle, not rated), each needs an NPT step (open the Add-bill list; open the Needs tab with the biscuit memory), to ask at rate-gallery.

| Scene | a time frame | b decor | c living | d pawns | e action | f composition | g subject | j mod | Plan score |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 bake-1-the-field | `plant-garden`, 08:00 Fog, +0 h | wheat rows, cut row, grain stacks, `TorchLamp`, `WoodLog`, 2 `PlantPot` daylily | wheat plants, Shogun east | tunic, Highpony, smile | carries grain, just after the cut | zoom 7, stack in foreground | harvest starts the day | grain stack 11 px at 268 px, golden rows | 5 |
| 2 bake-2-the-stove | `terrace`, 09:00 Clear, +1 h | `FueledStove` lit, `Shelf` with wheat and eggs, finished stack, `TorchLamp`, `WoodLog` | Shogun lying west | same, smile | forced cooking job, before the next batch | rectangle (196,119)-(200,122), zoom 3 | grain becomes biscuits | output stack foreground, 30 px per cell at thumbnail | 5 |
| 3 bake-3-the-five | `dining-nook`, 10:00 Clear, +1 h | `Table3x3c` with five biscuits, orchid, cabinet, chairs, daylight | Shogun under the table | same, smile | forced joy job, paused 30 ticks in | zoom 2.8, five colours spaced | the first batch, she chooses | five colours, 27 px each at thumbnail | 5 |
| 4 bake-4-a-bite | `cloister`, 11:00 Clear, +1 h | `Stool`, small table, `TorchLamp`, daylily pot | Shogun sitting, front view | same, eating mouth (written trait) | sits, holds the green biscuit, first bite | zoom 3 | she stops to eat | green biscuit in hand on stone | 5 |

k (series): ok. One story, wide (1), medium (2), tight (3, 4), opening field and closing bite, hours advance. First rating of the first draft, before the fixes of the Opus pass and of this check: scenes 1 to 4 at 3.5 to 4 (d weak: hairstyle unwritten; e weak: standing pose and a reach with no obtained gesture; j weak at zoom 7 to 10.5). Not verified: free cells at the chosen coordinates, defNames `Table3x3c`, `FueledStove` owned placement and weather `Fog`, that the cooking bar survives the hidden UI, that a forced joy job keeps her in frame. Capture verdicts: none yet.

## Ecosystem

8.0 refresh, 2026-11-14, by PiI (`docs/inventory/ecosystem-steam/FullzoonCookiesRenew.md`, source: Steam + registre):

- Original `1623487558` (2019, no packageId, no version tag, same defNames: 24 of our 25). Never active with this mod; cannot be declared `incompatibleWith` (no packageId). Said in About and README.
- `Mlie.VanillalikeWheat` `2717707382` (Vanilla-like wheat Continued, alive 1.6): second wheat, conflict case. Covered: pass 3 green beside it (23 + 2 of 25), scenarios 08 and 11.
- No other fork, patch, retexture or translation found. Nothing subscribed.
- `ecosystem-links` block added by PiI 2026-11-19 (`0ef2ef1`): parent `1623487558`; linked `2717707382` (Vanilla-like wheat Continued, 1.0 to 1.7) and `3737353987` (`[CNEIO] Golden Muffalo Cookie`, 1.6, registry: undecided, a cookie mod, not a patch of ours). No refresh: Steam Workshop search blocked that day (empty pages), the 2026-11-14 search stands.
- Delta refresh 2026-11-19 by PiI (section "Refresh 2026-11-19" of the same md, Steam search through Chrome): original unchanged (2019); no fork, port, replacement, patch, retexture or translation of it or of ours since 2026-11-14. One new linked neighbour: `JNW - Biscuits & Crackers` `3838524496` (1.6 1.7, baked snacks, defs not read: overlap with our `FZ*` defNames unchecked, to check at play tests). Verdict unchanged, nothing subscribed.
- Wheat family pass, 2026-11-14, by PiI (section "Family pass: wheat" of the same md): Vanilla has no wheat. Alive and installed mods each add their own wheat plant: RimCuisine 2 Core (`Mlie.RC2.Core`), VGP Garden Gourmet, Medieval Overhaul (`DankPyon_Plant_Wheat`), VV New Harvest, Stoneborn Cuisine, Mousekin and Lapin race wheats. No defName clash with `FZPlant_Wheat`; our recipes accept only `FZRawWheat`, so the other grains are never used by them. Mlie's originals (`1522917562`, `2020443885`) dead. Only Mlie's is withdrawn by the patch. Suggested Pickle beside RC2 Core and Medieval Overhaul (load clean, no error): to decide with Virginie.

**8.m code review, 2026-11-14, `Mod/` from the first commit to `0d49abe` (no `Source/`, XML only): no defect.** Read: the plant, the grain, the joy giver, the conditional patch, the 15 recipes (grains behind `MayRequire`, Medieval Overhaul milks), thing and thought defs. Notes, no action: only Mlie's wheat withdraws this wheat from sowing; the other wheat mods keep their own plant beside ours (different defNames, no clash, owner aware 2026-11-14). The recipes accept grain that a quern would normally process (Mlie's, others), as decided earlier.
