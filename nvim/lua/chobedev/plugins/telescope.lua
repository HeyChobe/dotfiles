local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return 
end

telescope.load_extension('media_files')

telescope.register_extension({
  setup = function(ext_config)
    filetypes = ext_config.filetypes or {"png", "jpg", "mp4", "webm", "pdf"}
    find_cmd = ext_config.find_cmd or "rg"
  end,
  -- exports = {
    -- media_files = M.media_files
  -- },
})

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      }
    }
  },
  extensions = {
    media_files = {
      find_cmd = "rg"
    }
  }
})

