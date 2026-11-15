# GALLERY SHOTLIST (written 2026-11-15, before any scenario is played; director pass by an Opus sub-agent, remarks kept below).
#
# STORY (one): a baking morning at the Sanctuary. Nelim (the only colonist, Virginie) harvests the wheat of the
# plant garden, bakes the grain at a stove, sets the first batch on a table and stops to eat one. Shogun, her
# labrador (in the save, leather collar), follows her from scene to scene. One morning, 08:00 to 11:00, one hour
# per scene (`I set the hour to N`), the weather and the light advance with the day: fog at 08:00, clear after.
# Nelim keeps her emerald tunic `LTS_Tunika` and gold earrings `Apparel_PAESmallEarrings` (validated 2026-11-04,
# free outfit, same day: no change of clothes), hairstyle `Roo_HD_Hair_Highpony` (high ponytail, no hat in this series). Smile on every scene by default; scene 4 shows the mouth the
# eating job gives her (written trait, reason: she is eating). No sweat: face held neutral, 20 degrees.
# Places and animal are NSB's (free to use, no validation needed). The mod adds no animal.
# Maps: the Sanctuary base map plus this mod; the pass and its map are set at rate-gallery.
#
# Series: wide (1), medium (2), tight (3, 4); opening = the field, closing = the bite; rhythm advances by
# time, place and action. Decor is placed for one image and removed after it.
#
# 1 bake-1-the-field. Place `plant-garden` (centre (190, 85), fenced plant enclosure south of the house, paved
#   path, bench), zoom 7 (77 px per cell at 1080p, so the foreground grain stack is about 77 px, 11 px at 268 px, plus the golden rows behind it). 08:00, weather Fog, long low shadows. Decor: two rows of `FZPlant_Wheat` fully
#   grown, a third row cut bare soil with two stacks of `FZRawWheat` on it and a third stack at the lower left
#   foreground; `TorchLamp` lit (left on since the night) at the gate, `WoodLog` stack by the bench, two
#   `PlantPot` with `Plant_Daylily` fully grown. Nelim stands on the path facing east, carrying `FZRawWheat` in her arms (the hauler pose of `carries the item`), smile;
#   Shogun at the gate facing east. Instant: just after she picks up the grain of the cut row; obtained by `stands
#   at`, `carries the item`, `faces`, the game paused right after the last step. Says: the day starts with the wheat harvest. Subtitle: "The wheat is in."
# 2 bake-2-the-stove. Place `terrace` (x 193-200, z 118-124), frame the rectangle (196, 119) to (200, 122), zoom about 3 (180 px per cell), so the
#   campfire (194, 121) stays out. 09:00, Clear, sun low through the veranda. Decor: `FueledStove` owned by the
#   colonists at (198, 120) lit, `TorchLamp` side light (existing, (200, 119)), a `Shelf` left of the stove with
#   `FZRawWheat` and `EggChickenUnfertilized` on it, a stack of `FZEggBiscuit` on the floor right of the stove
#   (previous batch), `WoodLog` stack. Nelim forced into the cooking job on the stove (bill `CookFZEggBiscuit`),
#   smile, mid-task; Shogun lying west of the stove facing west (`lies at`). Instant: just before the next
#   batch comes out; the cooking progress bar kept if it survives the hidden UI. Says: the grain becomes biscuits
#   at the stove, the first ones already out. Subtitle: "Grain in, biscuits out."
# 3 bake-3-the-five. Place `dining-nook` (centre (176, 108), furnished: orchid, low cabinet, scroll, chairs),
#   zoom 2.8 (193 px per cell, the five biscuits about 27 px each at 268 px). 10:00, Clear, daylight, candles unlit. Decor: a `Table3x3c` at (180, 108) with the five biscuits
#   on it in the order pale `FZEggBiscuit`, green `FZInsectJellyBiscuits`, golden `FZCookies`, red
#   `FZBerryBiscuits`, dark `FZChocolateCookies`, so no two near colours touch; Nelim beside the table, hands
#   empty, smile, her gaze and her first step toward the table; Shogun lying under the table edge facing
#   south. Instant: the first batch is out and she has just turned to it. Obtained by the joy job
#   `EatFZBiscuits` forced on Nelim, the game paused about 30 ticks after it starts (movement begun). Says:
#   five different biscuits, and she chooses.
#   Subtitle: "The first batch is out. Which one?"
# 4 bake-4-a-bite. Place `cloister` (centre (178, 128), covered gallery with the torii), zoom about 3 (180 px per cell). 11:00,
#   Clear, short shadows. Decor: a `Stool` and a small table at (177, 128), `TorchLamp` lit, `PlantPot` with
#   `Plant_Daylily` fully grown, flagstone floor as is. Nelim sitting on the `Stool` (`sits on the building`),
#   `FZInsectJellyBiscuits` in hand (`holds in hand`, the green biscuit she took in scene 3), then the joy job
#   `EatFZBiscuits` forced on her, the game paused at the first bite; the mouth the eating job gives her (written
#   trait: eating); Shogun sitting one cell away facing south, head toward the biscuit (front view of the
#   animal). Instant: the first bite. Closing image. Says: a colonist stops to eat a biscuit for pleasure.
#   Subtitle: "A pause, a biscuit, a smile."
# 5 interface bake-5-the-bills (window, no subtitle, on `window-backdrop-for-height`): the stove's Add-bill list
#   with the mod's recipes visible. Needs a step that opens the list (to ask NPT at rate-gallery). Cropped.
# 6 interface bake-6-the-memory (window, no subtitle, same backdrop): the Needs tab mood list with the memory a
#   biscuit leaves. Needs the thought given first (step `has the thought`), to ask NPT if missing. Cropped.
#
# DIRECTOR PASS (Opus, one call). KEPT: wheat half harvested with grain in the foreground; Nelim standing, not
# "mid-stride"; zoom 7 and 5 for the subjects; shelf and a finished stack in scene 2 so input and output show;
# campfire out of frame; five colours spaced so none merge; daylight instead of candles; hours 08 to 11, a
# weather and light that advance; Shogun in every scene, front view only in scene 4; second interface window
# for the memory. CHANGED: "mouth open from the job" kept only as the mouth the job gives her, whatever it is,
# written as a trait of eating (Facial Animation does read the job); Shogun faces east in scene 1 as advised.
# NOT KEPT: nothing refused. RISKS (untested in a gallery): item in hand, forced cooking job, forced joy job,
# items on a table; a small ticket on scenes 2 to 4 comes before the full series (rate-gallery).
@save @gallery
Feature: a baking morning at the Sanctuary
