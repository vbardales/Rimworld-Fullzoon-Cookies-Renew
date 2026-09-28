# Nothing in the game's log belongs to the mod as an error, a warning, an unresolved definition or a message
# repeated five times. Pickle's own "no errors were logged" cannot say this: it reads what is logged after a
# scenario is armed, and arming clears the buffer, while a def that fails to load logs at startup. This step
# reads the log from the start of the game (PickleTools/LoadAudit), and attributes a message to the mod by the
# tag the game's logger puts on it, by a stack frame in the mod's assemblies, or by a def of the mod named in
# it. This mod has no assembly, so what attributes a message to it is the tag or one of its defs.
#
# The tool is not in the aggregate bundle: the pass map stages it (wsl-deps.*.map), and the tag below skips
# the feature, counted as skipped and never as passed, in a pass that did not.
@requires:nelim.pickletools.loadaudit
Feature: the load of the mod is clean

  Scenario: nothing logged at startup belongs to the mod as a problem
    Given the main menu is open
    Then Nelim's Pickle Tools: the load of the mod "nelim.fullzooncookies" is clean
