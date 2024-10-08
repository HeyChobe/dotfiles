local opt = vim.opt -- for conciseness

-- notifications
vim.notify = require("notify")

-- line numbers
opt.relativenumber = true
opt.number = true

-- language options
opt.spelllang = en,es

-- tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = true 

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line 
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

--fold
opt.foldmethod = "expr"
opt.foldexpr = "v:lnum == 1 ? '0' : getline(v:lnum) =~? '\\v[{[]' ? 'a1' : getline(v:lnum) =~? '\\v[}\\]]' ? 's1' : '='"
opt.foldlevel = 99
