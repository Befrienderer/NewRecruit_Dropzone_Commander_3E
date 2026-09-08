# tools

Tooling that supports maintaining this data set. Not read by NewRecruit or
BattleScribe — kept here so it is versioned alongside the data it operates on.

## skills/

Claude Code skills. Each is a directory with a `SKILL.md` plus optional
`references/` and `scripts/`.

To use one, copy (or symlink) the directory into your Claude skills folder:

```
# Windows
xcopy /E /I "tools\skills\dzc-add-unit" "%USERPROFILE%\.claude\skills\dzc-add-unit"
# or a link so edits stay in sync:
mklink /D "%USERPROFILE%\.claude\skills\dzc-add-unit" "<repo>\tools\skills\dzc-add-unit"
```

### dzc-add-unit

Adds a Dropzone Commander 3rd Edition unit (stat card, weapons, special rules)
to a faction catalogue by driving the live NewRecruit Editor through the
`webmcp-local-relay` MCP. Encodes the structural conventions used in this project
so every unit is built the same shape. `references/data-model.md` has the node
shapes, ids, and the `nr_eval` pitfalls; `scripts/extract_card.py` turns a
stat-card PDF page into coordinate-aligned text plus a rendered image.

Requires: NewRecruit Editor + `@mcp-b/webmcp-local-relay`; Python with
`pdfplumber` and `pymupdf` for the PDF step.
