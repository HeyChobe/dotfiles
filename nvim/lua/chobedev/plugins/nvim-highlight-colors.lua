local setup, nvim_highlight_colors = pcall(require, "nvim-highlight-colors")
if not setup then
  return
end

nvim_highlight_colors.setup({})
