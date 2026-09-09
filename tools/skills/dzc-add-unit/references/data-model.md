# Data model, ids, and nr_eval pitfalls

## nr_eval pitfalls (read first — these cost real time)

1. **Editing a cost.** `set_field(cost, 'value', N)` on a cost taken from
   `node.costs` throws `e.getCatalogue is not a function` **and silently mutates
   the in-memory value untracked** (it won't save, and it corrupts the live view).
   Edit costs only with `edit({costs:[ ...full array... ]}, modelNode)` — it
   replaces the array and is tracked. `merge()` with `{key:'typeId'}` does **not**
   match costs either.

2. **Finding the game system.** `find('is:catalogue', 'Dropzone Commander 3rd
   Edition')` returns `[]` — `is:catalogue` only matches `.cat` files. Get the
   game system via `$catalogues.find(c => c.name === 'Dropzone Commander 3rd
   Edition')` (its `type` is `"gameSystem"`). Passing the resulting `undefined` to
   `add()` silently no-ops. `find('is:catalogue', '<FactionName>')` **does** work
   for `.cat` files.

3. **`add()` is async.** `await add(...)`. Read `.id` off the returned live node —
   ids you pass may be regenerated. If a following read shows nothing, you probably
   didn't await, or the parent was undefined.

4. **Verify with `nr_read raw:true`, not the eval return.** Eval return snapshots
   can lag a write in the same call. `nr_read` (the MCP tool) is authoritative.

5. **`nr_diagnosis` is a pair.** Count before, count after, compare. It can't tell
   you a value is wrong, only that the file stopped hanging together.

6. **Constraint types are `min` and `max` only.** No `exactly`. A forced selection
   is `min N` + `max N`.

7. **Scope `model` on a unit resolves to nothing.** Scopes walk *up*; a unit has no
   model ancestor, so the constraint is silently disabled. Count models with
   `scope:"self"` + `childId:"model"` from the `Models` group (not the unit — see
   pitfall #10).

8. **Custom profile types need explicit ids.** `add()` with `typeName:"Transport"`
   silently produces a blank `Vehicle` profile — the fix-profiles hook only knows
   the four built-in types. Pass `typeId` **and** a `typeId` on every
   characteristic (ids in the profile-types section below).

9. **`find('id=<x>', cat)` also matches the *link* whose target is `<x>`, and can
   return it first.** Adding to `hits[0]` then lands the child on the root
   `selectionEntryLink`, not the shared entry. To get the shared unit entry:
   `find('is:entry type:unit', cat, {path:'sharedSelectionEntries'}).find(u => u.name === '<Name>')`.
   Confirm `typeof node.getCatalogue === 'function'` before passing a node to a
   write — a row-shaped result silently no-ops `add()`/`set_field`.

10. **Never put a squad `min` constraint on the unit `selectionEntry`.** A unit
    entry is category-linked into a force, so a `min` on it reads as "this force
    must contain N of this unit" and the builder auto-adds N errored copies into
    every slot the moment a Group is added (they should stay empty with a `+`).
    Put both squad constraints on a nested `selectionEntryGroup` named "Models"
    that holds the model entries — it only fires once the user picks the unit.
    Applied to every Bioficer unit; the `dzc-add-unit` build does this by default.

11. **Slot categories are game-system ids — never make a faction-local `categoryEntry`
    for them.** Standard/Vanguard/Support/Heavy/Transport/Generated/Raw Materials all
    live in the `.gst` (ids in the table above). If a `.cat` has its own
    `categoryEntry name="Generated"` with a different id, a unit linked to *that*
    silently fails to surface in the builder — the `Group` force's categoryLink
    targets the `.gst` id, so there is no slot for the local one, and `nr_diagnosis`
    stays clean. Fix: repoint every `categoryLink` to the `.gst` id and delete the
    local `categoryEntry`. (This is why Drones didn't show under Generated but Hulks
    did — fixed 2026-09-08.) Bioficer now has zero local `categoryEntries`.

## Project ids (spot-check with the fetch helper below if the .gst was rebuilt)

Game system: **Dropzone Commander 3rd Edition**, `sys-1822-fb7b-9057-840f`

Category entries (in the `.gst`):

| slot | category id |
|---|---|
| Standard | `c926-5116-6500-dd46` |
| Vanguard | `74de-7c05-a61e-25e8` |
| Support | `d6a2-4ad7-4694-03ce` |
| Heavy | `9ed0-b443-0fe4-1eaa` |
| Transport | `0f65-b14b-ed9f-3e06` |
| Generated | `9ca1-02c4-a934-51fe` |
| Raw Materials | `2b55-17b3-4772-a8d4` |

**Cost types — two:**

| cost | typeId | on a unit/weapon | on RM tokens |
|---|---|---|---|
| `pts` | `cdb2-e720-ea26-2255` | the point value | 5 each |
| `category` | `e154-4f91-e9d9-012e` | **equal to `pts`** | 0 / absent |

`pts` drives the roster total and the per-Group 25% cap (both count `pts`, so RM
token points count there). `category` drives the Standard/Vanguard/Heavy/Support
allocation — RM tokens carry no `category` cost, so they stay out of the slot math.
Every model gets **both** costs, same value. (The old per-slot cost types are gone;
strip any zero-value leftovers.)

Profile types. `typeName` + characteristic names cover the built-in columns (the
fix-profiles hook fills the ids); pass an explicit `typeId` for `Transportation
Requirement`, `Transport Capacity`, and the `Transport` / `RM Storage` types.

| typeName / id | characteristics (`$text` char) |
|---|---|
| Vehicle `f612-c788-3c14-202c` | Type, Mv, A, DP, Special, `Transportation Requirement`=`5a4b-b964-4625-7008` |
| Infantry `60cc-a4a2-7032-d1fe` | Type, Mv, OF, DF, B, DP, Special, `Transportation Requirement`=`e5fc-7db6-74f7-3ed2` |
| Aircraft `5340-cfb3-0c68-faef` | Type, Mv, A, DP, Special (no transport-requirement char) |
| Weapons `7156-7401-8748-a010` | Arc, MA, R, Att, Ac, E, Special (no "Name" char — the column shows the profile's node name) |
| **Transport** `afcc-ee02-fc67-1b92` | Type `4ba5-be04-beb3-9ee6`, Mv `c9b2-760b-2af3-7b82`, A `6523-65cf-fa99-e8d7`, DP `75a7-af03-3e2a-7c0a`, Special `3aee-eccb-7244-e36a`, `Transportation Requirement` `49fb-2da3-876e-9ae0`, `Transport Capacity` `caae-4cd1-126f-bcf8` |
| **RM Storage** `ba7b-4507-b5b4-9ede` | RM `3626-8ef7-8d7e-22c5` |

Which profile a unit gets:
- **Normal unit** → one `Vehicle` / `Infantry` / `Aircraft` profile. Put the solid
  transport-symbol number in its `Transportation Requirement` char.
- **A transport unit** (hollow symbol — carries other units) → one **`Transport`**
  profile *instead of* the Vehicle/Aircraft one. Its `Type` char text says
  "Vehicle"/"Aircraft"; fill `Transport Capacity` (and `Transportation Requirement`
  if it can also be carried).
- **A Bioficer Genitor** (hollow-green RM square) → a **second** `RM Storage`
  profile alongside its main one (`RM` = the number), **and** a `{type:"rule"}`
  infoLink to `Genitor X` (`af76-0a2f-1a9f-23fc`) on the shared unit entry. Any
  Bioficer unit with the hollow-green square is a Genitor.
- **A Collector** (`Collector N` in the Special text, no green square) → a
  `{type:"rule"}` infoLink to `Collector X` (`b33f-5617-102a-1efd`); the value
  stays in the Special text.

(Grievance Genitor Ark: `Requirement 4` on its Vehicle profile's
`Transportation Requirement`; `RM 12` on its `RM Storage` profile; `Genitor X` rule linked.)

**Fetch helper** (run in `nr_eval` to get current ids):

```js
const gst = $catalogues.find(c => c.name === 'Dropzone Commander 3rd Edition');
return {
  categories: gst.categoryEntries.map(c => ({name:c.name, id:c.id})),
  costTypes: gst.costTypes.map(c => ({name:c.name, id:c.id})),
  profileTypes: gst.profileTypes.map(p => ({name:p.name, id:p.id})),
};
```

## The reference unit: Grievance Genitor Ark (`Bioficer.cat`)

Read these live with `nr_read <id> raw:true` and copy the shape. Ids will differ
for a new unit; the **structure** is what to match.

- Root entry link — `Bioficer` catalogue `entryLinks`:
  `{name:"Grievance Genitor Ark", type:"selectionEntry", targetId:<unit entry>, hidden:false}`
- Unit entry `02e6-3319-e3d7-68c4` — `sharedSelectionEntries`, `type:"unit"`:
  - `categoryLinks:[{name:"Standard", primary:true, targetId:"c926-5116-6500-dd46"}]`
  - **no `constraints`** on the unit entry (see pitfall #10)
  - `infoLinks`: `{type:"rule"}` → Skimmer, Surveyor, Puppeteer X" (game-system
    rules, generic names); then `{type:"profile"}` → the unit stat profile
  - `selectionEntryGroups`: one, `name:"Models" hidden:false`, with
    `constraints`: two, `field:"selections" scope:"self" childId:"model"
    includeChildSelections:true shared:false`, one `type:"min" value:1`, one
    `type:"max" value:2`; and `selectionEntries`: Grievance 1, Grievance 2
- Model `2112-eaef-cbae-96bd` — `type:"model"`:
  - `costs`: `[{name:"pts", typeId:"cdb2-e720-ea26-2255", value:35},
    {name:"category", typeId:"e154-4f91-e9d9-012e", value:35}]` — both, same value
  - `entryLinks`: `{name:"Decon Staff", type:"selectionEntry", targetId:<weapon entry>, hidden:false}`;
    plus, on an RM-capable Bioficer model, `{name:"Raw Material", type:"selectionEntry",
    targetId:<RM upgrade>, hidden:false, constraints:[{type:"max", value:<RM capacity>,
    field:"selections", scope:"parent", shared:false}]}` — the per-unit RM cap lives on the link
- Weapon entry `92b8-a404-d1ee-0573` — `sharedSelectionEntries`, `type:"upgrade"`:
  - `constraints`: `min 1` and `max 1`, `field:"selections" scope:"parent"
    automatic:true shared:false`
  - `infoLinks`: `{type:"profile"}` → weapon stat profile, then `{type:"rule"}`
    per special rule → generic game-system rule (`AA-S`, `Indirect`,
    `Ineffective: X`, `Suppress`)
- Unit stat profile `ca00-607f-b369-b766` — `sharedProfiles`, `typeName:"Vehicle"`,
  `Special` = `Puppeteer 6", Skimmer, Surveyor`
- Weapon stat profile `2dc0-2fb6-d28b-e412` — `sharedProfiles`, `typeName:"Weapons"`,
  chars `Arc/MA/R/Att/Ac/E/Special`, `Special` = `Decon`
- Transport profile `fea9-0b2a-00a7-5951` — `sharedProfiles`, `typeName:"Transport"`
  (explicit ids, see the table above), `Requirement`=`4`, `RM`=`12`; linked on the
  unit entry as a second `{type:"profile"}` infoLink
- Raw Material upgrade `e218-761a-0442-82d3` — `Bioficer` `sharedSelectionEntries`,
  `type:"upgrade"`, `costs:[{pts:5}]`, `categoryLinks:[{name:"Raw Materials",
  primary:true, targetId:"2b55-17b3-4772-a8d4"}]`, no constraint on the entry (the
  cap is on each model's link — see the model above)

## Add-order recipe (one nr_eval per group, or batch carefully)

```
1. unit stat profile   -> add(profileData, 'sharedProfiles', factionCat)
2. weapon stat profiles -> add([...], 'sharedProfiles', factionCat)
3. faction-only rules   -> add([...], 'sharedRules', factionCat)   (skip if none)
4. weapon entries       -> add([...], 'sharedSelectionEntries', factionCat)
                           (infoLinks target profile ids from 2, rule ids from
                            gst.sharedRules + step 3; read ids off returned nodes)
5. unit entry + models  -> add(unitData, 'sharedSelectionEntries', factionCat)
                           (unit has NO constraints; models sit in
                            selectionEntryGroups:[{name:"Models", constraints:[min,max],
                            selectionEntries:[...]}]; model entryLinks target weapon
                            entry ids from 4; unit infoLinks target rule ids + profile
                            id from 1)
6. root entry link      -> add(linkData, 'entryLinks', factionCat)
```

`factionCat = find('is:catalogue', '<FactionName>')[0]`.

## Why the structure is shaped this way

- **Shared entry + bare root link.** The link is a pointer that slots the unit into
  a category; everything else (stats, rules, models, constraints) lives on the
  shared entry so a second link elsewhere inherits it all.
- **Stats in `sharedProfiles`, linked everywhere.** One place to change a number in
  a balance pass.
- **Squad size on a nested `Models` group, never the unit entry.** A `min` on the
  category-linked unit entry makes the builder auto-fill every slot with errored
  copies when a Group is added; the group-level constraint only fires once the unit
  is actually picked, so slots stay empty with a `+` (pitfall #10).
- **Weapon = `upgrade` entry, not a bare profile.** A profile can't carry rule
  links; wrapping it in an entry lets stats + rules travel together, and gives a
  home for points/constraints if a weapon later becomes optional.
- **`pts` + `category` cost.** `pts` = real cost (roster total, per-Group 25% cap).
  `category` = same value, used only for the slot allocation, so RM tokens (no
  `category` cost) don't count against a slot. Slot itself = the unit's category.
- **List legality** (a build separate from this skill, on the game system's
  force entries): game sizes are **four sibling top-level `forceEntries`** —
  Skirmish / Clash / Battle / Reconquest — the player picks one. Each: `max 1`
  `field:forces scope:roster`; a `max N` `field:forces scope:self` Group cap; and
  `min`/`max` on `field:limit::pts scope:roster` for the points band. `Skirmish`
  (501–1000 pts, 9 Groups) is built and builder-verified; the other three are
  clones-to-come. The `Group` child force has `max 25% limit::pts` (**works**) and
  per-slot `max category` constraints raised +1 per point of Standard `category`
  (V/H/S ≤ Standard — in place, **not yet roster-tested**). The `Generated`
  categoryLink on the `Group` force is `hidden` (Drones/Hulks aren't list-buyable).
- **RM tokens (Bioficer).** A shared `Raw Material` upgrade (5 pts, category
  `Raw Materials`) linked onto each RM-capable model, with the per-unit cap
  (`max 12` for the Ark) on the link. `Raw Materials` is its own category so its
  points can be kept out of the slot allocation. The RM storage number also shows
  on the unit's `Transport` profile (`RM` characteristic) for reference.
- **Generic rule links + specific `Special` text.** `Puppeteer X"` / `Ineffective: X`
  stays generic so one rule covers every value; the resolved value
  (`Puppeteer 6"`, `Ineffective: Zones`) lives in the profile's `Special` string,
  which is also what shows in the stat table.
