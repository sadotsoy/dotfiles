" PLUGINS FILE @sadotsoy
"
" =================
" == PLUGINS ======
" == auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

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

" === SEARCHING
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

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
"

" == END Plug
call plug#end()
