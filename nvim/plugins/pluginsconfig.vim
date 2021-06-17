" == EMMET
let g:user_emmet_mode='a'       "enable all function in all mode.

" === COC COMPLETE
let g:coc_global_extensions=['coc-css', 'coc-emmet', 'coc-tsserver', 'coc-snippets', 'coc-json', 'coc-react-refactor']
let g:coc_snippet_next = '<tab>'

" == ALE && DEOPLITE LINTERS/COMPLETE
" Fix files with prettier, and then ESLint.
let g:ale_linters = {'javascript': ['eslint'], 'javascripreact': ['eslint'], 'typescript': ['eslint'], 'typescriptreact': ['eslint']}
let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'typescript': ['prettier', 'eslint'], 'typescriptreact': ['prettier', 'eslint'], 'css': ['prettier'], 'scss': ['prettier'], 'vim': ['prettier'], 'html': ['prettier'], 'json': ['prettier']}
let g:ale_fix_on_save = 1
let g:ale_javascript_eslint_use_local = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_set_highlights = 1
let g:ale_set_signs = 1
" let g:ale_sign_error = '•'
" let g:ale_sign_warning = '+'
let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'

" +=== LIMELIGHT
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" +=== TYPESCRIPT
let g:typescript_indent_disable = 1

" +=== Fuzzy Search
let g:fzf_layout = { 'window':{ 'width': 0.9, 'height': 0.9 }}
let $FZF_DEFAULT_OPTS='--reverse'

" +=== Guten tags
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root  = ['package.json', '.git', '.hg', '.svn']
let g:gutentags_cache_dir = expand('~/.gutentags_cache')
let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_extra_args = ['--tag-relative=yes', '--fields=+ailmnS']
let g:gutentags_ctags_exclude = [
\  '*.git', '*.svn', '*.hg',
\  'cache', 'build', 'dist', 'bin', 'node_modules', 'bower_components',
\  '*-lock.json',  '*.lock',
\  '*.min.*',
\  '*.bak',
\  '*.zip',
\  '*.pyc',
\  '*.class',
\  '*.sln',
\  '*.csproj', '*.csproj.user',
\  '*.tmp',
\  '*.cache',
\  '*.vscode',
\  '*.pdb',
\  '*.exe', '*.dll', '*.bin',
\  '*.mp3', '*.ogg', '*.flac',
\  '*.swp', '*.swo',
\  '.DS_Store', '*.plist',
\  '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png', '*.svg',
\  '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
\  '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx', '*.xls',
\]
