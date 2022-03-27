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

" Fold
function! MinimalFold()
  return printf('%s [%d] %s', v:folddashes, v:foldend - v:foldstart + 1, getline(v:foldstart))
endfunction

" return if exist git branch
function! StatuslineGit() abort
  if exists("g:git_branch")
    return g:git_branch
  endif
  return ''
endfunction

" get git branch
function! GetGitBranch() abort
  let l:is_git_dir = system('echo -n $(git rev-parse --is-inside-work-tree)')
  let g:git_branch = l:is_git_dir == 'true' ?
        \ system('bash -c "echo -n $(git rev-parse --abbrev-ref HEAD)"') : ''
endfunction

function! BufferActive() abort
  return g:status_line_active
endfunction

" == STATUSLINE
function! s:statusline_generator()
  " modes
  " let active = (a:".startup_win_id." == win_getid()) ? "Active" : "None"
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
  let tild='~'
  " colors
  let gray = '%#CursorLineNr#'
  let yellow = '%#String#'
  let pink = '%#DfPopup#'
  let pink2 = '%#SpecialComment#'
  let orange = '%#Function#'
  " data
  let columnLines = " [%c:%l/%L]" "column:line/TOTALLINES
  let bufferNumber = " [%n]"
  let filePath = " %f "
  let fileType = " %y"
  let percent = "[%%%p] " " percent of the cursor position respect the file
  let gitBranch= "%{StatuslineGit()}"
  let bufferActive = "%{BufferActive()}"
  " modes wrapper
  let mode = normal.insert.replace.visual.vblock
  " final result
  return mode.gray.filePath.sepRight.pink.sep.tild.LinterStatus().tild.sep.yellow.yellow.bufferNumber.orange.columnLines.sep.pink2.percent
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

" Check group under the cursor
function! CheckSynstack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

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
