" NeoVIM config file by @sadotsoy SEP 24 2020 :)
"
" =================
" == GENERAL ======
let mapleader = ','                        " set the <leader>
au BufWritePre * let &bex = '@'            " Meaningful backup name, ex: filename@
set autoread                               " detech when a file is changed
set backup                                 " Turn on backup option
set backupcopy=yes                         " Overwrite the original backup file
set backupdir=~/.backup//                  " Where to store backups
set clipboard^=unnamed,unnamedplus         " Yank and Paste with the system clipboard
set cmdheight=2                            " More space for displaying messages
set confirm
set cursorline                             " active cursorline
set diffopt+=vertical                      " vertical split
set directory=~/.swap//                    " Where to store swap files
set hidden                                 " Required to keep multiple open buffers
set hlsearch                               " Show the prev search pattern
set incsearch                              " set to the first match pattern
set laststatus=2                           " show the status line all the time
set mouse=a                                " Enable mouse to fix the resize scroll cycle
set noshowmode                             " hide the mode
set scroll=5
set scrolloff=8
set shell=/bin/bash                        " set bash for vim command
set showcmd
set sidescrolloff=8
set updatetime=50                          " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set wildignore+=*node_modules/**           " Ignore node_modules
set wildmenu
set writebackup
setlocal textwidth=280                     " have long lines wrap inside comments
set number relativenumber                 " relative lines
set nu rnu
" == Splits
set splitbelow                             " move the new split below the current [DOWN]
set splitright                             " move focus to the new split

" == INDENT/TABS
set autoindent                             " Automatically set indent of new line
set backspace=indent,eol,start             " Make backspace behave in a same manner
set expandtab                              " Convert tabs to spaces
set shiftround                             " Round indenty to a multiple of 'shiftwidth'
set shiftwidth=2                           " Number of spaces to use for indent or unidendt
set smartindent                            " Tab respects 'tabsot', 'shifwidth'. and 'softtabstop'
set softtabstop=2                          " Edit as if the tabs are 4 characters wide
set tabstop=2                              " The visible width of the tabs

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
let g:ale_fix_on_save = 1
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
" Plug 'bling/vim-bufferline'           " show the buffers
" Plug 'chrisbra/NrrwRgn'               " :NR, NW, NRP, NRM
" Plug 'jiangmiao/auto-pairs'           " auto pairs surrounds.
" Plug 'junegunn/vim-slash'             " search with swords.
" Plug 'mbbill/undotree'                " undo history visualizer
" Plug 'terryma/vim-multiple-cursors'   " multiple cursors with <C-n>
Plug 'junegunn/goyo.vim'                " Distraction-free writing in Vim.
Plug 'junegunn/limelight.vim'           " Higlight the cursor position with goyo looks awesome
Plug 'junegunn/vim-easy-align'          " easy align use ga
Plug 'majutsushi/tagbar'                " toogle tag bar
Plug 'rizzatti/dash.vim'                " open dash app

" === GIT
" Plug 'rhysd/git-messenger.vim'        " popup to show commits
Plug 'Kachyz/vim-gitmoji'               " gitmoji c-x c-u
set completefunc=emoji#complete
Plug 'airblade/vim-gitgutter'           " shows a git diff
Plug 'junegunn/gv.vim'                  " git commit browser :GV -S foobar
Plug 'tpope/vim-fugitive'               " the ultimate git helper

" === LINTER & COMPLETE
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" === FILE MANAGER
Plug 'vifm/vifm.vim'                    " VIFM

" === UNIVERSAL TAGS/ AUTOIMPORT JS
Plug 'kristijanhusak/vim-js-file-import', {'do': 'yarn minstall'}
Plug 'ludovicchabant/vim-gutentags'

" == SYNTAX
" +== GENERAL
Plug 'bronson/vim-trailing-whitespace'  " just call :FixWhitespace
Plug 'editorconfig/editorconfig-vim'    " editorconfig
Plug 'junegunn/vim-emoji'               " vim emoji
Plug 'luochen1990/rainbow'              " rainbow close surrounds
Plug 'mattn/emmet-vim'                  " the good plugin
Plug 'raimondi/delimitmate'             " auto-completion for quotes, etc surrounds.
Plug 'tpope/vim-commentary'             " comment with powers
Plug 'tpope/vim-surround'               " surround
Plug 'wellle/targets.vim'               " text obejects with operators ci(operator) ex: ci,

" +== JAVASCRIPT
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'

" +== CSS/STYLES
" Plug 'ap/vim-css-color' "Displays a preview of colors with CSS
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'

" +== MARKDOWN
" Plug 'tpope/vim-markdown'

" == SNIPPETS
" Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'

" === COLORSCHEME
" Plug 'flazz/vim-colorschemes' "fore all
" Plug 'lifepillar/vim-colortemplate' " tool to create colortemplate
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
Plug 'davidosomething/vim-colors-meh' " gshit
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
Plug 'lifepillar/vim-gruvbox8'
Plug 'morhetz/gruvbox'
Plug 'nightsense/cosmic_latte'
Plug 'nikolvs/vim-sunbather'
Plug 'pgdouyon/vim-yin-yang'
Plug 'rakr/vim-one'
Plug 'sadotsoy/darkforce-vim-colors'
Plug 'sainnhe/edge'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'szorfein/fromthehell.vim'
Plug 'wadackel/vim-dogrun'
" Plug '~/workspace/personal/darkforce-vim-colors'
" Plug 'sadotsoy/darkforce-vim-colors', { 'branch': 'develop' }

