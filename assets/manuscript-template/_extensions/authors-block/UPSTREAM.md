# Upstream provenance

- Project: `kapsner/authors-block`
- Source: https://github.com/kapsner/authors-block
- Vendored version: `v0.2.1`
- Upstream commit: `7944a8623b10ae2926c40486a83920b700d4237c`
- License: MIT; see `LICENSE.md`

These files are included so a copied manuscript template contains the Quarto extension required by `manuscript.qmd`.

## Local modification

`from_author_info_blocks.lua` emits each affiliation as a separate Pandoc paragraph instead of joining affiliations with manual line breaks inside one paragraph. This prevents short affiliation lines from being stretched when the reference DOCX defines its body-text paragraph style as justified. Preserve or reevaluate this change when updating the vendored extension.
