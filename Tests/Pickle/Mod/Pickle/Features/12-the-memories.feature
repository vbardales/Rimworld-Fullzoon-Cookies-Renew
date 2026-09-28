# Each biscuit leaves its own memory, worth its own mood, for half a day. The memory is given to a colonist
# directly and the game is asked what it contributes: this proves the five ThoughtDefs are wired and worth
# +3, +5, +5, +3 and +7, and nothing about WHEN a colonist gets one.
#
# The when is the biscuit's tasteThought, given by the game when a colonist ingests one. That is 15: a colonist
# with time to spare is sent to a biscuit by the joy giver and gets the memory by eating it. A starving colonist
# beside nothing but a biscuit is not played, since test-colony holds meals and pemmican that it would take
# first.
#
# "is given thought" proves the memory landed and lists every thought the pawn holds when it did not, which is
# how a trait or a precept that nullifies it would show.
@save
Feature: each biscuit leaves a memory worth its mood

  Scenario: the five memories and their moods
    Given the save "test-colony" is loaded
    And a colonist "Eater" exists
    When "Eater" is given thought "AteFZEggBiscuit"
    And "Eater" is given thought "AteFZChocolateCookies"
    And "Eater" is given thought "AteFZCookies"
    And "Eater" is given thought "AteFZBerryBiscuits"
    And "Eater" is given thought "AteFZInsectJellyBiscuits"
    Then "Eater" has thought "AteFZEggBiscuit"
    And "Eater" thought "AteFZEggBiscuit" mood offset is 3
    And "Eater" thought "AteFZChocolateCookies" mood offset is 5
    And "Eater" thought "AteFZCookies" mood offset is 5
    And "Eater" thought "AteFZBerryBiscuits" mood offset is 3
    And "Eater" thought "AteFZInsectJellyBiscuits" mood offset is 7
    And no errors were logged
