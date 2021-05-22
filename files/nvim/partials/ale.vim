" Ale
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

let g:ale_fix_on_save = 1
let g:ale_completion_autoimport = 1
let g:ale_set_balloons = 1
let g:ale_floating_preview = 1
let g:ale_ruby_sorbet_options = '--no-config --enable-all-experimental-lsp-features --dir=./'
let g:ale_ruby_rubocop_executable = 'bundle'

let g:ale_linters_explicit = 1
let g:ale_linters = {}
let g:ale_linters.vim = ['vimls']
let g:ale_linters.help = ['vimls']
" let g:ale_linters={
" \   'python': ['pylint', 'pycodestyle'],
" \   'javascript': ['eslint'],
" \   'typescript': ['eslint', 'tslint', 'tsserver'],
" \   'typescriptreact': ['eslint', 'tslint', 'tsserver'],
" \   'html': ['eslint'],
" \   'go': ['gofmt', 'staticcheck', 'gobuild', 'gometalinter', 'gosimple', 'golangserver'],
" \   'ruby': ['rubocop', 'srb'],
" \   'graphql': ['eslint'],
" \   'rust': ['cargo', 'rustc', 'rls', 'analyzer'],
" \   'proto': ['protoc-gen-lint'],
" \   'css': ['stylelint'],
" \   'vim': ['vimls'],
" \}

let g:ale_fixers = {}
let g:ale_fixers['*'] = ['remove_trailing_lines', 'trim_whitespace']
" let g:ale_fixers={
" \   '*': ,
" \   'javascript': ['prettier', 'importjs'],
" \   'typescript': ['prettier', 'importjs', 'tslint'],
" \   'typescriptreact': ['prettier', 'importjs', 'tslint'],
" \   'html': ['prettier'],
" \   'css': ['prettier'],
" \   'scss': ['prettier'],
" \   'ruby': ['rubocop'],
" \   'rust': ['rustfmt'],
" \}

" Mappings ->>1
nnoremap <silent> ad :ALEGoToDefinition<CR>
nnoremap <silent> ar :ALERename<CR>
nnoremap <silent> <leader>ai :ALEInfo
