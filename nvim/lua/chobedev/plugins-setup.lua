local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if pacher was just installed

-- Autocommand thtat reloads neovim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  -- Packer itself
  use('wbthomason/packer.nvim')

  -- Themes
  -- use('bluz71/vim-nightfly-guicolors')
  use('sainnhe/gruvbox-material')
  -- use('folke/tokyonight.nvim')
  -- use { "catppuccin/nvim", as = "catppuccin" }
  -- use('sainnhe/everforest')
  -- use("rebelot/kanagawa.nvim")
  -- use('morhetz/gruvbox')
  
  -- Navigation
  use('christoomey/vim-tmux-navigator') -- allows to use Ctrl + hjkl to move between windows
  use('szw/vim-maximizer') -- maximizes and restores current window
  use {"romgrk/barbar.nvim", requires = "nvim-tree/nvim-web-devicons"} -- tabs management
    
  -- Syntaxis
  use('tpope/vim-surround') -- allows to involve a word with a char
  use('tpope/vim-commentary') --gcc for comment code
  use('norcalli/nvim-colorizer.lua') -- color demostration for css 
  use('lukas-reineke/indent-blankline.nvim') -- indentLine

  -- File Explorer
  use('nvim-tree/nvim-tree.lua') -- file explorer on the left
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Image Preview
  use { 'nvim-lua/popup.nvim'}
  use { 'nvim-lua/plenary.nvim' } 
  use { 'nvim-telescope/telescope-media-files.nvim' }


  -- Status Line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- Autocompletion
  use("hrsh7th/nvim-cmp") -- for lua
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")

  -- Snippets
  use("L3MON4D3/LuaSnip") -- for lua
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets") -- snippets for serveral lenguages

  -- Management and installing lsp servers
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion

 -- Enhanced lsp uis
  use ({
    'nvimdev/lspsaga.nvim',
    after = 'nvim-lspconfig',
    config = function()
        require('lspsaga').setup({})
    end,
  })

  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  -- Configuring lsp servers
  use("neovim/nvim-lspconfig")

  -- Formatting and linting
  use("jose-elias-alvarez/null-ls.nvim")
  use("jayp0521/mason-null-ls.nvim")
  use('MunifTanjim/prettier.nvim')
  use { 'adoyle-h/lsp-toggle.nvim' }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
     
  -- AutoClosing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- Git Integration
  use('lewis6991/gitsigns.nvim') -- colorful useful indications
  use("tpope/vim-fugitive")

  -- Background transparent
  use("xiyaowong/nvim-transparent")

  -- Rest Visualizer
  use{
    'rest-nvim/rest.nvim',
    requires = {"nvim-lua/plenary.nvim"}
  }

  -- Taiwind Sorter
  use {
    'laytan/tailwind-sorter.nvim',
    requires = {'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim'},
    config = function() require('tailwind-sorter').setup() end,
    run = 'cd formatter && npm i && npm run build',
  }

  -- Notifications
  use 'rcarriga/nvim-notify'

  -- TODO Highlights
  use {
    "folke/todo-comments.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  }

  if packer_bootstrap then 
    require("packer").sync()
  end
end)

