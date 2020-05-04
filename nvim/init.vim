" NeoVIM config file by @SadotCorts MAY 4 2020
"

" =================
" == GENERAL ======
"
let mapleader = ','							" set the <leader>,
set autoread										" detech when a file is changed
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

" === FILE MANAGER
Plug 'vim-scripts/fountain.vim'

" == SYNTAX
" +== GENERAL
Plug 'wellle/targets.vim'               " text obejects with operators ci(operator) ex: ci,
Plug 'mattn/emmet-vim'

" +== JAVASCRIPT
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
Plug 'othree/yajs.vim'
" 2
" Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" +== CSS/STYLES
Plug 'ap/vim-css-color' "Displays a preview of colors with CSS

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

" =================
" == MAPPING ======
"

" == FILEMANAGER
map <leader>le :Ag<cr>
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

" =================
" == FUNCTIONS ====
"
" CREATE WINDOWS DEPENDS H,J,K,L
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
