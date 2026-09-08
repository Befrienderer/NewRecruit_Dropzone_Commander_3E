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
   model ancestor, so the constraint is silently disabled. Count models inside a
   unit with `scope:"self"` + `childId:"model"`.

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

Cost types (in the `.gst`):

| cost | typeId | use |
|---|---|---|
| pts | `cdb2-e720-ea26-2255` | **the points value goes here** |
| Vanguard | `ab87-75c9-cd43-9593` | always 0 |
| Standard | `6086-6c29-a320-0fcc` | always 0 |
| Support | `df03-77d8-4c11-2243` | always 0 |
| Heavy | `72f6-b4d6-1f34-219e` | always 0 |
| Transport | `4306-5775-b4a6-007d` | always 0 |

Profile type names (pass the **name**, not the id, when adding a profile — the
editor's fix-profiles hook fills in every characteristic typeId):

| typeName | characteristics |
|---|---|
| Vehicle | Type, Mv, A, DP, Special |
| Infantry | Type, Mv, OF, DF, B, DP, Special |
| Aircraft | Type, Mv, A, DP, Special |
| Weapons | Name, Arc, MA, R, Att, Ac, E, Special |

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
  - `constraints`: two, `field:"selections" scope:"self" childId:"model"
    includeChildSelections:true includeChildForces:true shared:false`, one
    `type:"min" value:1`, one `type:"max" value:2`
  - `infoLinks`: `{type:"rule"}` → Skimmer, Surveyor, Puppeteer X" (game-system
    rules, generic names); then `{type:"profile"}` → the unit stat profile
  - `selectionEntries`: Grievance 1, Grievance 2
- Model `2112-eaef-cbae-96bd` — `type:"model"`:
  - `costs`: `[{name:"Vanguard",typeId:"ab87-75c9-cd43-9593",value:0},
    {name:"Standard",typeId:"6086-6c29-a320-0fcc",value:0},
    {name:"Support",typeId:"df03-77d8-4c11-2243",value:0},
    {name:"Heavy",typeId:"72f6-b4d6-1f34-219e",value:0},
    {name:"Transport",typeId:"4306-5775-b4a6-007d",value:0},
    {name:"pts",typeId:"cdb2-e720-ea26-2255",value:35}]`
  - `entryLinks:[{name:"Decon Staff", type:"selectionEntry", targetId:<weapon entry>, hidden:false}]`
- Weapon entry `92b8-a404-d1ee-0573` — `sharedSelectionEntries`, `type:"upgrade"`:
  - `constraints`: `min 1` and `max 1`, `field:"selections" scope:"parent"
    automatic:true shared:false`
  - `infoLinks`: `{type:"profile"}` → weapon stat profile, then `{type:"rule"}`
    per special rule → generic game-system rule (`AA-S`, `Indirect`,
    `Ineffective: X`, `Suppress`)
- Unit stat profile `ca00-607f-b369-b766` — `sharedProfiles`, `typeName:"Vehicle"`,
  `Special` = `Puppeteer 6", Skimmer, Surveyor`
- Weapon stat profile `2dc0-2fb6-d28b-e412` — `sharedProfiles`, `typeName:"Weapons"`,
  chars `Name/Arc/MA/R/Att/Ac/E/Special`, `Special` = `Decon`

## Add-order recipe (one nr_eval per group, or batch carefully)

```
1. unit stat profile   -> add(profileData, 'sharedProfiles', factionCat)
2. weapon stat profiles -> add([...], 'sharedProfiles', factionCat)
3. faction-only rules   -> add([...], 'sharedRules', factionCat)   (skip if none)
4. weapon entries       -> add([...], 'sharedSelectionEntries', factionCat)
                           (infoLinks target profile ids from 2, rule ids from
                            gst.sharedRules + step 3; read ids off returned nodes)
5. unit entry + models  -> add(unitData, 'sharedSelectionEntries', factionCat)
                           (model entryLinks target weapon entry ids from 4;
                            unit infoLinks target rule ids + profile id from 1)
6. root entry link      -> add(linkData, 'entryLinks', factionCat)
```

`factionCat = find('is:catalogue', '<FactionName>')[0]`.

## Why the structure is shaped this way

- **Shared entry + bare root link.** The link is a pointer that slots the unit into
  a category; everything else (stats, rules, models, constraints) lives on the
  shared entry so a second link elsewhere inherits it all.
- **Stats in `sharedProfiles`, linked everywhere.** One place to change a number in
  a balance pass.
- **Weapon = `upgrade` entry, not a bare profile.** A profile can't carry rule
  links; wrapping it in an entry lets stats + rules travel together, and gives a
  home for points/constraints if a weapon later becomes optional.
- **One `pts` cost + a category for the slot.** Single source of truth for cost.
  The list-legality logic (total ≤ game size; Vanguard/Heavy/Support points ≤
  Standard points) reads `pts` filtered by category on the game system's
  "Configuration" force entry — that's a separate build, not part of this skill.
- **Generic rule links + specific `Special` text.** `Puppeteer X"` / `Ineffective: X`
  stays generic so one rule covers every value; the resolved value
  (`Puppeteer 6"`, `Ineffective: Zones`) lives in the profile's `Special` string,
  which is also what shows in the stat table.
