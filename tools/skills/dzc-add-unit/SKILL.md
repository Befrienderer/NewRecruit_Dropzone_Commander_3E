---
name: dzc-add-unit
description: >-
  Add a Dropzone Commander 3rd Edition unit (its stat card, weapons, and special
  rules) to the NewRecruit / BattleScribe data in
  C:\Users\colga\BattleScribe\data\Dropzone Commander 3rd Edition, driving the
  live NewRecruit Editor through the webmcp-local-relay MCP (nr_* tools). Use this
  whenever the user wants to add, import, build, or transcribe a unit / model /
  weapon / stat block / squad into the Bioficer, PHR, UCM, Resistance, Scourge,
  Shaltari (or any faction) catalogue for this project — from one of the stat-card
  PDFs in C:\Game Rules\Dropzone Commander\, or from values they give directly.
  Also use when they ask to "add the next unit", "do the rest of the <faction>
  units", or continue an army import that follows the Grievance Genitor Ark
  pattern. Encodes the structural decisions agreed for this project so every unit
  is built the same way.
---

# Add a Dropzone Commander 3E unit

This project keeps its data in a git repo (`Befrienderer/NewRecruit_Dropzone_Commander_3E`)
at `C:\Users\colga\BattleScribe\data\Dropzone Commander 3rd Edition`. The NewRecruit
Editor reads that folder directly; you change the data by driving the editor through
the `nr_*` MCP tools, then the user saves and commits.

The goal of this skill is **low variance**: every unit built the same shape, so the
faction files stay consistent and the eventual list-legality logic has something
predictable to work against. The canonical worked example is **Grievance Genitor Ark**
in `Bioficer.cat` — when in doubt, read it and copy its shape.

## Before you start

1. **Editor connected?** `webmcp_list_sources` — expect one source ending in
   `NewRecruit Editor/...index.html`. If none, tell the user to open the editor.
2. **Right catalogue loaded?** `nr_catalogues` shows what is open. `nr_load_system
   "Dropzone Commander 3rd Edition"` if the faction file you need isn't listed.
   If two editor windows are connected and their `unsaved` flags differ, you have
   divergent copies — stop and ask the user which one to use.
3. **Read `references/data-model.md`** now. It has the exact node shapes, the
   project's category / cost-type / profile-type ids, and the `nr_eval` pitfalls
   that will bite you (editing costs, finding the game system, silent no-ops).
4. **Python** for the PDF step: `C:\Users\colga\AppData\Local\Programs\Python\Python312\python.exe`
   with `pdfplumber` + `pymupdf` installed. In the Bash/PowerShell tools prepend PATH:
   `$env:Path = [Environment]::GetEnvironmentVariable("Path","Machine")+";"+[Environment]::GetEnvironmentVariable("Path","User")`

## Step 1 — Get the card

**From a PDF** (`C:\Game Rules\Dropzone Commander\Army Stat Cards\DZC_<Faction>_Stat_Cards_*.pdf`):

```
<python> <skill>/scripts/extract_card.py "<pdf path>" <page> "<out dir>"
```

It writes `page<N>.png` (rendered at 220dpi) and prints the card text as
coordinate-clustered rows **plus** a raw `x0 / y / size / text` dump. Naive text
extraction scrambles the stat-card columns — the coordinates are what let you
rebuild the rows correctly. **Always also `Read` the PNG** and check every points
value and every statline number against it by eye; a `45` typed as `54` passes
every validation and only fails a player mid-game.

**From values the user gives directly**: skip to Step 2.

## Step 2 — Reconstruct and confirm

Assemble the card into this shape and show it to the user before touching the data:

- **Unit name** — use the spelling on the card (e.g. "Ark" not "Arc").
- **Slot / category** — Standard / Vanguard / Support / Heavy / Transport / Generated
  (the header word on the card).
- **Squad size** — e.g. `1-2`, `1`, `2-8`.
- **Points** — one value per loadout: `Grievance 1 = 35`, `Grievance 2 = 40`.
- **Unit statline** — profile type (Vehicle / Infantry / Aircraft) and its
  characteristics, including the free-text `Special` list.
- **Weapon rows** — for each: name (drop any `(Grievance 1)` parenthetical — those
  are model-loadout tags, see below), Arc / MA / R / Att / Ac / E, and the `Special` list.

Flag anything you're unsure of or any apparent typo in the source. Wait for a yes.

## Step 3 — Build

`nr_diagnosis "<faction>"` first and note the finding count — you'll compare after.

Build bottom-up. Keep each logical piece to **one `nr_eval` call** (one call = one
undo entry). `references/data-model.md` has the literal shapes; the essentials:

### 3a. Stat profiles → `sharedProfiles` (the single source of truth for numbers)

- **Unit profile**: `typeName` Vehicle / Infantry / Aircraft. Give `typeName` +
  characteristic names + `$text`; the editor fills in the typeIds. The `Special`
  characteristic holds the **at-a-glance list with X values filled in**
  (`Puppeteer 6", Skimmer, Surveyor`).
