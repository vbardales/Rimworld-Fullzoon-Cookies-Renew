# The same bake with Mlie's grain instead of this mod's: the recipes accept "RawWheat" through
# <li MayRequire="Mlie.VanillalikeWheat">, and that line is only read when the mod is active. In a pass
# without the mod the ingredient is not even in the list. That other half of the guard is what the load
# audit of 02 and the bakes of 10 see: they run with RawWheat absent from the list and must log nothing.
#
# See 10 for what is assumed about the cook and the stove, and why none of it has been played. This one adds
# nothing to that list except the grain: RawWheat is Mlie's def, spawned by name.
#
# The tag skips the feature, counted as skipped and never as passed, in a pass that did not stage the mod.
@requires:Mlie.VanillalikeWheat @save @slow
Feature: a colonist bakes five biscuits from Mlie's wheat

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
  Scenario: Mlie's grain and a chicken egg make five egg biscuits
    Given 5 "RawWheat" is spawned at the stockpile
    And 1 "EggChickenUnfertilized" is spawned at the stockpile
    When I add bill "CookFZEggBiscuit" to the "FueledStove"
    And game speed is ultrafast
    And I wait for bill "CookFZEggBiscuit" to finish
    Then 5 "FZEggBiscuit" exist
    And no errors were logged
