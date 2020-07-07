" NeoVIM config file by @sadotsoy JUL 07 2020 :)
"

" =================
" == GENERAL ======
"
let mapleader = ','							" set the <leader>,
" set colorcolumn=200
" set nowrap                      " display long lines
set autoread					  				" detech when a file is changed
set clipboard^=unnamed,unnamedplus " Yank and Paste with the system clipboard
set cmdheight=2                 " More space for displaying messages
set diffopt+=vertical           " vertical split
set hidden                      " Required to keep multiple open buffers
set laststatus=2								" show the status line all the time
set mouse=a                     " Enable mouse to fix the resize scroll cycle
set nobackup
set noswapfile
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

" == Abbreviations
" === HELP
" open help in vertical split
" cabbrev :h vert h

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

" == SNIPPETS
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)


" === COC COMPLETE
let g:coc_global_extensions=['coc-css', 'coc-emmet', 'coc-tsserver', 'coc-snippets']

" == ALE && DEOPLITE LINTERS/COMPLETE
" Fix files with prettier, and then ESLint.
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'scss': ['prettier'], 'vim': ['prettier'], 'html': ['prettier']}
let g:ale_javascript_eslint_use_local = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_set_highlights = 1
let g:ale_set_signs = 1
let g:ale_sign_error = '•'
let g:ale_sign_warning = '+'

" =================
" == PLUGINS ======
" == INITIALIZE PLUG
call plug#begin()

" == UTILITIES
" Plug 'bling/vim-bufferline'             " show the buffers
" Plug 'chrisbra/NrrwRgn'                 " :NR, NW, NRP, NRM
" Plug 'mbbill/undotree'                  " undo history visualizer
" Plug 'terryma/vim-multiple-cursors'     " multiple cursors with <C-n>
Plug 'airblade/vim-gitgutter'           " shows a git diff
Plug 'bronson/vim-trailing-whitespace'  " just call :FixWhitespace
Plug 'junegunn/goyo.vim'                " Distraction-free writing in Vim.
Plug 'junegunn/limelight.vim'           " Higlight the cursor position with goyo looks awesome
Plug 'raimondi/delimitmate'             " auto-completion for quotes, etc.
Plug 'tpope/vim-commentary'             " comment with powers
Plug 'tpope/vim-fugitive'               " the ultimate git helper
Plug 'tpope/vim-surround'               " surround
Plug 'rizzatti/dash.vim'                " open dash app
Plug 'majutsushi/tagbar'                " toogle tag bar

" === LINTER & COMPLETE
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" === FILE MANAGER
Plug 'vifm/vifm.vim'                    " VIFM

" === UNIVERSAL TAGS/ AUTOIMPORT JS
Plug 'ludovicchabant/vim-gutentags'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'yarn minstall'}

" == SYNTAX
" +== GENERAL
Plug 'Yggdroot/indentLine'
Plug 'editorconfig/editorconfig-vim'
Plug 'luochen1990/rainbow'
Plug 'mattn/emmet-vim'                  " the good plugin
Plug 'wellle/targets.vim'               " text obejects with operators ci(operator) ex: ci,

" +== JAVASCRIPT
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'

" +== CSS/STYLES
" Plug 'ap/vim-css-color' "Displays a preview of colors with CSS
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'

" +== MARKDOWN
" Plug 'tpope/vim-markdown'

" == SNIPPETS
" Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'

" === COLORSCHEME
" Plug 'flazz/vim-colorschemes' "fore all
" Plug 'rafi/awesome-vim-colorschemes' " most popular on vimawesome
Plug 'AlessandroYorba/Breve'
Plug 'AlessandroYorba/Sierra'
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
Plug 'sadotsoy/darkforce-vim-colors'
Plug 'sainnhe/edge'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'szorfein/fromthehell.vim'
Plug 'wadackel/vim-dogrun'
" Plug '~/workspace/personal/darkforce-vim-color'
" Plug 'sadotsoy/darkforce-vim-colors', { 'branch': 'develop' }

" === SEARCHING
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" == END Plug
call plug#end()



" =================
" == COLORSCHEMES =
set background=dark termguicolors cursorline
"
" set 1 for the specific themes support
" let g:one_allow_italics = 1 " I love italic for comments
" let g:onedark_terminal_italics = 1
" let g:quantum_italics=1
" let g:palenight_terminal_italics=1
" let g:yui_comments='emphasize'
" let g:monochrome_italic_comments = 1
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
set statusline+=\ %t " fileName
set statusline+=%= "Right side settings
set statusline+=%#Todo#
set statusline+=\ [%n] " Buffer number
set statusline+=%#Search#
set statusline+=\ %c:%l/%L " column:line/TOTALLINES
set statusline+=\ [%%%p] " percent of the cursor position respect the file

" +=== LIMELIGHT
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" =================
" == MAPPINGS ======
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
map <leader>ue :CocList snippets<cr>

" == FILEMANAGER
" VIFM
map <leader><Space> :EditVifm .<CR>

" == PRETTIER
map <leader>pr :ALEFix<cr>

" == PDF
map <leader>pdf :command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -

" == PDFLATEX
map <leader>ltx :!pdflatex %<CR>

" == SEARCHING
map <leader>bf :Buffers<cr>
map <leader>co :Commits<cr>
map <leader>fa :Ag<cr>
map <leader>fc :Colors<cr>
map <leader>ff :Files<cr>
map <leader>fl :Lines<cr>
map <leader>fm :Marks<cr>
map <leader>fs :Snippets<cr>
map <leader>gf :GitFiles?<cr>
map <leader>ma :Maps<cr>
map <leader>tg :TagbarToggle<cr>
map <leader>wl :Windows<cr>

" == RELOAD SOURCE
map <C-s> :source ~/.config/nvim/init.vim<CR>

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

" == ALE MAPPING
nmap <silent> {g <Plug>(ale_previous_wrap)
nmap <silent> }g <Plug>(ale_next_wrap)

" == COC MAPPING
" Use `[g` and `]g` to navigate diagnostics
" Use `{g` and `}g` to navigate linter diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" == RESIZE WINDOW
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" == FUGITIVE TPOPE MAPING
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
map <C-h> :wincmd h<CR>
map <C-j> :wincmd j<CR>
map <C-k> :wincmd k<CR>
map <C-l> :wincmd l<CR>

" == SPLITS
nnoremap <silent> vv <C-w>v
nnoremap <silent> vs <C-w>s

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
