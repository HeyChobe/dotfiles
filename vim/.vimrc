set nocompatible
set number
set laststatus=2
syntax enable
set showcmd
set mouse=a
set encoding=UTF-8
set showmatch
set relativenumber
set ruler
set sw=2
set colorcolumn=81
set autoindent
set backspace=indent,eol,start
set updatetime=100
let mapleader = " "

call plug#begin()

"Themes
Plug 'mangeshrex/everblush.vim'
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'NLKNguyen/papercolor-theme'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/edge'
Plug 'sainnhe/everforest'
Plug 'pacokwon/onedarkhc.vim'
Plug 'rakr/vim-one'

"IDE
Plug 'vim-airline/vim-airline' "Line tool for code
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
"Plug 'ryanoasis/vim-devicons'

"Syntaxis
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot' "Recommendations for some lenguages
Plug 'tpope/vim-surround' "Complete and chage chars envolve word ysiw<char>, cs<prev><next>, ds<char>
Plug 'dense-analysis/ale' "Linting supports EsLint and Prettier
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary' "gcc for comment code
Plug 'yggdroot/indentline'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'

"Add ons
Plug 'mhinz/vim-signify', { 'branch': 'legacy' } "Indicate changes for git users
Plug 'diepm/vim-rest-console' "REST client for vim

call plug#end()

"Theme Configurations
if has('termguicolors')
	set termguicolors
endif

set background=dark

let g:everforest_background = 'soft'
let g:everforest_better_performance = 1
let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_better_performance = 1
" let g:edge_style = 'aura'
let g:edge_better_performance = 1
colorscheme one

"Airline Configurations
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme ='onedark' "Estaba deus
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_minimalist_showmod = 1

"NERDTree Configurations
let NERDTreeQuitOnOpen=1
nnoremap <leader>n :NERDTreeToggle<CR>

"Ale Configurations
let g:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_fix_on_save = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"Indent Configurations
let g:indentLine_enabled = 1
let g:rbpt_max = 16
let g:rbpt_loadcmd_toogle = 0

"Emmet Configurations
let g:user_emmet_mode = 'n'
let g:user_emmet_leader_key = ','
let g:user_emmet_settings = {
\  'variables': {'lang': 'ja'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<title></title>\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\  'javascript' :{
\       'extends' : 'jsx'
\  }
\}

"Key bindings
nnoremap <leader>h :bprevious<CR>
nnoremap <leader><Tab> :bnext<CR>
nnoremap <leader>d :bdelete<CR>
nnoremap <leader>q :q! <CR>
nnoremap <leader>Q :qa! <CR>
nnoremap <leader>w :w <CR>
nnoremap <leader>W :wq <CR>
nnoremap <leader>f :Files <CR>
