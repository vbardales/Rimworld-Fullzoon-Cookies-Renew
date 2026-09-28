# What the game holds AFTER it merged the XML: inheritance and the port's deletions. The offline checks read
# the files, and they cannot see this. It is the reason the port exists.
#
# The original mod declared its own <ThingDef Name="PlantBase" Abstract="True">, the base every plant in the
# game inherits from, and its copy was not faithful: no BeautyOutdoors, and harvestWork 250 where vanilla says
# 200. Two abstract defs may share a name without an error, and RimWorld resolves a ParentName to the copy from
# the highest-loading mod at or below the def asking for it, so every plant of every mod loading after it could
# have been reparented onto the copy. The copy is deleted. Vanilla rice is the plant to ask: it inherits from
# the real base, and it would carry the copy's numbers if the copy had come back.
#
# "raw stat" reads the statBases entry as the merged def holds it and FAILS when the def has none, so a plant
# that lost BeautyOutdoors fails by name instead of reading the stat's default.
Feature: the defs carry what they inherit, as the game merged them

  Scenario: vanilla rice keeps the plant base it has always had
    Given the main menu is open
    Then def "Plant_Rice" raw stat "BeautyOutdoors" is 1
    And def "Plant_Rice" field "plant.harvestWork" is "200"

  Scenario: the wheat inherits the real plant base and keeps its own harvest work
    Given the main menu is open
    Then def "FZPlant_Wheat" raw stat "BeautyOutdoors" is 1
    And def "FZPlant_Wheat" field "plant.harvestWork" is "250"

  # The crop's two numbers a player plans a field by. The game's growth engine is not under test, and Pickle
  # has no step that grows a plant: its time steps move the calendar and nothing else. So the loaded values are
  # what can be asked, and they are the ones that would be lost if the crop came back with another base.
  Scenario: the wheat grows in four days and a half and yields six grain
    Given the main menu is open
    Then def "FZPlant_Wheat" field "plant.growDays" is "4.5"
    And def "FZPlant_Wheat" field "plant.harvestYield" is "6"
    And def "FZPlant_Wheat" field "plant.harvestedThingDef" is "FZRawWheat"

  # Every biscuit inherits its ingestible settings from the abstract snack base, not from its own XML: the
  # preferability that keeps a biscuit out of the meal rotation, and the kind of joy it is worth. Only the
  # merged def shows that the inheritance reached all five.
  Scenario: each biscuit is a snack that only a desperate colonist eats as a meal
    Given the main menu is open
    Then def "FZEggBiscuit" field "ingestible.preferability" is "DesperateOnly"
    And def "FZChocolateCookies" field "ingestible.preferability" is "DesperateOnly"
    And def "FZCookies" field "ingestible.preferability" is "DesperateOnly"
    And def "FZBerryBiscuits" field "ingestible.preferability" is "DesperateOnly"
    And def "FZInsectJellyBiscuits" field "ingestible.preferability" is "DesperateOnly"

  Scenario: each biscuit is worth gluttonous joy
    Given the main menu is open
    Then def "FZEggBiscuit" field "ingestible.joyKind" is "Gluttonous"
    And def "FZChocolateCookies" field "ingestible.joyKind" is "Gluttonous"
    And def "FZCookies" field "ingestible.joyKind" is "Gluttonous"
    And def "FZBerryBiscuits" field "ingestible.joyKind" is "Gluttonous"
    And def "FZInsectJellyBiscuits" field "ingestible.joyKind" is "Gluttonous"

  # What this does NOT say, and STATUS.md carries as a defect: the joy is only paid when a colonist ingests a
  # biscuit, and the game's only ingesting joy giver, JoyGiverDef EatChocolate, searches Chocolate and
  # InsectJelly by name and nothing else (JoyGiver_Ingest reads def.thingDefs, read from the 1.6 assembly on
  # 2026-09-28). So nothing here says a colonist is ever sent to a biscuit for pleasure, and there is no
  # scenario for it: it would assert the defect, and go red the day the defect is fixed.
