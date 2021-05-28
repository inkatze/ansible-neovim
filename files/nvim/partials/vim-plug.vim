call plug#begin(stdpath('data') . '/site')

" completion ->>1
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" 1-offs
Plug 'morhetz/gruvbox' " colorscheme
Plug 'jiangmiao/auto-pairs' " auto-close pairs
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag' " close html tags
Plug 'tpope/vim-commentary' " context aware line/block commenting
Plug 'luochen1990/rainbow' " colored parenthesis
Plug 'gregsexton/MatchTag' " highlight matching html tags
Plug 'tpope/vim-fugitive' " Git commands wrapper
Plug 'psliwka/vim-smoothie' " smooth scrolling
" Plug 'ncm2/float-preview.nvim'
" Plug 'easymotion/vim-easymotion'

" ungrouped ->> 2
Plug 'pearofducks/ansible-vim'
Plug 'dag/vim-fish'

" javascripts ->>2
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'Galooshi/vim-import-js'

" ruby ->>2
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise' " adds ending tokens for ruby
Plug 'tpope/vim-rails'
Plug 'thoughtbot/vim-rspec'
Plug 'etordera/deoplete-rails'
" Plug 'tpope/vim-rake'
" Plug 'tpope/vim-bundler'
" Plug 'tpope/vim-rbenv'

" golang ->>2
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make' }

" python ->>2
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " python highlighting
" Plug 'tmhedberg/SimpylFold' " python folding
" Plug 'deoplete-plugins/deoplete-jedi'

" rust ->>2
" Plug 'rust-lang/rust.vim'

" protobuf ->>2
" Plug 'uarun/vim-protobuf'

" editing / qol ->>1
Plug 'Yggdroot/indentLine' " shows indentation lines
Plug 'dense-analysis/ale'
Plug 'mattn/emmet-vim'
" Plug 'Shougo/echodoc'
" Plug 'tpope/vim-dispatch' " async task runner
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

" tmux
" Plug 'tmux-plugins/vim-tmux'
" Plug 'tmux-plugins/vim-tmux-focus-events'

" misc utils ->>1
Plug 'tpope/vim-projectionist'
" Plug 'kristijanhusak/vim-carbon-now-sh' " code screenshots
" Plug 'tpope/vim-eunuch' " common unix commands
" Plug '907th/vim-auto-save'

" git ->>1
Plug 'mhinz/vim-signify'

" browsing ->>1
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'
Plug 'liuchengxu/vista.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } | Plug 'junegunn/fzf.vim'

" status bars(s) ->>1
Plug 'itchyny/lightline.vim' | Plug 'mengelbrecht/lightline-bufferline'

" markdown-composer
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release --locked
    else
      !cargo build --release --locked --no-default-features --features json-rpc
    endif
  endif
endfunction
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

call plug#end()
