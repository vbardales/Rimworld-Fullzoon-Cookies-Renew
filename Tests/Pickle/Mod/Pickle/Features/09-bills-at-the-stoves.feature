# The fifteen recipes are offered at the two vanilla stoves, all of them, and queued without an error. The bill
# step adds a bill only if the bench's recipe list holds the recipe, and stops the scenario with the list it
# does hold when it does not, so a recipe that lost its recipeUsers fails here by name, not silently.
#
# Nothing here needs power or fuel: a bill can be queued at a stove that is off. The other half of the claim,
# "and at nothing else", is asserted offline by _tools/Check-Recipes.ps1 (recipeUsers is exactly the two
# stoves); a campfire that accepted a bill cannot be told from one that refused it with a step Pickle has.
@save
Feature: the two vanilla stoves offer all fifteen bills

  Background:
    Given the save "test-colony" is loaded

  Scenario: the fuelled stove
    Given a "FueledStove" is built at (140, 155)
    When I add bill "CookFZEggBiscuit" to the "FueledStove"
    And I add bill "Cook5FZEggBiscuit" to the "FueledStove"
    And I add bill "Cook10FZEggBiscuit" to the "FueledStove"
    And I add bill "CookFZChocolateCookies" to the "FueledStove"
    And I add bill "Cook5FZChocolateCookies" to the "FueledStove"
    And I add bill "Cook10FZChocolateCookies" to the "FueledStove"
    And I add bill "CookFZCookies" to the "FueledStove"
    And I add bill "Cook5FZCookies" to the "FueledStove"
    And I add bill "Cook10FZCookies" to the "FueledStove"
    And I add bill "CookFZBerryBiscuits" to the "FueledStove"
    And I add bill "Cook5FZBerryBiscuits" to the "FueledStove"
    And I add bill "Cook10FZBerryBiscuits" to the "FueledStove"
    And I add bill "CookFZInsectJellyBiscuits" to the "FueledStove"
    And I add bill "Cook5FZInsectJellyBiscuits" to the "FueledStove"
    And I add bill "Cook10FZInsectJellyBiscuits" to the "FueledStove"
    Then the "FueledStove" has 15 bills
    And no errors were logged

  Scenario: the electric stove
    Given a "ElectricStove" is built at (146, 155)
    When I add bill "CookFZEggBiscuit" to the "ElectricStove"
    And I add bill "Cook5FZEggBiscuit" to the "ElectricStove"
    And I add bill "Cook10FZEggBiscuit" to the "ElectricStove"
    And I add bill "CookFZChocolateCookies" to the "ElectricStove"
    And I add bill "Cook5FZChocolateCookies" to the "ElectricStove"
    And I add bill "Cook10FZChocolateCookies" to the "ElectricStove"
    And I add bill "CookFZCookies" to the "ElectricStove"
    And I add bill "Cook5FZCookies" to the "ElectricStove"
    And I add bill "Cook10FZCookies" to the "ElectricStove"
    And I add bill "CookFZBerryBiscuits" to the "ElectricStove"
    And I add bill "Cook5FZBerryBiscuits" to the "ElectricStove"
    And I add bill "Cook10FZBerryBiscuits" to the "ElectricStove"
    And I add bill "CookFZInsectJellyBiscuits" to the "ElectricStove"
    And I add bill "Cook5FZInsectJellyBiscuits" to the "ElectricStove"
    And I add bill "Cook10FZInsectJellyBiscuits" to the "ElectricStove"
    Then the "ElectricStove" has 15 bills
    And no errors were logged
