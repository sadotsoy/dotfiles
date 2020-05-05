" NeoVIM config file by @SadotCorts MAY 5 2020
"

" =================
" == GENERAL ======
"
let mapleader = ','							" set the <leader>,
set autoread					  				" detech when a file is changed
set clipboard=unnamed						" Yank and Paste with the system clipboard
set laststatus=2								" show the status line all the time
set shell=/bin/bash							" set bash for vim command
setlocal textwidth=280				  " have long lines wrap inside comments

" == NUMBER LINES               " set relative number
set number relativenumber
set nu rnu

" == INDENT/TABS
set autoindent									" automatically set indent of new line
set backspace=indent,eol,start	" make backspace behave in a same manner
set shiftround									" round indenty to a multiple of 'shiftwidth'
set shiftwidth=2								" number of spaces to use for indent or unidendt
set smartindent									" tab respects 'tabsot', 'shifwidth'. and 'softtabstop'
set softtabstop=2								" edit as if the tabs are 4 characters wide
set tabstop=2										" the visible width of the tabs

" == SPELLING
set spelllang=en_us,es_mx
" set spell

" == EMMET
let g:user_emmet_mode='a'       "enable all function in all mode.

" == SEARCH
set ignorecase                  " Sensitive case for local search
set smartcase

" == COC SETTINGS
" coc.nvim color changes
hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
set hidden                      " TextEdit might fail if hidden is not set.
set nobackup                    " Some servers have issues with backup files
set nowritebackup
set cmdheight=2                 " Give more space for displaying messages.
set updatetime=300              " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
                                "+= delays and poor user experience.
set shortmess+=c                " Don't pass messages to ins-completion-menu.
set signcolumn=yes              " Always show the signcolumn, otherwise it would shift the text each time
                                "+= diagnostics appear/become resolved.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" == OTHERS
filetype plugin indent on				" detecth the filetype
set encoding=utf-8
set magic												" set magic on, for regex
set mat=2												" how many tenths of a second to blink
set showmatch										" show matching braces

" =================
" == PLUGINS ======
" == INITIALIZE PLUG
call plug#begin()

" == UTILITIES
Plug 'airblade/vim-gitgutter'           " shows a git diff
Plug 'bling/vim-bufferline'             " show the buffers
Plug 'bronson/vim-trailing-whitespace'  " just call :FixWhitespace
Plug 'chrisbra/NrrwRgn'                 " :NR, NW, NRP, NRM
Plug 'luochen1990/rainbow'              " rainbow_parentheses
Plug 'mbbill/undotree'                  " undo history visualizer
Plug 'raimondi/delimitmate'             " auto-completion for quotes, etc.
Plug 'terryma/vim-multiple-cursors'     " multiple cursors with <C-n>
Plug 'tpope/vim-commentary'             " comment with powers
Plug 'tpope/vim-fugitive'               " the ultimate git helper
Plug 'tpope/vim-surround'               " surround
Plug 'junegunn/goyo.vim'                " Distraction-free writing in Vim.
Plug 'junegunn/limelight.vim'           " Higlight the cursor position with goyo looks awesome

" === FILE MANAGER
Plug 'vim-scripts/fountain.vim'

" == SYNTAX
" +== GENERAL
Plug 'wellle/targets.vim'               " text obejects with operators ci(operator) ex: ci,
Plug 'mattn/emmet-vim'                  " the good plugin
" :CocInstall coc-tsserver coc-eslint coc-json coc-prettier coc-css
Plug 'neoclide/coc.nvim', {'branch': 'release'} " intelli sense vscode

" +== JAVASCRIPT
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
Plug 'othree/yajs.vim'
" 2
" Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" +== CSS/STYLES
Plug 'ap/vim-css-color' "Displays a preview of colors with CSS

" +== CSS/STYLES
Plug 'tpope/vim-markdown'

" === COLORSCHEME
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox' "My favorite theme

" === SEARCHING
Plug '/usr/local/opt/fzf'
Plug 'Shougo/denite.nvim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf.vim'

" == END Plug
call plug#end()

" =================
" == COLORSCHEMES =
" colorschemes, dracula, gruvbox
colorscheme gruvbox
set background=dark termguicolors cursorline
set t_Co=256
set ts=2 sw=2 et
syntax enable

" +=== STATUSLINE
set noshowmode
set statusline=2
set statusline=
set statusline+=%#IncSearch#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#Search#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%{(mode()=='r')?'\ \ REPLACE\ ':''}
set statusline+=%#Visual#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#StatusLine#%{(mode()=='V')?'\ \ V-LINE\ ':''}
set statusline+=%#CursorLineNr#
set statusline+=\ %F
set statusline+=%= "Right side settings
set statusline+=%#Search#
set statusline+=\ %c:%l/%L
set statusline+=\ [%%%p]

" +=== LIMELIGHT
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" =================
" == MAPPING ======
"
" == EDIT CONFIG FILE
map <leader>, :vsplit ~/.config/nvim/init.vim<CR>

" == See the hi test
map <leader>hi :so $VIMRUNTIME/syntax/hitest.vim<CR>

" == FILEMANAGER
" LEXPLORE, left and right
map <leader>e :Lex<cr>
map <leader>er :Lex!<cr>

" == SEARCHING
map <leader>fa :Ag<cr>
map <leader>ff :Files<cr>

" == RELOAD SOURCE
map <C-s> :source ~/.config/nvim/init.vim<CR>

" == BUFFERS
map <leader>bf :Buffers<cr>

" == TAB MAPPING
map <leader>tc :tabnew<cr>
map <leader>te :tabedit
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove<cr>
map <leader>tn :tabnext<cr>
map <leader>to :tabonly<cr>
map <leader>tp :tabprevious<cr>
map <leader>tq :tabclose<cr>

" == VERTICAL SPLIT
nnoremap <silent> vv <C-w>v

" == RESIZE WINDOW
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" == FUGITIVE TPOPE
" CHECK :HELP GSTATUS FOR MORE KEYS
map <leader>ga :!git add %<cr>:Gcommit<cr>
map <leader>gb :Gblame<cr>
map <leader>gc :Gcommit<cr>
map <leader>gd :Gdiffsplit<cr>
map <leader>gs :Gstatus<cr>

" == GOYO
map <leader><ENTER> :Goyo<cr>

" == SPELLING
" +=== SPANISH
map <C-g>s :set spelllang=es_mx<CR>
" +=== ENGLISH
map <C-g>e :set spelllang=en_us<CR>

" == LIGHT/DARK
"""" DEPENDS OF THE COLORSCHEME
map <C-l>l :set background=light<CR>
map <C-d>d :set background=dark<CR>

" == COC mapping"
" +== Using CocList"
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" =================
" == FUNCTIONS ====
"
" +==CREATE WINDOWS DEPENDS H,J,K,L
map <leader>wl :Windows<cr>
map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>
" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
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

" +=== COC FUNCTIONS
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" ++++ END
