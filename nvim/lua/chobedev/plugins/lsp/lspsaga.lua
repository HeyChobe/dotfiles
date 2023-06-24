local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  return
end

local saga_highlight_status, highlight = pcall(require, "lspsaga.highlight")
if not saga_highlight_status then
  return
end

saga.setup({
  -- keybinds for navigation in lspsaga window
    scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
    definition = {
      edit = "<CR>",
    },
    ui = {
      border = "rounded"
    }
})

