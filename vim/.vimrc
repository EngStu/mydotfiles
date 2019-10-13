" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugin
" Based on this >>> https://drivy.engineering/setting-up-vim-for-react/
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

Plug 'w0rp/ale'
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

Plug 'skywind3000/asyncrun.vim'
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

" added plugin based on >>> https://www.vimfromscratch.com/articles/vim-for-javascript-and-react-in-2019/

" Plug 'scrooloose/nerdtree'
let NERDTreeShowHidden=1  "  Always show dot files
let NERDTreeQuitOnOpen=1
map  <Leader>n  :NERDTreeFind<CR>
map <F2> :NERDTreeToggle<CR>


" List ends here. Plugins become visible to Vim after this call.
call plug#end()
