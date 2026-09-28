# A colonist really bakes: walks to the stove, refuels it, carries the ingredients, works the bill, and five
# biscuits come out. This is the end-to-end craft the game can be asked and a file cannot, and the only place
# where the recipe, its ingredient filter, the products count and the stove come together.
#
# NOTHING HERE HAS BEEN PLAYED. It leans on things that only a run settles, and the first run is expected to
# say which:
#   - the cook is made able to cook and to haul from two vanilla backstories that disable no work (SewerKid57
#     and StewKeeper95), and the scenario asserts both capabilities before it relies on them;
#   - the fuelled stove starts empty, and the cook is expected to refuel it from the wood in the stockpile,
#     which is the Hauling work type, so the cook is given that priority too;
#   - test-colony holds two stockpile zones already, and "the stockpile" is the first of them. The fixture
#     holds no chicken egg, no wheat and no biscuit, so what is baked is what this scenario spawns.
#
# "I wait for bill" gives up after 120 real seconds and then the watchdog ends the whole run: the scenario is
# tagged @slow, the speed is raised to the maximum, and the per-scenario limit is raised with @timeout. Both
# scenarios ask for one x1 bill, which makes five biscuits; the x5 and x10 are asserted offline by
# _tools/Check-Recipes.ps1, as multiples of it.
@save @slow
Feature: a colonist bakes five biscuits

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
  Scenario: wheat grain and a chicken egg make five egg biscuits
    Given 5 "FZRawWheat" is spawned at the stockpile
    And 1 "EggChickenUnfertilized" is spawned at the stockpile
    When I add bill "CookFZEggBiscuit" to the "FueledStove"
    And game speed is ultrafast
    And I wait for bill "CookFZEggBiscuit" to finish
    Then 5 "FZEggBiscuit" exist
    And no errors were logged

  # The fixture holds no unfertilised egg, its only egg-named things being two insect egg sacs, so the duck
  # egg is the only one in the colony. Had the recipe still named EggChickenUnfertilized, as the original
  # did, no bill could take it and the wait would time out.
  @timeout:300
  Scenario: a duck egg is as good as a chicken's
    Given 5 "FZRawWheat" is spawned at the stockpile
    And 1 "EggDuckUnfertilized" is spawned at the stockpile
    When I add bill "CookFZEggBiscuit" to the "FueledStove"
    And game speed is ultrafast
    And I wait for bill "CookFZEggBiscuit" to finish
    Then 5 "FZEggBiscuit" exist
    And no errors were logged
