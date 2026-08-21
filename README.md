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

This skill focuses on Quarto structure and rendering rather than the quality of the scientific argument or prose. For scientific writing support, use it alongside a writing skill such as [Reader-Aware-Writing](https://github.com/xchuam/Reader-Aware-Writing).

### Install for Codex and Claude Code

Install both `paper-writing-with-quarto` and its required companion skill, `quarto-authoring`.

#### Codex

Run each line as a separate message in Codex:

```text
$skill-installer install https://github.com/posit-dev/skills/tree/main/quarto/quarto-authoring
$skill-installer install the root skill from https://github.com/xchuam/paper-writing-with-quarto
```

Restart Codex if the skills do not appear immediately. Invoke the manuscript skill as `$paper-writing-with-quarto`.

#### Claude Code

Install [Node.js](https://nodejs.org/en/download), open a terminal in your manuscript project, and run:

```bash
npx skills add xchuam/paper-writing-with-quarto --skill paper-writing-with-quarto --agent claude-code
npx skills add posit-dev/skills --skill quarto-authoring --agent claude-code
```

These commands use [skills.sh](https://www.skills.sh/docs/cli). Invoke the manuscript skill as `/paper-writing-with-quarto`. For another skills.sh-compatible agent, replace `claude-code` with that agent's name.

### Use the Skill

Tell the agent what you want to write and provide the available manuscript information, such as the title, authors, affiliations, target journal, outline, references, tables, and figures. The agent should ask for important missing information rather than inventing scientific content.

For example, in Codex:

```text
Use $paper-writing-with-quarto to create a manuscript from the bundled template. Use the title, authors, affiliations, outline, references, tables, and figures I provide. Keep all resources together, report missing information or unresolved citations, and render the manuscript to DOCX when it is ready.
```

You can also use the skill to revise an existing `manuscript.qmd`, diagnose a rendering error, or adapt the CSL and reference DOCX for a target journal.
