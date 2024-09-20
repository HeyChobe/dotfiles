local status, vim_visual_multi = pcall(require, "vim_visual_multi")
if not status then
  return
end
 
vim_visual_multi.setup({})
