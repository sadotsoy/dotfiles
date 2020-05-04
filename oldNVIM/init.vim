".__   __.  _______   ______   ____    ____  __  .___  ___.
"|  \ |  | |   ____| /  __  \  \   \  /   / |  | |   \/   |
"|   \|  | |  |__   |  |  |  |  \   \/   /  |  | |  \  /  |
"|  . `  | |   __|  |  |  |  |   \      /   |  | |  |\/|  |
"|  |\   | |  |____ |  `--'  |    \    /    |  | |  |  |  |
"|__| \__| |_______| \______/      \__/     |__| |__|  |__|
"
" Vim config files by @SadotCorts DIC 31 2019

""""""""""""""""""""""""""""""""""""""""""""""""""
" ================ General ===============       "
""""""""""""""""""""""""""""""""""""""""""""""""""
set shell=/bin/bash		" set the vim shell
set autoindent			" automatically set indent of new line
set smartindent
set laststatus=2		" show the status line all the time
set autoread			" detect when a file is changed
set backspace=indent,eol,start 	" make backspace behave in a sane manner
setlocal textwidth=280		" have long lines wrap inside comments.
" set guifont=Ubuntu\ Mono\ derivative\ Powerline:h15
let g:rainbow_active = 1
let mapleader = ','		" set the <leader>
let g:python3_host_prog='/usr/local/bin/python3' " set python env
set clipboard=unnamed " Yank and paste with the system clipboard

set smarttab " tab respects 'tabstot', 'shiftwidth', and 'softtabstop'
set tabstop=2 " the visible width of tabs
set softtabstop=2 " edit as if the tabs are 4 characters wide
set shiftwidth=2 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'
filetype plugin indent on

" ===== Others"
"""""""""""""""
set magic " set magic on, for regex
set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink
let NERDTreeShowHidden=1 " Sidebar nerdtree options

" ====== Reload icons after init source"
""""""""""""""""""""""""""""""""""""""""
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
"  ================ Plugins ===============      "
""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
" ====== Utilities"
"""""""""""""""""""
" Plug 'mhinz/vim-startify' " fancy startify
Plug 'tpope/vim-commentary' " comment with powers
Plug 'tpope/vim-fugitive' " the ultimate git helper
Plug 'bling/vim-bufferline' " show the buffers
Plug 'bronson/vim-trailing-whitespace' " just call :FixWhitespace
Plug 'raimondi/delimitmate' " auto-completion for quotes, etc.
Plug 'airblade/vim-gitgutter' " shows a git diff
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'luochen1990/rainbow' " rainbow_parentheses
Plug 'tpope/vim-surround' " surround
Plug 'terryma/vim-multiple-cursors' " multiple cursors with <C-n>
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'chrisbra/NrrwRgn' " :NR, NW, NRP, NRM
Plug 'mbbill/undotree' " undo history visualizer
" Plug 'majutsushi/tagbar' " displays TagBar in a window needs Universal Ctags
" Plug 'ludovicchabant/vim-gutentags' " auto-updating ctags works only for https://dev.to/pluralsight/my-5-favorite-software-design-principles-4echUniversal Ctags
" Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'} " import JS components with tag needs Universal Ctags
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' } " LaTeX preview plugin.
" ===== Syntax plugins"
""""""""""""""""""""""""
Plug 'wellle/targets.vim' " text obejects with operators ci(operator) ex: ci,
Plug 'pangloss/vim-javascript'
" Plug 'sheerun/vim-polyglot'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'alampros/vim-styled-jsx'
" ====== Linter"
""""""""""""""""
" Plug 'dense-analysis/ale'
" ====== Theme"
"""""""""""""""
Plug 'flazz/vim-colorschemes'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'trevordmiller/nova-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ajh17/Spacegray.vim'
Plug 'jacoborus/tender.vim'
Plug 'haishanh/night-owl.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'arzg/vim-colors-xcode'
" ====== Files tree"
""""""""""""""""""""
Plug 'scrooloose/nerdtree'
" ====== search"
""""""""""""""""
Plug 'ctrlpvim/ctrlp.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Shougo/denite.nvim'
" ====== Auto Complete"
"""""""""""""""""""""""
" for JS
" :CocInstall coc-tsserver coc-eslint coc-json coc-prettier coc-css
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" set rtp+=/usr/local/opt/fzf
call plug#end()