- **Weapon profiles**: one per distinct weapon, `typeName` "Weapons",
  characteristics `Arc, MA, R, Att, Ac, E, Special` (no "Name" — the column shows
  the profile's node name). `Special` = the at-a-glance rule list with X filled in
  (`Ineffective: Zones`, `Decon`).
- **Transport symbols** (see `data-model.md` for the profile-type layout):
  - **solid** symbol number → `Transportation Requirement` char on the unit's
    Vehicle/Infantry profile (explicit typeId).
  - **hollow red** symbol (a transport that *carries* units) → give the unit a
    **`Transport`**-type profile instead of Vehicle/Aircraft, `Transport Capacity`
    filled. (True even if the unit's category isn't Transport — e.g. an Auxiliary
    Transport in the Heavy slot.)
  - **hollow green** square (Bioficer Genitor) → a **second** `RM Storage` profile
    (`RM` = the number) **and** a `Genitor X` rule infoLink on the shared unit entry.
  - `Collector N` in the Special text → a `Collector X` rule infoLink.

### 3b. Faction-specific special rules → the faction catalogue's `sharedRules`

General DzC rules (unit rules from rulebook §10, weapon rules from §11) already
live in the **game system** `sharedRules`. Only add a rule to the faction file if
it's unique to that faction (e.g. Bioficer "Decon", "Genitor X"). Shape:
`{name, description, hidden:false}` — `description` a single run-on string,
`--` → `—`, curly quotes → straight. Transcribe source typos as-is and flag them.

Rule **names** keep their `X` / `X+` / `:` parameters and drop the number prefix.
For weapon rules also drop the trailing `(expansion)` — `AA(Anti-Aircraft)` → `AA`.

### 3c. Weapon entries → `sharedSelectionEntries`, `type: "upgrade"`

One per distinct weapon. Carries:
- `constraints`: `min 1` **and** `max 1`, `field:"selections"`, `scope:"parent"`,
  `automatic:true`. (There is no "exactly" constraint type — min+max is the idiom.
  `automatic` lets the builder auto-include it when the model is taken.)
- `infoLinks`: **one** `type:"profile"` link → the weapon stat profile, then one
  `type:"rule"` link per special rule → the **generic** shared rule
  (`Ineffective: X`, not `Ineffective: Zones`). The specific value stays only in
  the profile's `Special` text.

The weapon is a shared entry because stats + rules must be identical wherever the
weapon appears. A bare `profile` node cannot hold rule links — that's why the wrapper.

### 3d. Unit entry → `sharedSelectionEntries`, `type: "unit"`

- `categoryLinks`: `[{name:<slot>, primary:true, targetId:<slot category id>}]` — the
  slot lives here, on the shared entry, **not** on the root link.
- **No `constraints` on the unit entry itself.** A `min` constraint on a
  category-linked unit entry reads as "this force must contain N of this unit" and
  makes the builder auto-populate every slot with errored entries the moment a
  Group is added. Squad size goes on a nested group instead (see below).
- `infoLinks`: one `type:"rule"` link per unit special rule (generic names,
  targeting the game-system shared rules) + **one** `type:"profile"` link → the
  unit stat profile.
- `selectionEntryGroups`: exactly one, `name:"Models"`, `hidden:false`, holding
  **all** the model entries (3e) and carrying the squad-size constraints:
  `field:"selections"`, `scope:"self"`, `childId:"model"`,
  `includeChildSelections:true`, `shared:false` — one `type:"min"`, one `type:"max"`
  (equal if the squad is a fixed size). **Not** `scope:"model"` (walks up to no
  model, silently does nothing). This keeps the unit empty with a `+` until the
  user adds it, then enforces the range once models go in.
  - A **Transport-category** unit (Squad Size "N/A") still gets the `Models` group,
    with `min 1 / max 1`.
  - A **Generated** unit (Drones, Hulks) can't be bought in a list — it exists only
    for in-game spawning; its `Models` group still gets the card's squad range, but
    the real build-time block belongs to the list-rules layer, not here.

### 3e. Models — one `type: "model"` entry per loadout, inside the `Models` group

- The model entries live in the unit's `selectionEntryGroups[0]` ("Models"), not
  directly on the unit entry.
- `name` = the loadout tag from the weapon rows (`Grievance 1`, `Thorn 3`). A
  unit with a single fixed loadout still gets one model entry, named after the unit.
- A weapon row with **no** `(tag)` = every variant carries it → link it on every model.
  Two weapon rows with the **same** tag (`(Thorn 3)` twice) = that one model links
  both. A comma-list tag (`(Grievance 1, Grievance 2)`) = link that weapon on each
  listed model.
- `costs`: one entry — `[{name:"pts", typeId:"cdb2-e720-ea26-2255", value:<points>}]`.
  `pts` is the only cost type; the slot is tracked by the unit's category.
- `entryLinks`: one `type:"selectionEntry"` link per weapon this loadout carries,
  `targetId` = the weapon entry id. If a weapon row is tagged `(Grievance 1, Grievance 2)`
  (comma-separated), that one weapon entry is linked from **both** models.

### 3f. Root entry link → the faction catalogue's `entryLinks`

A bare pointer: `{name:<unit name>, type:"selectionEntry", targetId:<unit entry id>,
hidden:false}`. No category, no profile — those are on the shared entry so they
survive if the unit is ever linked from a second place.

## Step 4 — Verify

- `nr_diagnosis "<faction>"` again. The count **must not have gone up**. If it did,
  `undo()` and rethink — a new finding means the structure doesn't hang together.
- `nr_read <unit entry id> tree:true` — eyeball it against the card: slot, squad
  size, models with the right points, each model's weapon, rules on unit and weapons.
- Read back one weapon entry and the stat profiles with `nr_read raw:true` and
  check the characteristic values by eye one more time.

## Step 5 — Hand off

Report the tree, the diagnosis delta, and what was created. **Do not save unless
asked** — it's the user's window and they may want to review first. When they ask:
`nr_save "<faction>"`, then offer to `git add` / `commit` / `push` to the repo.

## Reference

- `references/data-model.md` — exact node shapes, project ids, `nr_eval` pitfalls,
  and the Grievance Genitor Ark structure to copy.
- `scripts/extract_card.py` — PDF page → rendered image + coordinate text.
