" == EMMET
let g:user_emmet_mode='a'       "enable all function in all mode.

" === COC COMPLETE
let g:coc_global_extensions=['coc-css', 'coc-emmet', 'coc-tsserver', 'coc-snippets']
let g:coc_snippet_next = '<tab>'

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

" +=== LIMELIGHT
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" +=== Fuzzy Search
let g:fzf_layout = { 'window':{ 'width': 0.9, 'height': 0.9 }}
let $FZF_DEFAULT_OPTS='--reverse'
