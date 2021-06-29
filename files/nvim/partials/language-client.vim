" LanguageClient-neovim
set runtimepath+=$HOME/.local/share/nvim/site/pack/plugins/start/LanguageClient-neovim
set hidden

let enabledFileTypes = 'cpp,c,ruby,yaml,yaml.ansible,javascript,typescript,typescriptreact,javascript.jsx,sorbet,vim,help'

" bindings ->>1
function  LanguageClientMappers()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nmap <F5> <Plug>(lcn-menu)
    nmap <silent> <F4> <Plug>(lcn-definition)
    nmap <silent> <F3> <Plug>(lcn-rename)
    nmap <silent> gd <Plug>(lcn-definition)
    nmap <leader>lr :call LanguageClient#textDocument_rename()<CR>
    nmap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
    nmap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
    nmap <leader>lx :call LanguageClient#textDocument_references()<CR>
    nmap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
    nmap <leader>lc :call LanguageClient#textDocument_completion()<CR>
    nmap <leader>lh :call LanguageClient#textDocument_hover()<CR>
    nmap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
    nmap <leader>lm :call LanguageClient_contextMenu()<CR>
  endif
endfunction

augroup LSPMappings
  autocmd!
  autocmd FileType * call LanguageClientMappers()
augroup END

let g:LanguageClient_loggingFile = '/tmp/lsp.log'
let g:LanguageClient_waitOutputFTimeout = 120
let g:LanguageClient_autoStop = 0
let g:LanguageClient_serverCommands = {}
let g:LanguageClient_serverCommands.yaml = ['npx', 'yaml-language-server', '--stdio']
let g:LanguageClient_serverCommands['yaml.ansible'] = ['npx', 'yaml-language-server', '--stdio']
let g:LanguageClient_serverCommands.ruby = ['srb', 'tc', '--lsp', '--disable-watchman']
let g:LanguageClient_serverCommands.javascript = ['npx', 'typescript-language-server', '--stdio']
let g:LanguageClient_serverCommands['javascript.jsx'] = ['npx', 'typescript-language-server', '--stdio']
let g:LanguageClient_serverCommands.typescript = ['npx', 'typescript-language-server', '--stdio']
let g:LanguageClient_serverCommands.typescriptreact = ['npx', 'typescript-language-server', '--stdio']
let g:LanguageClient_serverCommands.rust = ['rustup', 'run', 'stable', 'rls']
let g:LanguageClient_serverCommands.vim = ['npx', 'vim-language-server', '--stdio']
let g:LanguageClient_serverCommands.help = ['npx', 'vim-language-server', '--stdio']

let lspsettings = json_decode('
\{
\    "yaml": {
\        "completion": true,
\        "hover": true,
\        "validate": true,
\        "schemas": {
\            "Kubernetes": "/*"
\        }
\    },
\    "yaml.ansible": {
\        "completion": true,
\        "hover": true,
\        "validate": true
\    },
\    "vim": {
\        "completion": true,
\        "hover": true,
\        "validate": true
\    },
\    "help": {
\        "completion": true,
\        "hover": true,
\        "validate": true
\    },
\    "http": {
\        "proxyStrictSSL": true
\    },
\    "ruby": {
\        "completion": true,
\        "hover": true,
\        "validate": true,
\        "typecheck": true
\    },
\    "sorbet": {
\        "completion": true,
\        "hover": true,
\        "validate": true,
\        "typecheck": true
\    },
\   "javascript": {
\        "completion": true,
\        "hover": true,
\        "validate": true
\    },
\   "typescript": {
\        "completion": true,
\        "hover": true,
\        "validate": true
\    },
\   "javascript.jsx": {
\        "completion": true,
\        "hover": true,
\        "validate": true
\    },
\   "typescriptreact": {
\        "completion": true,
\        "hover": true,
\        "validate": true
\    }
\}')

function InitializeLSP()
  set signcolumn=yes

  let g:LanguageClient_rootMarkers = {
  \   'javascript': ['jsconfig.json',  'package.json'],
  \   'typescript': ['tsconfig.json', 'package.json'],
  \   'javascript.jsx': ['jsconfig.json', 'package.json'],
  \   'typescriptreact': ['tsconfig.json', 'package.json'],
  \   'vim': ['.git', 'autoload', 'plugin'],
  \   'ruby': ['Gemfile', 'package.yml']
  \ }
  autocmd User LanguageClientStarted call LanguageClient#Notify(
    \ 'workspace/didChangeConfiguration', {'settings': lspsettings})
endfunction()

augroup LSP
  autocmd!
  autocmd FileType enabledFileTypes call InitializeLSP()
augroup END
