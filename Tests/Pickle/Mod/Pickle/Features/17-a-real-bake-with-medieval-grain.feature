# The same bake as 11, with the grain of another wheat mod: the fifteen recipes accept "DankPyon_RawWheat" through
# <li MayRequire="DankPyon.Medieval.Overhaul">, read only when that mod is active. Nothing of this mod is patched: the wheat of Medieval Overhaul
# keeps its own plant and its own defNames, and the grain is spawned by name.
#
# See 10 for what is assumed about the cook and the stove. Not played yet, filed 2026-11-14.
#
# The tag skips the feature, counted as skipped and never as passed, in a pass that did not stage the mod.
@requires:DankPyon.Medieval.Overhaul @save @slow
Feature: a colonist bakes five biscuits from Medieval Overhaul grain

  Background:
    Given the save "test-colony" is loaded
    And a "FueledStove" is built at (140, 155)
    And 30 "WoodLog" is spawned at the stockpile
    And a colonist "Baker" exists
    And "Baker" has childhood "SewerKid57"
    And "Baker" has backstory "StewKeeper95"
    And "Baker" skill "Cooking" is set to level 10
    Then "Baker" can do "Cooking"
    And "Baker" can do "Hauling"
    When I set "Baker" priority "Cooking" to 1
    And I set "Baker" priority "Hauling" to 2

  @timeout:300
  Scenario: Medieval Overhaul grain and a chicken egg make five egg biscuits
    Given 5 "DankPyon_RawWheat" is spawned at the stockpile
    And 1 "EggChickenUnfertilized" is spawned at the stockpile
    When I add bill "CookFZEggBiscuit" to the "FueledStove"
    And game speed is ultrafast
    And I wait for bill "CookFZEggBiscuit" to finish
    Then 5 "FZEggBiscuit" exist
    And no errors were logged
