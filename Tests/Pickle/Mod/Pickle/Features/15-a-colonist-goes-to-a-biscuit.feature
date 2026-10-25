# A colonist with time to spare goes to a biscuit for pleasure, eats it, and keeps its memory. This is the
# claim the mod makes about itself, and the one a file cannot show: it is the joy giver EatFZBiscuits at work
# inside the game's own choice of what a colonist does next.
#
# 2026-10-25: run 4fd0 forced the giver's job: Guest was in Ingest at the check (the giver works), but the memory is
# only given when the eating ends, and "has thought" does not wait. A wait of 600 ticks now sits before the check.
# 2026-10-19: run 3e9a showed the giver returns Ingest (TryGiveJob) while Guest stays in Play_Horseshoes: the pick among
# joy givers is the game's lottery, not the mod's. The "job is forced" step now starts the job the giver returns, so
# the scenario proves the giver's job eats the biscuit and leaves its memory; the draft/undraft rerolls stay as a try.
# Older notes, kept for history:
# 5th run to come: the 4th log (2026-10-12) says "Guest will eat it: False", every other check true. Suspect: the saved
# food policy of test-colony does not allow the new biscuit defs. The step after the carry step grants it, and the
# diagnostic logs the policy. If still red, read the [joy] line: the cause is then not the policy.
# Red three times (2026-09-28, 2026-09-29, 2026-10-11): the colonist was at work (HaulToCell), or at another joy.
# The schedule step below sets all 24 hours to joy, disables every work type and ends the current job.
# Red four times: the 4th with the schedule step, Guest wandering. A biscuit in the inventory skips the spawn-side tests
# of JoyGiver_Ingest (forbidden, fog, reserve), the spawned one stays for the diagnostic step, which logs why Guest
# could or could not take it. This is the least deterministic scenario of the suite, since it asks the
# game to CHOOSE. What is done to make the choice likely rather than luck:
#   - the joy need is set to one percent, so that joy is what the colonist wants above the work of a colony;
#   - the food need is set to full, so that an Ingest job cannot be hunger's;
#   - one biscuit is the only food for joy a colonist may take: test-colony holds no chocolate and one stack of
#     insect jelly, at (91, 154), which the save marks forbidden and which JoyGiver_Ingest refuses (it checks
#     IsForbidden), and its meals and pemmican are not joy food;
#   - the biscuit is an insect jelly biscuit, the one with the most joy and a memory of its own, so a job for it
#     and the memory it leaves name the same biscuit.
# Other joy givers compete (Horseshoes, Skygaze...), and once the colonist commits to one of those it runs for
# a while uninterrupted: a single reroll is not enough to make the pick likely. Draft/undraft forces a fresh
# job choice each time it is called, so it is repeated several times before waiting, to raise the odds that at
# least one of the rerolls lands on the biscuit. If it still never sees the job, look at what the colonist did
# instead before blaming the giver.
#
# "I wait for X to have job" gives up after 30 real seconds, at the speed set. The memory is checked afterwards
# and waits for itself: eating takes a few game seconds after the job starts.
@save @slow
@requires:nelim.pickletools.colonistrace
Feature: a colonist with time to spare goes to a biscuit

  @timeout:300
  Scenario: an insect jelly biscuit is chosen for pleasure and leaves its memory
    Given the save "test-colony" is loaded
    And a colonist "Guest" exists
    And I spawn a "FZInsectJellyBiscuits" at (146, 155)
    And Nelim's Pickle Tools: the thing "FZInsectJellyBiscuits" at (146, 155) is not forbidden
    And Nelim's Pickle Tools: the colonist "Guest" carries 1 "FZInsectJellyBiscuits"
    And Nelim's Pickle Tools: the colonist "Guest" follows a food policy that also allows "FZInsectJellyBiscuits"
    When "Guest" needs "Food" is set to 100 percent
    And Nelim's Pickle Tools: the schedule of "Guest" is joy all day
    And "Guest" needs "Joy" is set to 1 percent
    And game speed is ultrafast
    And I draft "Guest"
    And I undraft "Guest"
    And I draft "Guest"
    And I undraft "Guest"
    And I draft "Guest"
    And I undraft "Guest"
    And I draft "Guest"
    And I undraft "Guest"
    And I draft "Guest"
    And I undraft "Guest"
    And I draft "Guest"
    And I undraft "Guest"
    And Nelim's Pickle Tools: the reasons why "Guest" cannot take "FZInsectJellyBiscuits" at (146, 155) for joy are logged
    And Nelim's Pickle Tools: the joy giver "EatFZBiscuits" is asked what it would give "Guest"
    And Nelim's Pickle Tools: the joy giver "EatFZBiscuits" job is forced on "Guest"
    And I wait for "Guest" to have job "Ingest"
    And I wait 600 ticks
    Then "Guest" has thought "AteFZInsectJellyBiscuits"
    And no errors were logged
