set number
set laststatus=2
set mouse=a
syntax enable
set showcmd
set encoding=UTF-8
set showmatch
set relativenumber
set sw=2
set colorcolumn=81

let mapleader = " "

call plug#begin('~/.vim/plugged')

"Themes
Plug 'NLKNguyen/papercolor-theme'
Plug 'mangeshrex/everblush.vim'

"Syntaxis
Plug 'chun-yang/auto-pairs' "complete parentesys, keys, etc
Plug 'tpope/vim-surround' "change word limits char with another char or words
Plug 'tpope/vim-commentary' "gcc for commentary

"IDE
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'itchyny/lightline.vim' "line tool for code
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'yggdroot/indentline' "indentline
Plug 'neoclide/coc.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"JAVASCRIPT
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mlaursen/vim-react-snippets'

"LSP
Plug 'neovim/nvim-lspconfig'

call plug#end()

colorscheme everblush

"NERDTree Configurations
let NERDTreeQuitOnOpen=1
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <leader>f :Ag<CR>

"INDENT Configurations
let g:indentLine_enabled = 1

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

"Snippet Configurations
let g:UtilSnipsExpandTrigger= '<tab>'

"Emmet Configurations
let g:user_emmet_mode= 'n'
let g:user_emmet_leader_key= ','
let g:user_emmet_settings= {
    'javascript' : {
      'extends' : 'jsx'
    }
}

"LSP Configurations
lua <<EOF

local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
    }, {
      { name = 'buffer' },
    })
  })

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

require'lspconfig'.tsserver.setup{ 
  capabilities = capabilities,
  flags = lsp_flags,
}

require'lspconfig'.html.setup {
  capabilities = capabilities,
  flags = lsp_flags,
}

require'lspconfig'.cssls.setup {
  capabilities = capabilities,
  flags = lsp_flags,
}

require'lspconfig'.ccls.setup{
  capabilities = capabilities,
  flags = lsp_flags
  }

EOF

