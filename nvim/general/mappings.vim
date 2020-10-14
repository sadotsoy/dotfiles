" MAPPINGS FILE @sadotsoy

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
" == SEARCHING Fuzzy
map <leader>bf :Buffers<cr>
map <leader>fa :Ag<cr>
map <leader>fc :Colors<cr>
map <leader>fl :Lines<cr>
map <leader>fm :Marks<cr>
map <leader>fs :Snippets<cr>
map <leader>ma :Maps<cr>
map <leader>tg :TagbarToggle<cr>
map <leader>wl :Windows<cr>
" fzf file fuzzy search that respects .gitignore
" If in git directory, show only files that are committed, staged, or unstaged
" else use regular :Files
" CREDITS : https://rietta.com/blog/hide-gitignored-files-fzf-vim/
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
" nnoremap <expr> <C-p>:Files<cr>

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

" Snippets
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

" == emoji
nmap <leader>em :%s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g<CR>

" == GIT MAPPING
" CHECK :HELP GSTATUS FOR MORE KEYS
map <leader>bc :BCommits<cr>
map <leader>co :Commits<cr>
map <leader>ga :!git add %<cr>:Gcommit<cr>
map <leader>gb :Gblame<cr>
map <leader>gc :GCheckout<cr>
map <leader>gd :Gdiffsplit<cr>
map <leader>ge :GitMessenger<cr>
map <leader>gf :GitFiles?<cr>
map <leader>gm :Gcommit<cr>
map <leader>gp :Gpush<cr>
map <leader>gs :G<cr>
map <leader>gv :GV<CR>
map <leader>gw :Gwrite<cr>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
" ++ gitmoji
nnoremap <Leader>mo i<C-X><C-U><BS><BS><BS><BS><BS><BS><BS><BS>


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

" == Colors
map <leader>hco :ColorToggle<CR>
map <leader>sco :ColorSwapFgBg<CR>

" == Lists
" += see the syn(TAX) list
map <leader>sli :syn list<CR>
