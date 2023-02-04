set number
set laststatus=2
set mouse=a
syntax enable
set showcmd
set encoding=UTF-8
set showmatch
set relativenumber
set sw=2 "2 espacios en los tabs
set cursorline "Resaltar línea acutal
set colorcolumn=120
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set ignorecase "Ignorar mayúsculas en una búsqueda
set smartcase "No ignorar mayúsuculas si en la búsqueda existe la mayúscula
set spelllang=en,es "Corregir palabras usando diccionarios en inglés y español
set termguicolors "Activa true colors en la terminal
set background=dark
set clipboard+=unnamedplus

let mapleader=" "
call plug#begin()

"Themes
Plug 'romgrk/doom-one.vim'
Plug 'pacokwon/onedarkhc.vim'
Plug 'rakr/vim-one'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'

"IDE
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0'  }
Plug 'mhinz/vim-signify', { 'branch': 'legacy'  } "Indicate changes for git users"
Plug 'sainnhe/edge'
Plug 'tpope/vim-fugitive' "Git

"Syntaxis
Plug 'tpope/vim-commentary' "gcc for comment code
Plug 'yggdroot/indentline'
Plug 'tpope/vim-surround' "Agrega caracteres al rededor de palabras
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production'  }
Plug 'eslint/eslint' 
Plug 'elzr/vim-json'
Plug 'maksimr/vim-jsbeautify'

"LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp' "Autocompletion plugin
Plug 'hrsh7th/cmp-nvim-lsp' "LSP source for nvim-cmp
Plug 'saadparwaiz1/cmp_luasnip' "Snippets source for nvim-cmp
Plug 'L3MON4D3/LuaSnip' "Snippets plugin
" Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'folke/trouble.nvim'

"HTML
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'valloric/matchtagalways' "Highligths tags

"REST calls
Plug 'diepm/vim-rest-console'

call plug#end()

" let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_better_performance = 1

colorscheme gruvbox-material "one

"VCR configuration
let g:vrc_output_buffer_name = '__VRC_OUTPUT.json'
let g:vrc_auto_format_response_patterns = {
      \ 'json': 'python3 -m json.tool',
      \ 'xml': 'xmllint --format -',
    \}

"Prettier configuration
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

"Airline Configurations
let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme ='bubblegum' "onedark
let g:airline_theme='gruvbox_material'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_minimalist_showmod = 1

"NERDTree Configurations
let NERDTreeQuitOnOpen=1

" Key bindings
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>h :bprevious<CR>
nnoremap <leader><Tab> :bnext<CR>
nnoremap <leader>d :bdelete<CR>
nnoremap <leader>q :q! <CR>
nnoremap <leader>Q :qa! <CR>
nnoremap <leader>w :w <CR>
nnoremap <leader>W :wq <CR>
" nnoremap <leader>f :Files <CR>

" Vim Fugitive
nnoremap <leader>g :Git <CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" JsBeautify
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>"

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified
" files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified
" files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>`
" will be closed while `<link>` won't.)

let g:closetag_emptyTags_caseSensitive = 1

" Disables auto-close if not in a "valid" region (based on filetype)

let g:closetag_regions = {
\ 'typescript.tsx': 'jsxRegion,tsxRegion',
\ 'javascript.jsx': 'jsxRegion',
\ 'typescriptreact': 'jsxRegion,tsxRegion',
\ 'javascriptreact': 'jsxRegion',
\ }

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current
" tag, default is ''
let g:closetag_close_shortcut = '<leader>>'


lua <<EOF

require("catppuccin").setup()

require("trouble").setup {
      -- your configuration comes here
          -- or leave it empty to use the default settings
              -- refer to the configuration section below
                
  }

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'tsserver','html','cssls' }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {

		    -- on_attach = my_custom_on_att'ach,
				    capabilities = capabilities,
						  
		}
	end

	-- luasnip setup
	local luasnip = require 'luasnip'

	-- nvim-cmp setup
	local cmp = require 'cmp'
	cmp.setup {
		snippet = {
			    expand = function(args)
					      luasnip.lsp_expand(args.body)
								    end,
										  
			},
		mapping = cmp.mapping.preset.insert({
		    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
				    ['<C-f>'] = cmp.mapping.scroll_docs(4),
						    ['<C-Space>'] = cmp.mapping.complete(),
								['<CR>'] = cmp.mapping.confirm {
									      behavior = cmp.ConfirmBehavior.Replace,
												      select = true,
															    
									},
								    ['<Tab>'] = cmp.mapping(function(fallback)
										      if cmp.visible() then
														        cmp.select_next_item()
																		      elseif luasnip.expand_or_jumpable() then
																						        luasnip.expand_or_jump()
																										      else
																														        fallback()
																																		      end
																																					    end, { 'i', 's'  }),
																																							    ['<S-Tab>'] = cmp.mapping(function(fallback)
																																									      if cmp.visible() then
																																													        cmp.select_prev_item()
																																																	      elseif luasnip.jumpable(-1) then
																																																					        luasnip.jump(-1)
																																																									      else
																																																													        fallback()
																																																																	      end
																																																																				    end, { 'i', 's'  }),
																																																																						  
		}),
	sources = {
		    { name = 'nvim_lsp'  },
				    { name = 'luasnip'  },
						  
		},
	
		}

EOF