" ====== Color options"
"""""""""""""""""""""""
" onehalfdark nova
" spacegray tendexcodedarkr
" dracula snazzy
" xcodedark
syntax enable
set t_Co=256
set background=dark
set ts=2 sw=2 et

""""""""""""""""""""""""""""""""""""""""""""""""""
" ===============  Mappings ================	 	 "
""""""""""""""""""""""""""""""""""""""""""""""""""
" ====== Searching"
"""""""""""""""""""
" to search files
map <leader>ff :Files<cr>

" to search inside files need the_silver_searcher
map <leader>fa :Ag<cr>
" ====== Prettier"
""""""""""""""""""
map <leader>pr :Prettier<cr>

" ====== Terminal"
""""""""""""""""""
map <leader>tt :term/usr/local/bin/fish<cr>
" tnoremap <silent><C-z> <C-\><C-n>:call Terminal()<Enter>
" nnoremap <silent><C-z> :call Terminal()<Enter>
" ====== Tag Toogle"
""""""""""""""""""""
" map <leader>tg :TagbarToggle<cr> need universal tags

" ====== Buffers"
"""""""""""""""""
map <leader>bf :Buffers<cr>

" ====== Undo Treee"
""""""""""""""""""""
map <leader>ut :UndotreeToggle<cr>
" ====== Tab Mapping"
"""""""""""""""""""""
map <leader>tc :tabnew<cr>
map <leader>te :tabedit
map <leader>tq :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove<cr>

"navigate panes with ctrl jklh
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

"Copy to clipboard on selection+Y
noremap Y "*y
noremap p "*p
noremap P "*P

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v

" ====== NERDTree mappin"
"""""""""""""""""""""""""
map <leader>ne :NERDTreeToggle<cr>
" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk

" ====== Fugitive Tpope
" check :help Gstatus for more keys
map <leader>gs :Gstatus<cr>
map <leader>gc :Gcommit<cr>
map <leader>ga :!git add %<cr>:Gcommit<cr>
map <leader>gb :Gblame<cr>
map <leader>gd :Gdiffsplit<cr>


" ====== call Terminal"
"""""""""""""""""""""""
""
" INESTABLE... check this https://gist.github.com/ram535/b1b7af6cd7769ec0481eb2eed549ea23
" Toggle terminal buffer or create new one if there is none.
"
" nnoremap <silent> <C-z> :call terminal()<Enter>
" tnoremap <silent> <C-z> <C-\><C-n>:call terminal#create()<Enter>
""
function! Terminal() abort
  if !has('nvim')
    return v:false
  endif

  " Create the terminal buffer.
  if !exists('g:terminal') || !g:terminal.term.loaded
    return TerminalCreate()
  endif

  " Go back to origin buffer if current buffer is terminal.
  if g:terminal.term.bufferid ==# bufnr('')
    silent execute 'buffer' g:terminal.origin.bufferid

  " Launch terminal buffer and start insert mode.
  else
    let g: terminal.term.shell = '/usr/local/bin/fish'
    let g: terminal.origin.bufferid = bufnr('')

    silent execute 'buffer' g:terminal.term.bufferid
    startinsert
  endif
endfunction

""
" Create the terminal buffer.
""
function! TerminalCreate() abort
	if !has('nvim')
		return v:false
	endif

	if !exists('g:terminal')
		let g:terminal = {
			\ 'opts': {},
			\ 'term': {
				\ 'loaded': v:null,
				\ 'bufferid': v:null,
        \ 'shell': v:null
			\ },
			\ 'origin': {
				\ 'bufferid': v:null
			\ }
		\ }

		function! g:terminal.opts.on_exit(jobid, data, event) abort
			silent execute 'buffer' g:terminal.origin.bufferid
			silent execute 'bdelete!' g:terminal.term.bufferid

			let g:terminal.term.loaded = v:null
			let g:terminal.term.bufferid = v:null
			let g:terminal.origin.bufferid = v:null
		endfunction
	endif

	if g:terminal.term.loaded
		return v:false
	endif

	let g:terminal.origin.bufferid = bufnr('')

	enew
	call termopen(&shell, g:terminal.opts)

	let g:terminal.term.loaded = v:true
	let g:terminal.term.bufferid = bufnr('')
