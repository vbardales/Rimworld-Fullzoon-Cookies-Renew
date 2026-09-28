# Beside Mlie's Vanilla-like Wheat (Continued) this wheat stands down: it leaves the sow menu, so a growing
# zone offers one wheat plant and not two called the same. The conditional patch removes the sowTags of
# FZPlant_Wheat when the def PlantWheat exists. What is asserted is the data the sow menu is built from and
# that the crop is still there to be harvested; the menu itself is the game's list, and nothing of this mod
# draws it.
#
# The patch tests a def, not a mod name: PatchOperationFindMod compares ModMetaData.Name by exact string, and
# that name is Mlie's to change. So if Mlie renames PlantWheat, this is the scenario that goes red.
#
# The tag skips the feature, counted as skipped and never as passed, in a pass that did not stage the mod.
# Mlie's mod requires SYR Processor Framework: the pass map lists it first.
@requires:Mlie.VanillalikeWheat
Feature: beside Mlie's wheat this wheat stands down

  Scenario: the other wheat is there and the patch took
    Given the main menu is open
    Then mod "Mlie.VanillalikeWheat" is loaded
    And def "PlantWheat" of type "ThingDef" exists
    And def "RawWheat" of type "ThingDef" exists
    And def "FZPlant_Wheat" was patched by mod "nelim.fullzooncookies"

  Scenario: the crop is withdrawn from sowing, not from the game
    Given the main menu is open
    Then def "FZPlant_Wheat" of type "ThingDef" exists
    And def "FZPlant_Wheat" field "plant.harvestedThingDef" is "FZRawWheat"
    And def "FZRawWheat" of type "ThingDef" exists
