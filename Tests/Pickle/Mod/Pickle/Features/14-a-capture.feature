# One capture for a person to look at: the five biscuits and the grain lying side by side, close enough to
# tell apart. It asserts nothing about the image. A green step here says that a file was written, not that the
# five textures read as five different biscuits, and a capture nobody opens proves nothing.
#
# This is a review capture, not a Workshop capture. It shows the game's own HUD and Pickle's panel, which the
# publication images must not, and its subject is not framed for a page. The Workshop images, their order and
# what each shows belong to PUBLICATION.md, at the step after this one, and are made with the ScreenshotMode
# tool of PickleTools then.
#
# The five stand on five cells of one row and the grain on a sixth. The cells are the ones other suites of the
# collection spawn things on in test-colony, so they are free ground.
@save @review
Feature: the five biscuits and the grain, side by side

  Scenario: a row of biscuits and the grain on the ground
    Given the save "test-colony" is loaded
    And I spawn a "FZEggBiscuit" at (145, 155)
    And I spawn a "FZChocolateCookies" at (146, 155)
    And I spawn a "FZCookies" at (147, 155)
    And I spawn a "FZBerryBiscuits" at (148, 155)
    And I spawn a "FZInsectJellyBiscuits" at (149, 155)
    And I spawn a "FZRawWheat" at (150, 155)
    When I move the camera to (147, 155)
    And I zoom all the way in
    And I take a screenshot "the-five-biscuits-and-the-grain"
    Then no errors were logged
