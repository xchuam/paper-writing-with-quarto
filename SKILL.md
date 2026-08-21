---
name: paper-writing-with-quarto
description: Create, edit, and validate scientific manuscripts authored in Quarto and rendered to DOCX with a reference Word document, bibliography, and citation style. Use when a user needs a journal-style paper template, manuscript QMD workflow, Word reference formatting, citations, cross-references, figures, tables, appendices, or reproducible DOCX rendering. Use the companion quarto-authoring skill for general Quarto syntax and features.
---

# Paper Writing With Quarto

Build a portable manuscript project whose editable source is Quarto and whose Word formatting is controlled by a reference DOCX.

## Required Companion Skill

This skill depends on the Posit [`quarto-authoring`](https://github.com/posit-dev/skills/tree/main/quarto/quarto-authoring) skill.

- Use `quarto-authoring` for current QMD syntax, YAML, citations, cross-references, figures, tables, code cells, layouts, and extensions.
- Use this skill for scientific-manuscript structure, the bundled paper assets, reference-DOCX integration, and end-to-end paper validation.
- Read only the `quarto-authoring` references relevant to the current task.
- If `quarto-authoring` is unavailable, tell the user that the companion skill must be installed from the linked Posit repository before relying on this workflow.

The dependency is declared here because `agents/openai.yaml` currently supports formal dependencies only for MCP tools, not other skills.

## Workflow

1. Inspect the manuscript directory, user requirements, target journal guidance, and existing files before editing.
2. Preserve user content and journal-specific requirements. Treat supplied QMD, BibTeX, CSL, and reference DOCX files as authoritative unless the user asks to replace them.
3. Keep all manuscript resources reachable through relative paths. Do not introduce machine-specific paths or private example data.
4. Use the companion `quarto-authoring` guidance for the relevant Quarto mechanics.
5. Configure DOCX output with `reference-doc`, and keep document content in QMD rather than manually editing rendered output.
6. Ensure citation keys, resource paths, cross-reference identifiers, and required extensions resolve before rendering.
7. Render with Quarto when it is available, inspect warnings and errors, and verify the resulting DOCX structurally or visually as the task requires.
8. Report the files changed, the render command, validation evidence, and any dependency or formatting limitations.

## Manuscript Asset Set

A reusable example should keep these files together:

- manuscript `.qmd` source;
- bibliography `example_bibliography.bib` containing all cited keys; replace the example entries with the user's literature and exclude machine-specific reference-manager attachment paths;
- citation style `.csl` appropriate for the target journal; the starter includes `apa.csl` as a neutral example;
- reference `reference_doc.docx` containing the required Word styles and page setup;
- vendored Quarto extensions under `_extensions/`, including `authors-block`;
- figures or other local resources used by the example.

Copy the complete `assets/manuscript-template/` directory recursively before adapting it so relative resource links and vendored extensions remain available. Do not copy only `manuscript.qmd`.

The template vendors `kapsner/authors-block` v0.2.1 under `_extensions/authors-block/`. Use that pinned copy for reproducible rendering; do not download another version unless the user explicitly asks to update it. The extension requires Quarto 1.3.0 or newer. The vendored copy intentionally emits each affiliation as a separate paragraph so short affiliation lines are not stretched by a justified Word body-text style; preserve or reevaluate this documented local change during extension updates.

The starter QMD references `apa.csl`. When a target journal requires another style, find the journal style in the [Zotero Style Repository](https://www.zotero.org/styles), place the downloaded CSL inside the copied manuscript directory, and update the QMD `csl:` value to its relative filename. Preserve the CSL's attribution and license metadata.

The starter uses `knitr` as its single compute engine. It shows a static Markdown table followed by R- and Python-generated tables. Hidden cells prepare the data, and inline R expressions insert `knitr::kable()` output inside labeled table divs. The Python chunk uses only built-in Python containers, runs through `reticulate`, and exposes its object through `reticulate::py`. Rendering both examples requires the R packages `knitr` and `reticulate`; remove the executable examples when a dependency-light manuscript is preferred.

The Results section shows a static figure plus R- and Python-generated examples inside labeled figure divs. Their plotting chunks use `eval: false` and `echo: false`; pre-saved 300-dpi PNG files are bundled under `figure/` so routine manuscript rendering does not rerun plotting. Regenerating the Python example requires `matplotlib`.

The second Results subsection demonstrates inline R expressions for simple calculations, values prepared in hidden R chunks, Python results retrieved through `reticulate`, and reusable formatted scientific names. Keep `knitr` for this starter because its R and Python examples share one workflow through `reticulate`. Current Quarto also supports native Python inline expressions with the Jupyter engine; if a user chooses Jupyter, adapt the document's complete computation workflow instead of mixing engines.

The appendix uses custom `tbls-` and `figs-` cross-reference types so supplementary examples render as `Table A.` and `Figure A.` numbering rather than continuing the main-text `tbl-` and `fig-` sequences.

The bundled `table-style` filter assigns the reference DOCX table style `ThreeLine` to actual data tables. Keep the default `Table` style borderless because Quarto uses outer Word tables to contain cross-reference captions and their inner data tables.

## Validation Requirements

- Render from the manuscript project directory with a documented Quarto command.
- Treat missing files, unresolved citations, duplicate identifiers, unresolved cross-references, and required-extension failures as defects.
- Confirm that the generated DOCX uses the intended reference-document styles for headings, body text, captions, tables, bibliography, and page layout where applicable.
- Do not claim visual equivalence from a successful render alone; inspect the output when exact journal formatting matters.
