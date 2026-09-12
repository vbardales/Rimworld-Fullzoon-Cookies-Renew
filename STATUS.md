---
mod:          Fullzoon's Cookies Renew
packageId:    nelim.fullzooncookiesrenew
repo:         Rimworld-Fullzoon-Cookies-Renew
visibility:   public
detached:     yes
stage:        preTest
licence:      silent
licence_at:   four places, the About and the Steam page among them
dependencies: none
showcase:     complete
tested_on:
workshop:
remaining:
  - unverified: never seen running in game
session:      local_e26c87bd-50c9-4420-aba0-572f5dd2f69d
updated:      2026-09-12, releve automatique
---

# Fullzoon's Cookies Renew — status

Fiche d'etat, lue par une passe sur tous les mods plutot qu'en interrogeant les fils un a un.
Elle vit a la racine, jamais dans `Mod/`, donc Steam ne la recoit pas.

Les champs ci-dessus ont ete deduits du disque le 2026-09-12. Trois ne peuvent pas l'etre et
attendent la session qui tient ce mod :

- **`stage`** — one of `port`, `showcase`, `preTest`, `done`, `tested`, `published`. Filled in
  from the session group where one exists; confirm it.
- **`tested_on`** — the date of the last run in game. Empty means never.
- **`dependencies`** — `declared` when every mod this one needs is named in the About's
  `modDependencies`, `to check` when a non-vanilla `loadAfter` suggests a dependency that is not
  declared, `none` when the mod needs nothing. An undeclared dependency is not cosmetic: on
  2026-09-11 Reequilibrage animaux took 47 vanilla animals down with it, Muffalo included, because
  the class it injects belongs to a mod that was not declared and not loaded.
- **`reste`** — ce qu'il reste a faire, en trois categories : `feature` pour une
  fonctionnalite manquante au premier jet, `defaut` pour un defaut connu non corrige,
  `non_verifie` pour ce qui n'a pas pu etre verifie. La ligne posee d'office dit le vrai
  pour presque tout le depot ; la remplacer des qu'elle cesse de l'etre.

Vocabulaire de `licence` : `open` licence explicite, `silent` aucune licence et source morte,
`alive` aucune licence mais source vivante, `forbidden` refus ecrit, `original` rien de repris.
