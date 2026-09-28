# Without another wheat mod nothing stands down: the crop stays in the sow menu. The patch is conditional on the
# def PlantWheat, which is Mlie's Vanilla-like Wheat's crop (vanilla has rice and no wheat), so with that mod
# absent the patch must have changed nothing. "no def ... was patched" reads the patch tree Pickle keeps and
# keeps only the operations that changed something, which is exactly the claim.
#
# Played in the passes WITHOUT Mlie's mod. A pass that mounts it leaves this out with !@wheat-alone: the
# scenario would be asserting the opposite of that pass, and its twin is 08.
@wheat-alone
Feature: without another wheat mod the wheat is left alone

  Scenario: the other wheat is absent and the patch changed nothing
    Given the main menu is open
    Then mod "Mlie.VanillalikeWheat" is not loaded
    And no def "PlantWheat" exists
    And no def "FZPlant_Wheat" was patched
