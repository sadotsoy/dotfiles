"██╗   ██╗██╗███╗   ███╗
"██║   ██║██║████╗ ████║
"██║   ██║██║██╔████╔██║
"╚██╗ ██╔╝██║██║╚██╔╝██║
" ╚████╔╝ ██║██║ ╚═╝ ██║
"  ╚═══╝  ╚═╝╚═╝     ╚═╝
" Vim config files by @SadotCorts APR 11 2018

""""""""""""""""""""""""""""""""""""""""""""""""""
" ================ General ===============       "
""""""""""""""""""""""""""""""""""""""""""""""""""
set shell=/bin/bash		" set the vim shell
let mapleader = ','		" set the <leader>
set number			" to show the number lines
set autoindent			" automatically set indent of new line
set smartindent
set laststatus=2		" show the status line all the time
set autoread			" detect when a file is changed
set backspace=indent,eol,start 	" make backspace behave in a sane manner
setlocal textwidth=280		" have long lines wrap inside comments.

" Tabs
" set noexpandtab " tabs ftw
" set smarttab " tab respects 'tabstot', 'shiftwidth', and 'softtabstop'
" set tabstop=4 " the visible width of tabs
" set softtabstop=4 " edit as if the tabs are 4 characters wide
" set shiftwidth=4 " number of spaces to use for indent and unindent
" set shiftround " round indent to a multiple of 'shiftwidth'
set clipboard=unnamed
set ttyfast " Faster redrawing

" Copy paste system clipboard
map <leader>y "*y
map <leader>p "*p
map <leader>P "*P

""""""""""""""""""""""""""""""""""""""""""""""""""
"  ================ Vundle ===============       "
""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible		" be iMproved, required
filetype off			" required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""
" ======== vundle Utilites Plugins ===========	 "
""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle
Plugin 'jistr/vim-nerdtree-tabs' " NeerdTree feel like real panel
Plugin 'xuyuanp/nerdtree-git-plugin' " Show git in nerdTree
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight' " NerdTree shgh
Plugin 'tpope/vim-fugitive' " the ultimate git helper
Plugin 'ryanoasis/vim-devicons' " NERDTREE icons
Plugin 'tpope/vim-commentary' " comment/uncomment lines with gcc or gc in visual mode
Plugin 'tpope/vim-surround' "all about 'surroundings'
Plugin 'ervandew/supertab' " Perform all your vim insert mode completions with TAB
Plugin 'tpope/vim-repeat' " then run following in vim
Plugin 'bling/vim-bufferline' " show the buffers
Plugin 'mbbill/undotree' " undo history visualizer
Plugin 'bronson/vim-trailing-whitespace' " just call :FixWhitespace
Plugin 'majutsushi/tagbar' " displays TagBar in a window
Plugin 'raimondi/delimitmate' " auto-completion for quotes, etc.
Plugin 'terryma/vim-multiple-cursors' " multiple cursor
Plugin 'danro/rename.vim' " rename regular file
Plugin 'vim-gitgutter' " shows a git diff
""""""""""""""""""""""""""""""""""""""""""""""""""
" ========== vundle Syntax Plugins ========== 	 "
""""""""""""""""""""""""""""""""""""""""""""""""""
" General

" Fish
Plugin 'dag/vim-fish' " support for editing fish scripts

" HTML/CSS
Plugin 'mattn/emmet-vim' " this is the GODSHIT!
Plugin 'hail2u/vim-css3-syntax' " Css Syntax
Plugin 'gorodinskiy/vim-coloresque' " Highlight the colors
" Plugin 'valloric/matchagalways' " highlighting the tags
Plugin 'othree/html5.vim' " OmniComplete HTML

" JavaScript
Plugin 'othree/javascript-libraries-syntax.vim' " Syntax for JS libraries
Plugin 'Quramy/vim-js-pretty-template' " Syntax highlight for contents
Plugin 'isruslan/vim-es6'
Plugin 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plugin 'jelera/vim-javascript-syntax'
" Plugin 'othree/es.next.syntax.vim' " Es.next JS syntax
" Plugin 'othree/yajs.vim', { 'for': 'javascript' } " Yet another Js Syntax

