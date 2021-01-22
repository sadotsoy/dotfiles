" FUNCTIONS FILE @sadotsoy
"
" == { FUNCTIONS } ====
"
" Linter status line
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

" == STATUSLINE
function! s:statusline_generator()
  " modes
  let normal= "%#MoreMsg#%{(mode()=='n')?'\ \ N\ ':''}"
  let insert= "%#Underlined#%{(mode()=='i')?'\ \ I\ ':''}"
  let replace = "%{(mode()=='r')?'\ \ R\ ':''}"
  let visual = "%#Folded#%{(mode()=='v')?'\ \ V\ ':''}"
  " let vline = "%#Folded#%{(mode()=='V')?'\ \ V-L\ ':''}"
  let vblock = "%#Search#%{(mode()=='\<C-V>')?'\ \ V-B\ ':''}"
  " utils
  let sep = '  '
  let sepRight= ' %= '
  let pipe='|'
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
  return mode.gray.filePath.sepRight.yellow.sep.pipe.LinterStatus().pipe.yellow.bufferNumber.sep.orange.columnLines.sep.pink2.percent
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
