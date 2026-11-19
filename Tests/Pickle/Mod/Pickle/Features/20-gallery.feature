# GALLERY SHOTLIST (written 2026-11-15, before any scenario is played; director pass by an Opus sub-agent, remarks kept below).
#
# STORY (one): a baking morning at the Sanctuary. Nelim (the only colonist, Virginie) harvests the wheat of the
# plant garden, bakes the grain at a stove, sets the first batch on a table and stops to eat one. Shogun, her
# labrador (in the save, leather collar), follows her from scene to scene. One morning, 08:00 to 11:00, one hour
# per scene (`I set the hour to N`), the weather and the light advance with the day: fog at 8h, clear after.
# Nelim keeps her emerald tunic `LTS_Tunika` and gold earrings `Apparel_PAESmallEarrings` (validated 2026-11-04,
# free outfit, same day: no change of clothes), hairstyle `Roo_HD_Hair_Highpony` (high ponytail, no hat in this
# series). Smile on every scene by default; scene 4 shows the mouth the eating job gives her (written trait,
# reason: she is eating). No sweat: temperature 20 degrees, own face set last.
# Places and animal are NSB's (free to use, no validation needed). The mod adds no animal.
# Save: `Nelims-tribe-decor-mods-z3` (final decorated fixture of NSB). Maps: the Sanctuary base map plus this mod;
# the pass and its map are set at rate-gallery.
#
# Series: wide (1), medium (2), tight (3, 4); opening = the field, closing = the bite; rhythm advances by
# time, place and action. Decor is placed for one image and removed after it.
#
#   1. bake-1-the-field. Place `plant-garden` (fenced plant enclosure south of the house, paved path, bench),
#        frame the cell (190, 85) at zoom 7 (77 px per cell at 1080p, so the foreground grain stack is about 77 px,
#        11 px at 268 px, plus the golden rows behind it). 8h, weather Fog, long low shadows. Decor: two rows of
#        `FZPlant_Wheat` fully grown from (184, 88) to (189, 87), a third row cut bare with two stacks of `FZRawWheat`
#        at (185, 86) and (188, 86) and a third stack at (183, 85) lower left foreground; `TorchLamp` lit at (191, 91)
#        (left on since the night), `WoodLog` at (186, 82) by the bench, two `Plant_Daylily` fully grown at (190, 83)
#        and (191, 83). Nelim at (188, 84) carrying `FZRawWheat` in her arms (the hauler pose of `carries the item`),
#        smile; Shogun at the gate (192, 90) facing East. Instant: just after she picks up the grain of the cut
#        row; obtained by `stands at`, `carries the item`, `faces`, the game paused right after the last step.
#        Says: the day starts with the wheat harvest. Subtitle: "The wheat is in."
#   2. bake-2-the-stove. Place `terrace` (covered veranda, x 193-200, z 118-124), frame the cell (198, 120) at zoom 3
#        (180 px per cell), the existing campfire at (194, 121) hidden. 9h, Clear, sun low through the veranda.
#        Decor: `FueledStove` owned by the colonists at (198, 120) lit, `TorchLamp` side light already in the
#        save beside the stove, a `Shelf` at (195, 122) with `FZRawWheat` and `EggChickenUnfertilized` on its cells, a stack of
#        `FZEggBiscuit` at (200, 121) (previous batch), `WoodLog` at (196, 121). Nelim forced into the cooking job on
#        the stove (bill `CookFZEggBiscuit`), smile, mid-task; Shogun lying at (195, 120) facing West. Instant: just
#        before the next batch comes out; the cooking progress bar kept if it survives the hidden UI.
#        Says: the grain becomes biscuits at the stove, the first ones already out. Subtitle: "Grain in, biscuits out."
#   3. bake-3-the-five. Place `dining-nook` (furnished: orchid, low cabinet, scroll, chairs), frame the cell (180, 108)
#        at zoom 2.8 (193 px per cell, the five biscuits about 27 px each at 268 px). 10h, Clear, daylight, candles
#        unlit. Decor: a `Table3x3c` at (180, 108) with the five biscuits on it: pale `FZEggBiscuit` at (179, 109),
#        green `FZInsectJellyBiscuits` at (180, 109), golden `FZCookies` at (181, 109), red `FZBerryBiscuits` at
#        (179, 107), dark `FZChocolateCookies` at (181, 107), so no two near colours touch; Nelim at (178, 108)
#        hands empty, smile, her gaze and her first step toward the table; Shogun lying at (180, 106) under the
#        table edge facing South. Instant: the first batch is out and she has just turned to it. Obtained by the joy
#        job `EatFZBiscuits` forced on Nelim, the game paused about 30 ticks after it starts (movement begun).
#        Says: five different biscuits, and she chooses. Subtitle: "The first batch is out. Which one?"
#   4. bake-4-a-bite. Place `cloister` (covered gallery with the torii), frame the cell (178, 128) at zoom 3
#        (180 px per cell). 11h, Clear, short shadows. Decor: a `Stool` at (177, 128) and a `Table1x2c` at (179, 128),
#        `TorchLamp` lit at (176, 129), two `Plant_Daylily` fully grown at (180, 129) and (181, 129), flagstone floor
#        as is. Nelim sitting on the `Stool` (`sits on the building`), `FZInsectJellyBiscuits` in hand (`holds in
#        hand`, the green biscuit she took in scene 3), then the joy job `EatFZBiscuits` forced on her, the game
#        paused at the first bite; the mouth the eating job gives her (written trait: eating); Shogun standing at
#        (176, 127) one cell away facing South (front view of the animal). Instant: the first bite. Closing image.
#        Says: a colonist stops to eat a biscuit for pleasure. Subtitle: "A pause, a biscuit, a smile."
#   5. bake-5-the-bills, interface window (no subtitle, on `window-backdrop-for-height`): the stove's Add-bill list
#        with the mod's recipes visible. Composed from NPT's steps (answer 2026-11-19, not yet played): select the stove, open the Bills tab, click AddBill. Cropped.
#   6. bake-6-the-memory, interface window (no subtitle, same backdrop): the Needs tab mood list with the memory a
#        biscuit leaves. NPT's new step gives the thought, then the Needs tab opens (2026-11-19, compiled, not played). Cropped.
#
# DIRECTOR PASS (Opus, one call). KEPT: wheat half harvested with grain in the foreground; Nelim carrying, not
# "mid-stride"; zoom 7 and 3 for the subjects; shelf and a finished stack in scene 2 so input and output show;
# campfire hidden; five colours spaced so none merge; daylight instead of candles; hours 8 to 11, a weather and
# light that advance; Shogun in every scene, front view only in scene 4; second interface window for the memory.
# CHANGED: "mouth open from the job" kept only as the mouth the job gives her, whatever it is, written as a trait
# of eating (Facial Animation does read the job); Shogun faces East in scene 1 as advised. NOT KEPT: nothing
# refused. Scenario writing (2026-11-15): flower pots dropped (a plant cannot be placed on a building), Shogun
# stands in scene 4 (the steps give stand and lie, no sit), Nelim's facing is not set (no step).
# RISKS (untested in a gallery): item in hand, forced cooking job, forced joy job, items on a table; the free
# cells and the gate cell of the coordinates above are read from the cases doc, not seen; a small ticket on scenes
# 2 to 4 comes before the full series (rate-gallery).
@save @gallery @slow
@requires:nelim.pickletools.screenshotstudio
@requires:nelim.pickletools.camerazoom
@requires:nelim.pickletools.stagedecor
@requires:nelim.pickletools.colonistrace
@requires:nelim.pickletools.inspecttabs
@requires:nelim.pickletools.keyedclick
Feature: a baking morning at the Sanctuary

  Scenario: bake-1-the-field
    Given the save "Nelims-tribe-decor-mods-z3" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the item and name labels are hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: the weather is set at once to "Fog"
    And I set the hour to 8
    And Nelim's Pickle Tools: I place the decor "FZPlant_Wheat" at (184, 88) fully grown
    And Nelim's Pickle Tools: I place the decor "FZPlant_Wheat" at (185, 88) fully grown
    And Nelim's Pickle Tools: I place the decor "FZPlant_Wheat" at (186, 88) fully grown
    And Nelim's Pickle Tools: I place the decor "FZPlant_Wheat" at (187, 88) fully grown
    And Nelim's Pickle Tools: I place the decor "FZPlant_Wheat" at (188, 88) fully grown
    And Nelim's Pickle Tools: I place the decor "FZPlant_Wheat" at (189, 88) fully grown
    And Nelim's Pickle Tools: I place the decor "FZPlant_Wheat" at (184, 87) fully grown
    And Nelim's Pickle Tools: I place the decor "FZPlant_Wheat" at (185, 87) fully grown
    And Nelim's Pickle Tools: I place the decor "FZPlant_Wheat" at (186, 87) fully grown
    And Nelim's Pickle Tools: I place the decor "FZPlant_Wheat" at (187, 87) fully grown
    And Nelim's Pickle Tools: I place the decor "FZPlant_Wheat" at (188, 87) fully grown
    And Nelim's Pickle Tools: I place the decor "FZPlant_Wheat" at (189, 87) fully grown
    And Nelim's Pickle Tools: I place the decor "FZRawWheat" at (185, 86)
    And Nelim's Pickle Tools: I place the decor "FZRawWheat" at (188, 86)
    And Nelim's Pickle Tools: I place the decor "FZRawWheat" at (183, 85)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (191, 91)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (191, 91) is lit
    And Nelim's Pickle Tools: I place the decor "WoodLog" at (186, 82)
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (190, 83) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (191, 83) fully grown
    And Nelim's Pickle Tools: the animal "Shogun" stands at (192, 90) facing East
    And Nelim's Pickle Tools: "Nelim" stands at (188, 84)
    And Nelim's Pickle Tools: "Nelim" carries the item "FZRawWheat"
    When Nelim's Pickle Tools: I frame the cell (190, 85) at zoom 7
    And Nelim's Pickle Tools: I let 30 ticks pass
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "bake-1-the-field"
    Then Nelim's Pickle Tools: the decor is removed

  Scenario: bake-2-the-stove
    Given the save "Nelims-tribe-decor-mods-z3" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the item and name labels are hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: the weather is set at once to "Clear"
    And I set the hour to 9
    And Nelim's Sanctuary: the "Campfire" near (194, 121) is hidden
    And Nelim's Pickle Tools: I place the decor "FueledStove" owned by the colonists at (198, 120)
    And Nelim's Pickle Tools: the decor "FueledStove" at (198, 120) is lit
    And Nelim's Pickle Tools: I place the decor "Shelf" at (195, 122)
    And Nelim's Pickle Tools: I place the decor "FZRawWheat" at (195, 122)
    And Nelim's Pickle Tools: I place the decor "EggChickenUnfertilized" at (196, 122)
    And Nelim's Pickle Tools: I place the decor "FZEggBiscuit" at (200, 121)
    And Nelim's Pickle Tools: I place the decor "WoodLog" at (196, 121)
    And I add bill "CookFZEggBiscuit" to the "FueledStove"
    And Nelim's Pickle Tools: the animal "Shogun" lies at (195, 120) facing West
    And Nelim's Pickle Tools: "Nelim" is forced into the job "DoBill" on the building "FueledStove" at (198, 120)
    When Nelim's Pickle Tools: I frame the cell (198, 120) at zoom 3
    And Nelim's Pickle Tools: I let 40 ticks pass
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "bake-2-the-stove"
    Then Nelim's Pickle Tools: the decor is removed

  Scenario: bake-3-the-five
    Given the save "Nelims-tribe-decor-mods-z3" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the item and name labels are hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: the weather is set at once to "Clear"
    And I set the hour to 10
    And Nelim's Pickle Tools: I place the decor "Table3x3c" at (180, 108)
    And Nelim's Pickle Tools: I place the decor "FZEggBiscuit" at (179, 109)
    And Nelim's Pickle Tools: I place the decor "FZInsectJellyBiscuits" at (180, 109)
    And Nelim's Pickle Tools: I place the decor "FZCookies" at (181, 109)
    And Nelim's Pickle Tools: I place the decor "FZBerryBiscuits" at (179, 107)
    And Nelim's Pickle Tools: I place the decor "FZChocolateCookies" at (181, 107)
    And Nelim's Pickle Tools: "Nelim" stands at (178, 108)
    And Nelim's Pickle Tools: the animal "Shogun" lies at (180, 106) facing South
    And Nelim's Pickle Tools: the joy giver "EatFZBiscuits" job is forced on "Nelim"
    When Nelim's Pickle Tools: I frame the cell (180, 108) at zoom 2.8
    And Nelim's Pickle Tools: I let 30 ticks pass
    And Nelim's Sanctuary: Nelim has her own face
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "bake-3-the-five"
    Then Nelim's Pickle Tools: the decor is removed

  Scenario: bake-4-a-bite
    Given the save "Nelims-tribe-decor-mods-z3" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: the item and name labels are hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: the weather is set at once to "Clear"
    And I set the hour to 11
    And Nelim's Pickle Tools: I place the decor "Stool" owned by the colonists at (177, 128)
    And Nelim's Pickle Tools: I place the decor "Table1x2c" at (179, 128)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (176, 129)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (176, 129) is lit
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (180, 129) fully grown
    And Nelim's Pickle Tools: I place the decor "Plant_Daylily" at (181, 129) fully grown
    And Nelim's Pickle Tools: the animal "Shogun" stands at (176, 127) facing South
    And Nelim's Pickle Tools: "Nelim" sits on the building "Stool" at (177, 128)
    And Nelim's Pickle Tools: the colonist "Nelim" holds "FZInsectJellyBiscuits" in hand
    And Nelim's Pickle Tools: the joy giver "EatFZBiscuits" job is forced on "Nelim"
    When Nelim's Pickle Tools: I frame the cell (178, 128) at zoom 3
    And Nelim's Pickle Tools: I let 20 ticks pass
    And I take a screenshot "bake-4-a-bite"
    Then Nelim's Pickle Tools: the decor is removed

  Scenario: bake-5-the-bills interface window
    Given the save "Nelims-tribe-decor-mods-z3" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And I set the hour to 9
    And Nelim's Pickle Tools: I place the decor "FueledStove" owned by the colonists at (198, 120)
    And Nelim's Pickle Tools: the recipe for "CookFZEggBiscuit" is available at "FueledStove"
    When Nelim's Pickle Tools: I select the thing of def "FueledStove" at (198, 120)
    And Nelim's Pickle Tools: I open the "Bills" inspect tab
    And Nelim's Pickle Tools: I click button keyed "AddBill"
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "bake-5-the-bills"
    Then Nelim's Pickle Tools: the decor is removed

  Scenario: bake-6-the-memory interface window
    Given the save "Nelims-tribe-decor-mods-z3" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And I set the hour to 11
    And Nelim's Pickle Tools: "Nelim" gains the memory thought "AteFZCookies"
    When Nelim's Pickle Tools: I select the colonist named "Nelim" alone
    And Nelim's Pickle Tools: I open the "ITab_Pawn_Needs" inspect tab
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "bake-6-the-memory"
