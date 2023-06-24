vim.g.mapleader = " "

local keymap = vim.keymap

-- General Keymaps

keymap.set("n", "<leader>nh", ":nohl<CR>") -- delete highlight

keymap.set("n", "x", '"_x') -- delete char whitout copy

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontallu
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>w", ":w<CR>") -- save file
keymap.set("n", "<leader>W", ":wq<CR>") -- save file and quit
keymap.set("n", "<leader>q", ":q<CR>") -- quit

-- Plugin Keymaps

keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- maximize split windows and toggle it

keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>") -- nvim-tree

keymap.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>") -- telescope
keymap.set("n", "<leader>fg", "<CMD>Telescope live_grep<CR>")
keymap.set("n", "<leader>fs", "<CMD>Telescope grep_string<CR>")
keymap.set("n", "<leader>fb", "<CMD>Telescope buffers<CR>")
keymap.set("n", "<leader>fh", "<CMD>Telescope help_tags<CR>")
keymap.set("n", "<leader>fm", "<CMD>Telescope media_files<CR>")

keymap.set("n", "<leader>tt", "<Plug>RestNvim<CR>") -- rest.nvim

local opts = { noremap = true, silent = true }
keymap.set('n', '<leader>,', '<CMD>BufferPrevious<CR>', opts) -- Tab previus
keymap.set('n', '<leader>.', '<CMD>BufferNext<CR>', opts) -- Tab next
keymap.set('n', '<leader><', '<CMD>BufferMovePrevious<CR>', opts) -- Move to previous
keymap.set('n', '<leader>>', '<CMD>BufferMoveNext<CR>', opts) -- Move to next
keymap.set("n", "<leader>d", "<CMD>BufferClose<CR>", opts) -- Close buffer
