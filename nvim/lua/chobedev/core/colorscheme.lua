-- for gruvbox-material

vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_foreground = "material"
vim.g.gruvbox_material_enable_bold = 1

local status, theme = pcall(vim.cmd, "colorscheme gruvbox-material")

if not status then 
  print("Colorscheme not found!")
  return
end


