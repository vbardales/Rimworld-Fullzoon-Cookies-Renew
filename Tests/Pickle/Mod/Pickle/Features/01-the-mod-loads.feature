# The loaded-game half of what a person would read from the defs in the game's own database. No save is loaded
# and none is needed: the def database is built before any game exists, which is also why these scenarios
# take a second or two each and play in every pass, whatever language the game was started in.
#
# The port added nothing that could make a def go missing quietly except the file it lives in, so the check
# is that every def of the mod is in the database the game built: one crop, its grain, five biscuits, the
# five memories they leave and the fifteen bills a stove offers.
Feature: the mod loads and defines its crop, its grain, its biscuits, their memories and their recipes

  Scenario: the mod is loaded
    Given the main menu is open
    Then mod "nelim.fullzooncookies" is loaded
    And mod "Fullzoon's Cookies Renew (unofficial)" is loaded

  Scenario: the crop, the grain and the five biscuits exist
    Given the main menu is open
    Then def "FZPlant_Wheat" of type "ThingDef" exists
    And def "FZRawWheat" of type "ThingDef" exists
    And def "FZEggBiscuit" of type "ThingDef" exists
    And def "FZChocolateCookies" of type "ThingDef" exists
    And def "FZCookies" of type "ThingDef" exists
    And def "FZBerryBiscuits" of type "ThingDef" exists
    And def "FZInsectJellyBiscuits" of type "ThingDef" exists

  Scenario: the five memories a biscuit leaves exist
    Given the main menu is open
    Then def "AteFZEggBiscuit" of type "ThoughtDef" exists
    And def "AteFZChocolateCookies" of type "ThoughtDef" exists
    And def "AteFZCookies" of type "ThoughtDef" exists
    And def "AteFZBerryBiscuits" of type "ThoughtDef" exists
    And def "AteFZInsectJellyBiscuits" of type "ThoughtDef" exists

  Scenario: the fifteen bills exist
    Given the main menu is open
    Then def "CookFZEggBiscuit" of type "RecipeDef" exists
    And def "Cook5FZEggBiscuit" of type "RecipeDef" exists
    And def "Cook10FZEggBiscuit" of type "RecipeDef" exists
    And def "CookFZChocolateCookies" of type "RecipeDef" exists
    And def "Cook5FZChocolateCookies" of type "RecipeDef" exists
    And def "Cook10FZChocolateCookies" of type "RecipeDef" exists
    And def "CookFZCookies" of type "RecipeDef" exists
    And def "Cook5FZCookies" of type "RecipeDef" exists
    And def "Cook10FZCookies" of type "RecipeDef" exists
    And def "CookFZBerryBiscuits" of type "RecipeDef" exists
    And def "Cook5FZBerryBiscuits" of type "RecipeDef" exists
    And def "Cook10FZBerryBiscuits" of type "RecipeDef" exists
    And def "CookFZInsectJellyBiscuits" of type "RecipeDef" exists
    And def "Cook5FZInsectJellyBiscuits" of type "RecipeDef" exists
    And def "Cook10FZInsectJellyBiscuits" of type "RecipeDef" exists

  # The giver that sends a colonist with time to spare to a biscuit, the way vanilla's EatChocolate sends one to
  # chocolate. Without it the biscuits pay their joy only to a starving colonist: see 15 and the run log.
  Scenario: the joy giver for the biscuits exists
    Given the main menu is open
    Then def "EatFZBiscuits" of type "JoyGiverDef" exists
    And def "EatFZBiscuits" field "joyKind" is "Gluttonous"
    And def "EatChocolate" of type "JoyGiverDef" exists
    And no def "EatChocolate" was patched
