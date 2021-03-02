" General settings file @sadotsoy
"
" == GENERAL SETTINGS ======
let mapleader = ','                        " set the <leader>
au BufWritePre * let &bex = '@'            " Meaningful backup name, ex: filename@
" autocmd BufEnter * silent! lcd %:p:h
" set autochdir                              " change working directory by file
set autoread                               " detech when a file is changed
set backup                                 " Turn on backup option
set backupcopy=yes                         " Overwrite the original backup file
set backupdir=~/.backup/                  " Where to store backups
set clipboard^=unnamed,unnamedplus         " Yank and Paste with the system clipboard
set cmdheight=2                            " More space for displaying messages
set confirm
set cursorline                             " active cursorline
set diffopt+=vertical                      " vertical split
set directory=~/.swap/                    " Where to store swap files
set hidden                                 " Required to keep multiple open buffers
set hlsearch                               " Show the prev search pattern
set incsearch                              " set to the first match pattern
set laststatus=2                           " show the status line all the time
set mouse=a                                " Enable mouse to fix the resize scroll cycle
set nomodeline
set noshowcmd                              " hide the cmd
set noshowmode                             " hide the mode
set nu rnu
set number relativenumber                 " relative lines
set scroll=5
set scrolloff=8
set shell=/bin/bash                        " set bash for vim command
set sidescrolloff=8
set updatetime=50                          " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set wildignore+=*node_modules/**           " Ignore node_modules
set wildmenu
set writebackup
setlocal textwidth=280                     " have long lines wrap inside comments

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

" == OTHERS
filetype plugin indent on    " detecth the filetype
set encoding=utf-8
set magic                     " set magic on, for regex
set mat=2                     " how many tenths of a second to blink
set showmatch                 " show matching braces

" == PLUGINS
set completefunc=emoji#complete

" == LISTS
set list
set lcs=tab:-->,trail:- " display chars for tabs and trailing spaces

" Filetypes
" REACT
augroup filetypedetect
    autocmd BufNew,BufNewFile,BufRead *.js,*.jsx :setfiletype javascriptreact
augroup END

" == PYTHON
" Providers
" let g:python3_host_prog  = '~/.envs/neovim/bin/python'
" let g:loaded_python_provider = 0

" augroup vimrc-statusline
"     autocmd WinEnter * let g:status_line_active='simon'
"     autocmd WinLeave * let g:status_line_active='nel'
" augroup END
" augroup vimrc-statusline
"     autocmd!
"     autocmd WinEnter * :setlocal test=active
"     autocmd WinLeave * :setlocal test=inactive
" augroup END
