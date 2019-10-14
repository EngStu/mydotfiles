call plug#begin('~/.vim/plugged')

" Plug 'scrooloose/nerdtree', { 'on': 'NERDTReeToggle' }
Plug 'mxw/vim-jsx' " Based on this >>> https://drivy.engineering/setting-up-vim-for-react/
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-surround' " https://github.com/tpope/vim-surround
Plug 'tpope/vim-repeat'
Plug 'https://github.com/adelarsq/vim-matchit'
Plug 'MarcWeber/vim-addon-mw-utils' " Snipmate >>> https://github.com/garbas/vim-snipmate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim' " fuzzy search
Plug 'sheerun/vim-polyglot'


call plug#end()

""""""""""
" Settings 
syntax on
colorscheme onedark

" Font settings
set guifont=Monaco:h13
set linespace=2

set number relativenumber " display line numbers

" set cursorcolumn " display vertical cursor line
" set cursorline " display horizontal cursor line

" More natural split direction
set splitright

" Disable scrolls
set guioptions=

" Needed by nerdcommenter
filetype plugin on

" emmmet
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" ale
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

" asyncrun
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

" NERDTree
let NERDTreeShowHidden=1  "  Always show dot files
let NERDTreeQuitOnOpen=1
map  <Leader>n  :NERDTreeFind<CR>
map <F2> :NERDTreeToggle<CR>


""""""""""""""""
" Key bindings
" autocmd VimEnter * PlugInstall
map <F3> :PlugInstall<CR> 
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Fuzzy search (FZF)
" macmenu File.Print key=<nop>
map <Leader>p :FZF<CR>
map <A-p> :FZF<CR>
map <D-p> :FZF<CR>

