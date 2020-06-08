" NeoVIM config file by @SadotCorts JUN 8 2020 :)
"

" =================
" == GENERAL ======
"
let mapleader = ','							" set the <leader>,
set autoread					  				" detech when a file is changed
set clipboard^=unnamed,unnamedplus " Yank and Paste with the system clipboard
set laststatus=2								" show the status line all the time
set shell=/bin/bash							" set bash for vim command
setlocal textwidth=280				  " have long lines wrap inside comments
set nowrap                      " display long lines
" set hidden                      " Required to keep multiple open buffers
" set cmdheight=1                 " More space for displaying messages
set wildignore+=*node_modules/**  " Ignore node_modules
set mouse=a                       " Enable mouse to fix the resize scroll cycle

" == NUMBER LINES               " set relative number
set number relativenumber
set nu rnu

" == INDENT/TABS
set autoindent									" Automatically set indent of new line
set backspace=indent,eol,start	" Make backspace behave in a same manner
set expandtab                   " Convert tabs to spaces
set shiftround									" Round indenty to a multiple of 'shiftwidth'
set shiftwidth=2								" Number of spaces to use for indent or unidendt
set smartindent									" Tab respects 'tabsot', 'shifwidth'. and 'softtabstop'
set softtabstop=2								" Edit as if the tabs are 4 characters wide
set tabstop=2										" The visible width of the tabs

" == SPELLING
set spelllang=en_us,es_mx

" == SEARCH
set ignorecase                  " Sensitive case for local search
set smartcase

" == EMMET
let g:user_emmet_mode='a'       "enable all function in all mode.
let g:tagalong_verbose=1
let g:tagalong_filetypes = ['html', 'jsx', 'javascriptreact', 'typescriptreact', 'javascript']

" == OTHERS
filetype plugin indent on				" detecth the filetype
set encoding=utf-8
set magic												" set magic on, for regex
set mat=2												" how many tenths of a second to blink
set showmatch										" show matching braces

" SNIPPETS
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" == ALE && DEOPLITE LINTERS/COMPLETE
" Fix files with prettier, and then ESLint.
let b:ale_linters = ['eslint']
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_fix_on_save = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_set_highlights = 1
let g:ale_set_signs             = 1
let g:ale_sign_error = '•'
let g:ale_sign_warning = '+'
let g:ale_use_deprecated_neovim = 1
let g:deoplete#enable_at_startup = 1

" =================
" == PLUGINS ======
" == INITIALIZE PLUG
call plug#begin()

" == UTILITIES
Plug 'airblade/vim-gitgutter'           " shows a git diff
Plug 'bling/vim-bufferline'             " show the buffers
Plug 'bronson/vim-trailing-whitespace'  " just call :FixWhitespace
Plug 'chrisbra/NrrwRgn'                 " :NR, NW, NRP, NRM
Plug 'mbbill/undotree'                  " undo history visualizer
Plug 'raimondi/delimitmate'             " auto-completion for quotes, etc.
Plug 'terryma/vim-multiple-cursors'     " multiple cursors with <C-n>
Plug 'tpope/vim-commentary'             " comment with powers
Plug 'tpope/vim-fugitive'               " the ultimate git helper
Plug 'tpope/vim-surround'               " surround
Plug 'junegunn/goyo.vim'                " Distraction-free writing in Vim.
Plug 'junegunn/limelight.vim'           " Higlight the cursor position with goyo looks awesome
Plug 'makerj/vim-pdf'                   " PDF reader

" === LINTER & COMPLETE
Plug 'dense-analysis/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" === FILE MANAGER
Plug 'vim-scripts/fountain.vim'
Plug 'vifm/vifm.vim'                    " VIFM

" === UNIVERSAL TAGS/ AUTOIMPORT JS
Plug 'ludovicchabant/vim-gutentags'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}

" == SYNTAX
" +== GENERAL
Plug 'AndrewRadev/tagalong.vim'         " edit tags
Plug 'Yggdroot/indentLine'
Plug 'editorconfig/editorconfig-vim'
Plug 'luochen1990/rainbow'
Plug 'mattn/emmet-vim'                  " the good plugin
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'wellle/targets.vim'               " text obejects with operators ci(operator) ex: ci,
" Plug 'ervandew/supertab'

" +== JAVASCRIPT
" Plug 'phodge/vim-javascript-syntax'
" Plug 'allanhortle/vim-boring-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
" Plug 'othree/yajs.vim'
" 2
" Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" +== CSS/STYLES
" Plug 'ap/vim-css-color' "Displays a preview of colors with CSS

" +== MARKDOWN
Plug 'tpope/vim-markdown'

" == SNIPPETS
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'

" === COLORSCHEME
" Plug 'rafi/awesome-vim-colorschemes' " most popular on vimawesome
" Plug 'flazz/vim-colorschemes' "fore all
Plug 'aonemd/kuroi.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'drewtempelmeyer/palenight.vim'
Plug 'fenetikm/falcon'
Plug 'haishanh/night-owl.vim'
Plug 'jacoborus/tender.vim'
Plug 'jaredgorski/spacecamp'
Plug 'joshdick/onedark.vim'
Plug 'kjssad/quantum.vim'
Plug 'larsbs/vimterial_dark'
Plug 'lifepillar/vim-colortemplate' " tool to create colortemplate
Plug 'lifepillar/vim-gruvbox8'
Plug 'morhetz/gruvbox' "My favorite theme
Plug 'nightsense/cosmic_latte'
Plug 'rakr/vim-one'
Plug 'sainnhe/edge'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'szorfein/fromthehell.vim'
Plug 'wadackel/vim-dogrun'

" === SEARCHING
Plug '/usr/local/opt/fzf'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf.vim'

" === PRESENTATIONS
" need gem install vimdeck
Plug 'tybenz/vimdeck' " Vim presentations with MARKDOWN


" == END Plug
call plug#end()
" =================
" == COLORSCHEMES =
" colorschemes, dracula, gruvbox, vimterial_dark or see https://github.com/rafi/awesome-vim-colorschemes
set background=dark termguicolors cursorline
"
" set 1 for the specific themes support
" let g:one_allow_italics = 1 " I love italic for comments
" let g:onedark_terminal_italics = 1
" let g:quantum_italics=1
" let g:palenight_terminal_italics=1
syntax enable
colorscheme fromthehell
set t_Co=256
set ts=2 sw=2 et

" +=== STATUSLINE
set noshowmode             " No see again the inset on status
set statusline=2
set statusline=
set statusline+=%#IncSearch#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#Search#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%{(mode()=='r')?'\ \ REPLACE\ ':''}
set statusline+=%#Visual#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#StatusLine#%{(mode()=='V')?'\ \ V-LINE\ ':''}
set statusline+=%#CursorLineNr#
set statusline+=\ %t
set statusline+=%= "Right side settings
set statusline+=%#Search#
set statusline+=\ %c:%l/%L
set statusline+=\ [%%%p]
" set statusline=%<%m%f:%l\ _%{winnr()}_\ %y%r%=<%b\ 0x%B>\ \ %c%V\ %P
" set statusline=%m%f:%l/%L\ %P\ %<<%-3b\ 0x%-2B>\ %y%r%w%=b:%n\ w:%{winnr()}

" +=== LIMELIGHT
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" =================
" == MAPPING ======
"
" == EDIT CONFIG FILE
map <leader>, :vsplit ~/.config/nvim/init.vim<CR>

" == SEE ONLY THIS FILE ON THE BUFFER, BEATIFUL FOR DOCUMENTATION
map <leader>o :only<cr>

" == See the hi test
map <leader>hi :so $VIMRUNTIME/syntax/hitest.vim<CR>

" == FILEMANAGER
map <leader>l :ls<cr>
" LEXPLORE, left and right
map <leader>e :Lex<cr>
map <leader>er :Lex!<cr>
" VIFM
map <leader><Space> :EditVifm .<CR>

" == PRETTIER
map <leader>pr :Prettier<cr>

" == ALE MAPPING
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" == PDF
map <leader>pdf :command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -

" == PDFLATEX
map <leader>ltx :!pdflatex %<CR>

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
map <leader>s :set spell<cr>
" +=== SPANISH
map <C-g>s :set spelllang=es_mx<CR>
" +=== ENGLISH
map <C-g>e :set spelllang=en_us<CR>

" == LIGHT/DARK
"""" DEPENDS OF THE COLORSCHEME
map <C-l>l :set background=light<CR>
map <C-d>d :set background=dark<!-- <CR> -->

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

