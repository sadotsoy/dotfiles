" NeoVIM config file by @SadotCorts JUN 18 2020 :)
"

" =================
" == GENERAL ======
"
let mapleader = ','							" set the <leader>,
" set colorcolumn=50
" set hidden                      " Required to keep multiple open buffers
set autoread					  				" detech when a file is changed
set clipboard^=unnamed,unnamedplus " Yank and Paste with the system clipboard
set cmdheight=2                 " More space for displaying messages
set laststatus=2								" show the status line all the time
set mouse=a                       " Enable mouse to fix the resize scroll cycle
set nobackup
set noswapfile
set nowrap                      " display long lines
set scrolloff=8
set shell=/bin/bash							" set bash for vim command
set updatetime=50               " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set wildignore+=*node_modules/**  " Ignore node_modules
setlocal textwidth=280				  " have long lines wrap inside comments

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
" let g:tagalong_filetypes = ['html', 'jsx', 'javascriptreact', 'typescriptreact', 'javascript']
" let g:tagalong_verbose=1
let g:user_emmet_mode='a'       "enable all function in all mode.

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

" === COC COMPLETE
let g:coc_global_extensions=['coc-css', 'coc-bookmark', 'coc-emmet', 'coc-tsserver']

" == ALE && DEOPLITE LINTERS/COMPLETE
" Fix files with prettier, and then ESLint.
let b:ale_linters = ['eslint']
let b:ale_fixers = ['prettier'. 'eslint']
let g:ale_fix_on_save = 0
" let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_linters_explicit = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_set_highlights = 1
let g:ale_set_signs = 1
let g:ale_sign_error = '•'
let g:ale_sign_warning = '+'
let g:ale_use_deprecated_neovim = 1
" let g:deoplete#enable_at_startup = 1

" =================
" == PLUGINS ======
" == INITIALIZE PLUG
call plug#begin()

" == UTILITIES
" Plug 'bling/vim-bufferline'             " show the buffers
" Plug 'chrisbra/NrrwRgn'                 " :NR, NW, NRP, NRM
Plug 'junegunn/limelight.vim'           " Higlight the cursor position with goyo looks awesome
" Plug 'mbbill/undotree'                  " undo history visualizer
" Plug 'terryma/vim-multiple-cursors'     " multiple cursors with <C-n>
Plug 'airblade/vim-gitgutter'           " shows a git diff
Plug 'bronson/vim-trailing-whitespace'  " just call :FixWhitespace
Plug 'junegunn/goyo.vim'                " Distraction-free writing in Vim.
Plug 'raimondi/delimitmate'             " auto-completion for quotes, etc.
Plug 'tpope/vim-commentary'             " comment with powers
Plug 'tpope/vim-fugitive'               " the ultimate git helper
Plug 'tpope/vim-surround'               " surround

" === LINTER & COMPLETE
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" === FILE MANAGER
Plug 'vifm/vifm.vim'                    " VIFM

" === UNIVERSAL TAGS/ AUTOIMPORT JS
Plug 'ludovicchabant/vim-gutentags'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}

" == SYNTAX
" +== GENERAL
" Plug 'AndrewRadev/tagalong.vim'         " edit tags
" Plug 'ervandew/supertab'
Plug 'Yggdroot/indentLine'
Plug 'editorconfig/editorconfig-vim'
Plug 'luochen1990/rainbow'
Plug 'mattn/emmet-vim'                  " the good plugin
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'wellle/targets.vim'               " text obejects with operators ci(operator) ex: ci,

" +== JAVASCRIPT
" Plug 'allanhortle/vim-boring-javascript'
" Plug 'othree/yajs.vim'
" Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Plug 'phodge/vim-javascript-syntax'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'

" +== CSS/STYLES
" Plug 'ap/vim-css-color' "Displays a preview of colors with CSS
" Plug 'hail2u/vim-css3-syntax'
" Plug 'cakebaker/scss-syntax.vim'

" +== MARKDOWN
" Plug 'tpope/vim-markdown'

" == SNIPPETS
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'

" === COLORSCHEME
" Plug 'flazz/vim-colorschemes' "fore all
" Plug 'rafi/awesome-vim-colorschemes' " most popular on vimawesome
Plug 'andreypopp/vim-colors-plain'
Plug 'aonemd/kuroi.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'arzg/vim-colors-xcode'
Plug 'cideM/yui'
Plug 'cocopon/iceberg.vim'
Plug 'danishprakash/vim-yami'
Plug 'davidosomething/vim-colors-meh'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'drewtempelmeyer/palenight.vim'
Plug 'fenetikm/falcon'
Plug 'fxn/vim-monochrome'
Plug 'haishanh/night-owl.vim'
Plug 'hardselius/warlock'
Plug 'https://git.sr.ht/~romainl/vim-bruin'
Plug 'huyvohcmc/atlas.vim'
Plug 'jacoborus/tender.vim'
Plug 'jaredgorski/fogbell.vim'
Plug 'jaredgorski/spacecamp'
Plug 'joshdick/onedark.vim'
Plug 'kjssad/quantum.vim'
Plug 'larsbs/vimterial_dark'
Plug 'lifepillar/vim-colortemplate' " tool to create colortemplate
Plug 'lifepillar/vim-gruvbox8'
Plug 'morhetz/gruvbox' "not more My favorite theme
Plug 'nightsense/cosmic_latte'
Plug 'nikolvs/vim-sunbather'
Plug 'pgdouyon/vim-yin-yang'
Plug 'rakr/vim-one'
Plug 'sainnhe/edge'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'szorfein/fromthehell.vim'
Plug 'wadackel/vim-dogrun'
Plug 'sadotsoy/darkforce-vim-colors'
" Plug 'sadotsoy/darkforce-vim-colors', { 'branch': 'develop' }

" === SEARCHING
" Plug 'ctrlpvim/ctrlp.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

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
" let g:yui_comments='emphasize'
" let g:monochrome_italic_comments = 1
let g:darkforce_italic_comments = 1
syntax enable
colorscheme darkforce
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

" === PLUG
map <leader>pi :PlugInstall<CR>
map <leader>pc :PlugClean<CR>
map <leader>pu :PlugUpdate<CR>
map <leader>pg :PlugUpgrade<CR>

" == See the hi test
map <leader>hi :so $VIMRUNTIME/syntax/hitest.vim<CR>

" == Sort
map <leader>so :sort<CR>

" === UltiSnips
map <leader>ue :UltiSnipsEdit<cr>

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

" == COC
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> {g <Plug>(ale_previous_wrap)
nmap <silent> }g <Plug>(ale_next_wrap)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


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
" +== MOVE WINDOWS DEPENDS H,J,K,L
map <leader>wl :Windows<cr>
map <C-h> :wincmd h<CR>
map <C-j> :wincmd j<CR>
map <C-k> :wincmd k<CR>
map <C-l> :wincmd l<CR>
" == SPLITS
nnoremap <silent> vv <C-w>v
nnoremap <silent> vs <C-w>s


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

