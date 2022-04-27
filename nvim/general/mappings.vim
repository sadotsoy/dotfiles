" MAPPINGS FILE @sadotsoy

" =================
" == MAPPINGS ======
"
"
" == WRITE || CLOSE
map <C-w>w :w<CR>
map <C-w>q :wq!<CR>
map <C-w>a :wqa!<CR>
nnoremap <leader>q :q!<CR>
"
" == RELOAD SOURCE
map <C-s>s :source $HOME/.config/nvim/init.vim<CR>
"
" == EDIT CONFIG FILE
map <leader>, :e $HOME/.config/nvim/init.vim<CR>

map <leader><Space>s :Vifm /Users/sadotsoy/dotfiles/nvim/<CR>

" == Sort
map <leader>so :sort<CR>

" === Sessions
" ALT + R to load the session
" ALT + S to save the session
nmap ß :mks! Session.vim<CR>
nmap ® :source Session.vim<CR>
"
" === Recovers
" noremap <leader>re :vnew | r #<CR>
"
" == SEE ONLY THIS FILE ON THE BUFFER, BEATIFUL FOR DOCUMENTATION
map <leader>o :only<cr>
"
" == FILE MANAGER
" VIFM
map <leader><Space>r :EditVifm .<CR>
map <leader><Space>e :Vifm<CR>
" nnoremap <C-e> :NERDTreeToggle<CR>
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

" == SEARCHING Fuzzy
nnoremap <C-o> :Buffers<cr>
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

" == VIM HELP
nmap <leader>he :vert h<Space>
nmap <leader>hw :<C-U>vert h<Space><C-R>=expand("<cword>")<CR>


" == ALE MAPPING
nmap <silent> [g <Plug>(ale_previous_wrap)
nmap <silent> ]g <Plug>(ale_next_wrap)

" == COC MAPPING
" Use `[g` and `]g` to navigate diagnostics
" Use `{g` and `}g` to navigate linter diagnostics
nmap <silent> {g <Plug>(coc-diagnostic-prev)
nmap <silent> }g <Plug>(coc-diagnostic-next)

" refactor
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nmap <leader>psw :CocSearch <C-R>=expand("<cword>")<CR><CR>/<C-r><C-w><CR>

" == RESIZE WINDOW
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" == emoji
nmap <leader>em :%s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g<CR>

" ++ gitmoji
nnoremap <Leader>mo i<C-X><C-U><BS><BS><BS><BS><BS><BS><BS><BS>

" == GIT MAPPING
" CHECK :HELP GSTATUS FOR MORE KEYS
map <leader>bc :BCommits<cr>
map <leader>co :Commits<cr>
map <leader>ga :!git add %<cr>:Git commit<cr>
map <leader>gb :Git blame<cr>
map <leader>gc :GCheckout<cr>
map <leader>gd :Gdiffsplit!<cr>
map <leader>ge :GitMessenger<cr>
map <leader>gf :GitFiles?<cr>
map <leader>gm :Git commit<cr>
map <leader>gp :Gpush<cr>
map <leader>gs :G<cr>
map <leader>gv :GV<CR>
map <leader>gw :Gwrite<cr>
map <leader>gl :Git log<CR>
map <leader>glg :Git log --oneline --graph<CR>
nmap <leader>g1 :diffget //3<CR>
nmap <leader>g2 :diffget //2<CR>

" == GOYO
map <leader><ENTER> :Goyo<cr>

" == SPELLING
map <leader>s :set spell<cr>
" === see list of alternatives
map <C-g>= z=
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

" +== Switch the window
" map <C-H> :windo wincmd H<CR>
" map <C-K> :windo wincmd K<CR>

" == SPLITS
nnoremap <silent> vv <C-w>v
nnoremap <silent> vs <C-w>s

" == Colors
map <leader>hco :ColorToggle<CR>
map <leader>sco :ColorSwapFgBg<CR>
" group syntax
noremap <C-t> :call CheckSynstack()<CR>
nnoremap <silent> <C-i> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-i>

" == Lists
" += see the syn(TAX) list
map <leader>sli :syn list<CR>

" == JSON
" += format json using jq command
map <leader>jq :%!jq<CR>

" == CLIPBOARD
nnoremap +p "+p
nnoremap +y "+y

" Notes
map <leader>nv :e $HOME/.config/nvim/docs/notes.md<CR>

" Date
map <leader>D :put =strftime('%a %b %d %Y')<CR>
