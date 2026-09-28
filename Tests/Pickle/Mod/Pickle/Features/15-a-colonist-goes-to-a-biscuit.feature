# A colonist with time to spare goes to a biscuit for pleasure, eats it, and keeps its memory. This is the
# claim the mod makes about itself, and the one a file cannot show: it is the joy giver EatFZBiscuits at work
# inside the game's own choice of what a colonist does next.
#
# NOTHING HERE HAS BEEN PLAYED, and this is the least deterministic scenario of the suite, since it asks the
# game to CHOOSE. What is done to make the choice likely rather than luck:
#   - the joy need is set to one percent, so that joy is what the colonist wants above the work of a colony;
#   - the food need is set to full, so that an Ingest job cannot be hunger's;
#   - one biscuit is the only food for joy a colonist may take: test-colony holds no chocolate and one stack of
#     insect jelly, at (91, 154), which the save marks forbidden and which JoyGiver_Ingest refuses (it checks
#     IsForbidden), and its meals and pemmican are not joy food;
#   - the biscuit is an insect jelly biscuit, the one with the most joy and a memory of its own, so a job for it
#     and the memory it leaves name the same biscuit.
# Other joy givers compete, and the colony may have things to do that joy does not outweigh; if the first run
# never sees the job, look at what the colonist did instead before blaming the giver.
#
# "I wait for X to have job" gives up after 30 real seconds, at the speed set. The memory is checked afterwards
# and waits for itself: eating takes a few game seconds after the job starts.
@save @slow
Feature: a colonist with time to spare goes to a biscuit

  @timeout:300
  Scenario: an insect jelly biscuit is chosen for pleasure and leaves its memory
    Given the save "test-colony" is loaded
    And a colonist "Guest" exists
    And I spawn a "FZInsectJellyBiscuits" at (146, 155)
    When "Guest" needs "Food" is set to 100 percent
    And "Guest" needs "Joy" is set to 1 percent
    And game speed is ultrafast
    And I wait for "Guest" to have job "Ingest"
    Then "Guest" has thought "AteFZInsectJellyBiscuits"
    And no errors were logged
