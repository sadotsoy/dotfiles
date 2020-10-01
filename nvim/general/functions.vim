" FUNCTIONS FILE @sadotsoy
"
" == { FUNCTIONS } ====

" == STATUSLINE
function! s:statusline_generator()
  " modes
  let normal= "%#MoreMsg#%{(mode()=='n')?'\ \ NORMAL\ ':''}"
  let insert= "%#Underlined#%{(mode()=='i')?'\ \ INSERT\ ':''}"
  let replace = "%{(mode()=='r')?'\ \ REPLACE\ ':''}"
  let visual = "%#Folded#%{(mode()=='v')?'\ \ VISUAL\ ':''}"
  " let vline = "%#Folded#%{(mode()=='V')?'\ \ V-LINE\ ':''}"
  let vblock = "%#Search#%{(mode()=='\<C-V>')?'\ \ V-BLOCK\ ':''}"
  " utils
  let sep = '  '
  let sepRight= ' %= '
  " colors
  let gray = '%#CursorLineNr#'
  let yellow = '%#String#'
  let pink = '%#DfPopup#'
  let pink2 = '%#SpecialComment#'
  let orange = '%#Function#'
  " data
  let columnLines = " [%c:%l/%L]" "column:line/TOTALLINES
  let bufferNumber = "  [%n]"
  let filePath = " %f "
  let percent = " [%%%p] " " percent of the cursor position respect the file
  " modes wrapper
  let mode = normal.insert.replace.visual.vblock
  " final result
  return mode.gray.filePath.sepRight.yellow.bufferNumber.sep.orange.columnLines.sep.pink2.percent
endfunction
let &statusline = s:statusline_generator() " set the status line

" COC TAB FUNCTIONS
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" +=== Fuzzy Search
let g:fzf_layout = { 'window':{ 'width': 0.9, 'height': 0.9 }}
let $FZF_DEFAULT_OPTS='--reverse'

" +=== GOYO FUNCTIONS
function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set nocursorline
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set scrolloff=5
  set cursorline
  Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
