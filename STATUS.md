---
mod:          Fullzoon's Cookies Renew
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
updated:      2026-09-12, mod session
---

# Fullzoon's Cookies Renew — status

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