endfunction

" ====== Call Windows"
""""""""""""""""""""""
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

" ====== DENITE setup"
""""""""""""""""""""""""
" Wrap in try/catch to avoid errors on initial install before plugin is available
try
" === Denite setup ==="
" Use ripgrep for searching current directory for files
" By default, ripgrep will respect rules in .gitignore
"   --files: Print each file that would be searched (but don't search)
"   --glob:  Include or exclues files for searching that match the given glob
"            (aka ignore .git files)
"
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'split': 'floating',
\ 'start_mappingfilter': 1,
\ 'auto_resize': 1,
\ 'source_names': 'short',
\ 'prompt': 'λ ',
\ 'statusline': 0,
\ 'highlight_matched_char': 'QuickFixLine',
\ 'highlight_matched_range': 'Visual',
\ 'highlight_window_background': 'Visual',
\ 'highlight_filter_background': 'DiffAdd',
\ 'winrow': 1,
\ 'vertical_preview': 1
\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)
catch
  echo 'Denite not installed. It should work after running :PlugInstall'
endtry

" ====== COC mapping"
"""""""""""""""""""""

" ====== Using CocList"
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

" " Use `:Format` to format current buffer
" command! -nargs=0 Format :call CocAction('format')

" " Use `:Fold` to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" " use `:OR` for organize import of current buffer
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" " Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" NERDTree
map <silent> <C-n> :NERDTreeFind<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" ============= CONFIGURATIONS =================="
""""""""""""""""""""""""""""""""""""""""""""""""""

" ====== GENERAL"
"""""""""""""""""
" gutocmd Filetype tex setl updatetime=1 " constantly save to see the PDF generated when Uses LaTeX
let g:livepreview_previewer = 'open -a Preview' " Set pdfViewer as default pdf viewer (OSX)

" ====== TERMINAL"
""""""""""""""""""
augroup custom_term
  autocmd!
  autocmd TermOpen * setlocal bufhidden=hide
augroup END

" ====== JAVASCRIPT CONFIGURATIONS (PLUGINS)"
"""""""""""""""""""""""""""""""""""""""""""""
let g:jsx_ext_requires = 0
let g:vim_jsx_pretty_colorful_config = 1
let g:javascript_plugin_flow = 1
let g:used_javascripts_libs = 'underscore'

" ====== NerdTree"
""""""""""""""""""
let g:NERDTreeQuitOnOpen=1

" ====== Linter Options"
""""""""""""""""""""""""
let g:ale_linters = {
\   'javascript': ['standard'],
\}
let g:ale_fixers = {'javascript': ['standard']}
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

set encoding=utf-8
" Enable true color 启用终端24位色
" if exists('+termguicolors')
"   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"   set termguicolors
" endif
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Find files ctrlp"
"""""""""""""""""""
" exclude folders in gitIgnore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_show_hidden = 1

" Turn off highlight match on press enter
nnoremap <CR> :noh<CR><CR>

" Search case sensitive only when use Capitals letters to find
:set ignorecase
:set smartcase

"show line number and relative line number
set number relativenumber
set nu rnu
" set nu number
" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
" augroup END

" Indent using spaces instead of tabs
set expandtab

" Dont wrap lines
set nowrap

" The number of spaces to use for each indent
set shiftwidth=2

" Number of spaces to use for a <Tab> during editing operations
set softtabstop=2

" Add this option to avoid issues with webpack
" :set backupcopy=yes

" ==== coc configuations ===="
""""""""""""""""""""""""""""""
" coc.nvim color changes
hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

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

" NERDTree CONFIGURATIONS"
""""""""""""""""""""""""""
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

iabbrev ddate <C-R>=strftime("%Y-%m-%d")<CR>

" xcodeSettings colorscheme
let g:xcodedark_green_comments = 0
let g:xcodedark_emph_types = 1
let g:xcodedark_emph_funcs = 0
let g:xcodedark_emph_idents = 0
colorscheme xcodedark
