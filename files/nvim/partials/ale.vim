" Ale
" Mappings ->>1
nnoremap <silent> ad :ALEGoToDefinition<CR>
nnoremap <silent> ar :ALERename<CR>
nnoremap <silent> <leader>ai :ALEInfo<CR>

" Options ->>1
set completeopt=menu,menuone,noselect,noinsert
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1
let g:ale_completion_autoimport = 1
let g:ale_set_balloons = 1
let g:ale_floating_preview = 1
let g:ale_ruby_rubocop_executable = 'bundle'

" Linters ->>1
let g:ale_linters_explicit = 1
let g:ale_linters = {}

let g:ale_linters.javascript = ['eslint']
let g:ale_linters['javascript.jsx'] = ['eslint']
let g:ale_linters.typescript = ['eslint', 'tslint']
let g:ale_linters.typescriptreact = ['eslint', 'tslint']

let g:ale_linters.html = ['stylelint', 'htmlhint']
let g:ale_linters.css = ['stylelint']
let g:ale_linters.scss = ['scsslint']

let g:ale_linters.graphql = ['eslint']

let g:ale_linters.ruby = ['rubocop', 'brakeman', 'rails_best_practices']

" let g:ale_linters={
" \   'python': ['pylint', 'pycodestyle'],
" \   'go': ['gofmt', 'staticcheck', 'gobuild', 'gometalinter', 'gosimple', 'golangserver'],
" \   'rust': ['cargo', 'rustc', 'rls', 'analyzer'],
" \   'proto': ['protoc-gen-lint'],
" \}

" Fixers ->>1
let g:ale_fixers = {}
let g:ale_fixers['*'] = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers.javascript = ['prettier', 'importjs', 'tslint']
let g:ale_fixers.javascript.jsx = ['prettier', 'importjs', 'tslint']
let g:ale_fixers.typescript = ['prettier', 'importjs', 'tslint']
let g:ale_fixers.typescriptreact = ['prettier', 'importjs', 'tslint']
let g:ale_fixers.html = ['prettier']
let g:ale_fixers.css = ['prettier']
let g:ale_fixers.scss = ['prettier']
let g:ale_fixers.ruby = ['rubocop']
let g:ale_fixers.rust = ['rustfmt']
