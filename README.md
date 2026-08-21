# Paper Writing with Quarto

This repository provides:

- a complete Quarto template for writing a scientific manuscript and rendering it to Microsoft Word; and
- an Agent Skill that helps Codex, Claude Code, and other compatible agents create, edit, render, and check the manuscript.

You can [work directly from the template](#start-a-manuscript-from-the-template) or [use the Agent Skill for assistance](#start-a-manuscript-with-an-agent).

## Start a Manuscript from the Template

### 1. Prepare the required software

For the complete example, install:

- [Quarto](https://quarto.org/docs/get-started/);
- [R](https://cran.r-project.org/) with [`knitr`](https://cran.r-project.org/package=knitr) and [`reticulate`](https://rstudio.github.io/reticulate/);
- [Python](https://www.python.org/downloads/), which the Python examples run through `reticulate`; and
- [Microsoft Word](https://www.microsoft.com/microsoft-365/word) or another DOCX editor for reviewing the output.

The template has been tested with Quarto 1.9.38. Its bundled `authors-block` extension requires Quarto 1.3.0 or newer.

### 2. Copy the complete template folder

Download or clone this repository, then copy the entire `assets/manuscript-template/` folder to the location where you want to write your paper. Rename the copied folder for your project.

Do not copy only `manuscript.qmd`. The complete folder keeps the bibliography, citation style, reference DOCX, figures, and Quarto extensions together, so all relative paths continue to work.

| File or folder | Purpose |
| --- | --- |
| `manuscript.qmd` | Editable manuscript source, configuration, and worked examples. |
| `example_bibliography.bib` | Example BibTeX bibliography. |
| `apa.csl` | Example APA citation style. |
| `reference_doc.docx` | Word styles and page layout used during rendering. |
| `figure/` | Static and pre-generated example figures. |
| `_extensions/authors-block/` | [Extension for author and affiliation formatting](https://github.com/kapsner/authors-block). |
| `_extensions/table-style/` | Extension that applies three-line formatting to data tables. |
| `manuscript.docx` | Example rendered output; this is not the editable source. |

### 3. Draft the paper

Open `manuscript.qmd` in [VS Code](https://quarto.org/docs/get-started/hello/vscode.html), [RStudio](https://quarto.org/docs/get-started/hello/rstudio.html), or another IDE of your choice.
Replace the placeholder content, including the title, authors, affiliations, abstract, keywords, manuscript text, declarations, references, tables, and figures.
The file itself is a concise **walkthrough** showing:

- reusable affiliations, equal contribution, correspondence, and a current address;
- single and multiple citations;
- static, R-generated, and Python-generated tables;
- static and pre-generated R and Python figures;
- inline calculated values and reusable formatted scientific names; and
- main-text and appendix cross-references.

Keep `manuscript.qmd` as the source of the paper.
Make reusable formatting changes in `reference_doc.docx`, not in a rendered `manuscript.docx`.
You may rename the QMD file; Quarto gives the rendered DOCX the same base name. For example, `paper.qmd` renders to `paper.docx`.

### 4. Render the Word document

Run this command inside the copied manuscript folder:

```bash
quarto render manuscript.qmd --to docx
```

Quarto writes `manuscript.docx`.

In supported IDEs, you can alternatively select the **Render** or **Preview** button.

### Adapt the Template to a Journal

Use the examples already present in `manuscript.qmd` and the [official Quarto guide](https://quarto.org/docs/guide/) as the main guides. In particular:

- For citations and bibliographies, see [Quarto Citations](https://quarto.org/docs/authoring/citations.html). Here we use `example_bibliography.bib` and `apa.csl` as examples; journal-specific CSL files are available from the [Zotero Style Repository](https://www.zotero.org/styles).
- For fonts, headings, captions, margins, bibliography formatting, and other Word styles, edit `reference_doc.docx` by following Quarto's [Word Templates guide](https://quarto.org/docs/output-formats/ms-word-templates.html).
- For manuscript elements, consult Quarto's guides to [tables](https://quarto.org/docs/authoring/tables.html), [figures](https://quarto.org/docs/authoring/figures.html), [cross-references](https://quarto.org/docs/authoring/cross-references.html), and [appendices](https://quarto.org/docs/authoring/appendices.html).
- For executable R and Python content, see [Using R in Quarto](https://quarto.org/docs/computations/r.html) and [Using Python in Quarto](https://quarto.org/docs/computations/python.html).

The template uses Knitr for inline expressions with R. If you prefer the Jupyter engine, Quarto also supports native Python inline expressions. See Quarto's [Inline Code guide](https://quarto.org/docs/computations/inline-code.html).

For Word tables, keep the reference-DOCX `Table` style borderless. Quarto also uses that style for table and figure caption containers. The bundled `table-style` filter applies the `ThreeLine` style only to the actual data tables.

## Start a Manuscript with an Agent

This repository also provides an Agent Skill that helps an agent write a manuscript with Quarto and render it to Word.

It depends on Posit's [`quarto-authoring`](https://github.com/posit-dev/skills/tree/main/quarto/quarto-authoring) skill for general Quarto syntax and features, so install both skills.

This skill focuses on Quarto structure and rendering rather than the quality of the scientific argument or prose. For reader-focused writing support, use it alongside a writing skill such as [Reader-Aware-Writing](https://github.com/xchuam/Reader-Aware-Writing).

### Install for Codex and Claude Code

{this section is too complex!}

Install [Node.js](https://nodejs.org/en/download) first. Then open a terminal in the downloaded `paper-writing-with-quarto` repository root and run:

```bash
npx --yes skills add . --skill paper-writing-with-quarto --agent codex --agent claude-code --yes --copy
npx --yes skills add posit-dev/skills --skill quarto-authoring --agent codex --agent claude-code --yes --copy
```

These commands use the [skills.sh CLI](https://www.skills.sh/docs/cli) to install both skills for this project. Run Codex or Claude Code from the repository root. Consult the skills.sh documentation if you prefer a user-wide installation.

In Codex, check `/skills` and invoke the skill as `$paper-writing-with-quarto`. For example:

> Use $paper-writing-with-quarto to copy the manuscript template into a folder named my-paper, replace the author placeholders with the information I provide, and render the DOCX.

See OpenAI's [skill documentation](https://learn.chatgpt.com/docs/build-skills) for Codex skill discovery and use.

In Claude Code, invoke the skill as `/paper-writing-with-quarto`. For example:

> /paper-writing-with-quarto Add the supplied bibliography entries, table, and figure to my manuscript. Check citations and cross-references before rendering the DOCX.

See Anthropic's [Claude Code skills documentation](https://code.claude.com/docs/en/skills) for skill discovery and use.
