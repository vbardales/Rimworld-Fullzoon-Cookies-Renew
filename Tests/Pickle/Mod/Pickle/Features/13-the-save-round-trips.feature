# What the mod leaves in a colony is still there after a save and a reload: the grain, the biscuits, a plant of
# the crop in the ground, and a bill queued at a stove. This is the persistence half of what a mod made only of
# defs can lose: a def whose name changed, or whose class cannot be saved, comes back as nothing.
#
# The original's defNames are kept so that a colony moves between the two mods without losing anything, and
# this is the loaded-game check that the names still hold in the port's own saves. That a save made by the
# ORIGINAL mod loads is a different claim, which needs a save that only the original can make: see TESTING.md.
#
# After a reload every object kept from before belongs to the game that was replaced. Nothing here holds one:
# the steps below find things again by definition and by cell.
#
# The counts are read over the whole map (test-colony holds none of these things), not in the stockpile: the
# spawn step places a stack NEAR the first stockpile cell, and nothing promises it stays inside the zone.
@save
Feature: the mod's things survive a save and a reload

  Scenario: grain, biscuits, a plant of the crop and a queued bill come back
    Given the save "test-colony" is loaded
    And a "FueledStove" is built at (140, 155)
    And 5 "FZRawWheat" is spawned at the stockpile
    And 5 "FZEggBiscuit" is spawned at the stockpile
    And I spawn a "FZPlant_Wheat" at (144, 155)
    And I add bill "CookFZEggBiscuit" to the "FueledStove"
    When I save and reload
    Then 5 "FZRawWheat" exist
    And 5 "FZEggBiscuit" exist
    And a "FZPlant_Wheat" is at (144, 155)
    And the "FueledStove" has 1 bills
    And no errors were logged
