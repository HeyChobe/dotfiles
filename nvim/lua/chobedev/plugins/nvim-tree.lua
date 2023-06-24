local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end


vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true -- set termguicolors to enable highlight groups

nvimtree.setup({
  actions = {
    open_file = {
      quit_on_open = true
    }
  },
  renderer = {
    icons = {
      git_placement = "after"
    }
  }
})