Plugin 'jason0x43/vim-js-indent'
" Plugin 'bigfish/vim-js-context-coloring'

" Reactjs
Plugin 'maxmellon/vim-jsx-pretty' "JSyntax pretty highlighting for vim

" Docker
Plugin 'ekalinin/dockerfile.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""
" =========== vundle colorschemes ============ 	 "
""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'scwood/vim-hybrid'
Plugin 'nanotech/jellybeans.vim'
"""""""""""""""""
"   ==END==     "
"""""""""""""""""
call vundle#end()		" required
filetype plugin indent on	" required

""""""""""""""""""""""""""""""""""""""""""""""""""
" ============== User Interface ============ 	   "
""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set encoding=utf-8
set termguicolors
let base16colorspace=256
set t_Co=256
set background=dark
colorscheme hybrid
" colorscheme jellybeans
" indent-guides
set ts=2 sw=2 et
let g:indent_guides_start_level =2

" Others
set magic " set magic on, for regex
set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink

" Hybrid colorscheme config
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
"""""""""""""""""
" ==Settings==  "
"""""""""""""""""
"NERDTree
let g:NERDTreeQuitOnOpen=0
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|node_modules$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$'
            \ }

""""""""""""""""""""""""""""""""""""""""""""""""""
" ============== Fugitive Tpope ============ 	   "
""""""""""""""""""""""""""""""""""""""""""""""""""
" check :help Gstatus for more keys
map <leader>gs :Gstatus<cr>
map <leader>gc :Gcommit<cr>
map <leader>ga :Git add --all<cr>:Gcommit<cr>
map <leader>gb :Gblame<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""
" ===========  JsLibraries =============	 	 "
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let g:javascript_plugin_flow = 'jquery,angularjs,angularui,angularuirouter,react,flux,chai,vue,d3'
let g:jsx_ext_required = 0 " Use jsx in js files

""""""""""""""""""""""""""""""""""""""""""""""""""
" ===========  Mappings =============	 	 "
""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab Mapping
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove<cr>

" NERDTree mappin
map <leader>ne :NERDTreeToggle<cr>
" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk

" Call Windows
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

" NERDTress File highlighting
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let s:brown = "795548" " #795548
let s:aqua =  "81d4fa" "  #81d4fa
let s:blue = "2196f3" " #2196f3
let s:darkBlue = "1565c0" " #1565c0
let s:purple = "9c27b0" " #9c27b0
let s:lightPurple = "ab47bc" " #ab47bc
let s:red = "f44336" " #f44336
let s:beige = "F5C06F" " #F5C06F
let s:yellow = "ffea00" " #ffea00
let s:orange = "ff9800" " #ff9800
let s:darkOrange = "ef6c00" " #ef6c00
let s:pink = "e91e63" " #e91e63
let s:salmon = "EE6E73" " #EE6E73
let s:green = "1b5e20" " #1b5e20
let s:lightGreen = "8bc34a" " #8bc34a
let s:white = "FFFFFF"
let s:rspec_red = 'dd2c00' " #dd2c00
let s:git_orange = 'f4511e' " #f4511e

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue
let g:NERDTreeExtensionHighlightColor['js'] = s:yellow
let g:NERDTreeExtensionHighlightColor['go'] = s:purple
let g:NERDTreeExtensionHighlightColor['html'] = s:red
let g:NERDTreeExtensionHighlightColor['md'] = s:beige
let g:NERDTreeExtensionHighlightColor['json'] = s:darkOrange

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files
" loading the plugin
let g:webdevicons_enable = 1
" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1
let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb
let g:NERDTreePatternMatchHighlightColor['.*swp$'] = s:rspec_red " sets the color for files ending with _spec.rb