" === SEARCHING
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

" == END Plug
call plug#end()



" =================
" == COLORSCHEMES =
set background=dark
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


" +=== LIMELIGHT
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" =================
" == MAPPINGS ======
"
"
" Start interactive Easy Align in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive Easy Align for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" == CLOSE && WRITE
nnoremap <leader>q :q!<CR>
map <C-q> :wq<CR>
"
" == WRITE
map <C-w> :w<CR>
"
" == RELOAD SOURCE
map <C-s> :source ~/.config/nvim/init.vim<CR>
"
" == EDIT CONFIG FILE
map <leader>, :vsplit ~/.config/nvim/init.vim<CR>
"
" == Sort
map <leader>so :sort<CR>
"
" === Folds
" open all folds
" nnoremap zr zR
" Fold all tag
" nnoremap fat zfat
" Fold all inside tag
" nnoremap z zfit
"
" === Sessions
" GURU
" ALT + R to load the session
" ALT + S to save the session
nmap <silent> ß :mks! Session.vim<CR>
nmap <silent> ® :source Session.vim<CR>
"
" === Recovers
" noremap <leader>re :vnew | r #<CR>
"
" == SEE ONLY THIS FILE ON THE BUFFER, BEATIFUL FOR DOCUMENTATION
map <leader>o :only<cr>
"
" == FILEMANAGER
" VIFM
map <leader><Space>r :EditVifm .<CR>
map <leader><Space>e :Vifm<CR>
"
" == PRETTIER
map <leader>pr :ALEFix<cr>
"
" === PLUG
map <leader>pi :PlugInstall<CR>
map <leader>pc :PlugClean<CR>
map <leader>pu :PlugUpdate<CR>
map <leader>pg :PlugUpgrade<CR>
"
" == See the hi test
map <leader>hi :so $VIMRUNTIME/syntax/hitest.vim<CR>
"
" === UltiSnips
" map <leader>ue :CocList snippets<cr>
map <leader>ue :CocCommand snippets.editSnippets<cr>
"
" == PDF
map <leader>pdf :command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
"
" == PDFLATEX
map <leader>ltx :!pdflatex %<CR>
"
" == SEARCHING
map <leader>bf :Buffers<cr>
map <leader>co :Commits<cr>
map <leader>fa :Ag<cr>
map <leader>fc :Colors<cr>
map <leader>fl :Lines<cr>
map <leader>fm :Marks<cr>
map <leader>fs :Snippets<cr>
map <leader>gf :GitFiles?<cr>
map <leader>ma :Maps<cr>
map <leader>tg :TagbarToggle<cr>
map <leader>wl :Windows<cr>
" fzf file fuzzy search that respects .gitignore
" If in git directory, show only files that are committed, staged, or unstaged
" else use regular :Files
" CREDITS : https://rietta.com/blog/hide-gitignored-files-fzf-vim/
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"

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
"
" == ALE MAPPING
nmap <silent> {g <Plug>(ale_previous_wrap)
nmap <silent> }g <Plug>(ale_next_wrap)
"
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
"
" Symbol renaming
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
"
" == RESIZE WINDOW
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
"
" == emoji
nmap <leader>em :%s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g<CR>
"
" == GIT MAPPING
" CHECK :HELP GSTATUS FOR MORE KEYS
map <leader>ga :!git add %<cr>:Gcommit<cr>
map <leader>gb :Gblame<cr>
map <leader>gc :GCheckout<cr>
map <leader>gd :Gdiffsplit<cr>
map <leader>ge :GitMessenger<cr>
map <leader>gm :Gcommit<cr>
map <leader>gp :Gpush<cr>
map <leader>gs :G<cr>
map <leader>gv :GV<CR>
map <leader>gw :Gwrite<cr>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
"
" == GOYO
map <leader><ENTER> :Goyo<cr>
"
" == SPELLING
map <leader>s :set spell<cr>
" +=== SPANISH
map <C-g>s :set spelllang=es_mx<CR>
" +=== ENGLISH
map <C-g>e :set spelllang=en_us<CR>
"
" == LIGHT/DARK
"""" DEPENDS OF THE COLORSCHEME
map <C-l>l :set background=light<CR>
map <C-d>d :set background=dark<!-- <CR> -->

" +== MOVE WINDOWS DEPENDS H,J,K,L
map <C-h> :wincmd h<CR>
map <C-j> :wincmd j<CR>
map <C-k> :wincmd k<CR>
map <C-l> :wincmd l<CR>

" == SPLITS
nnoremap <silent> vv <C-w>v
nnoremap <silent> vs <C-w>s

"
" =================
" ==== MACROS =====
" macro to surround all the word
let @s = 'ysiw'

"
" =================
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

" +=== Fuzzy
let g:fzf_layout = { 'window':{ 'width': 0.8, 'height': 0.8 }}
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
