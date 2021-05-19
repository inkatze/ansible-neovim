" Section: Plugins ->> 1
"--------------------------------------------------------------------------
runtime! partials/vim-plug.vim

" Section: Vim options ->>1
"--------------------------------------------------------------------------
runtime! partials/editor.vim

" Section: Plugin settings ->>1
"--------------------------------------------------------------------------
runtime! partials/defx.vim " File explorer
runtime! partials/indentline.vim " shows indentation guides
runtime! partials/signify.vim " in-editor git updates signs
runtime! partials/lightline.vim
runtime! partials/ale.vim
runtime! partials/emmet.vim " expans abbreviations
" runtime! partials/vim-go.vim
" runtime! partials/vim-rspec.vim
runtime! partials/deoplete.vim " autocompletion
" runtime! partials/language-client.vim
runtime! partials/echodoc.vim " shows signatures in status bar
runtime! partials/fzf.vim
runtime! partials/vista.vim
" runtime! partials/vim-rails.vim
runtime! partials/vim-projectionist.vim " project structure configuration
" runtime! partials/vim-import-js.vim

let g:rainbow_active = 1
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.md, *.jsx, *.html.erb, *.tsx'
" Plug 'easymotion/vim-easymotion'
" map <Leader>vm <Plug>(easymotion-prefix)
