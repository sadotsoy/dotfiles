In this file I'm going to store, tricks, cheats, and funny stuff for vim.
@sadotsoy

# NOTES

## CHANGES

- Jump back to your last change --> `g;` move to (previous) `g;`, to(next) `g,`.

- To view the undolist --> `:undolist`.
  - to navigate the undo branches `g-`, `g+`.

## DELETE

- Delete without overwriting the register --> `"_d{motion}`.


## EDIT

- To revert all changes to the current buffer --> `:edit!`


## INDENT

- Indent current line and next 3 --> `4==`

- Indent around paragraph --> `=ap`

- Indent to the end of method --> `=%`


## NORMAL

- Append to the end of the current word --> `ea`

- Perform a normal mode command on every line of the file --> `:%norm [command]`.


## SORT

- Sort all lines --> `:sort`.

- Sort in reverse --> `:sort!`.

- Remove dupes and sort --> `:sort u`.

- Ignore case --> `:sort i`.

- Sort numerically --> `:sort n`.


## SUBSTITUTION

- Quick review of substitution --> `:g/MATCH/#|s/MATCH/REPLACE/g|#`


## PASTE

- pute before `gP` or after `gp` and place the cursor below the pasted line.


## VISUAL

- Reselect the last visual selection --> `gv`.

- Navigate to the begining or end of visual selection text --> ``` `< ``` or ``` `> ```

