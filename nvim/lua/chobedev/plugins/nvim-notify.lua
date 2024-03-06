local notify_setup, notify = pcall(require, "notify")
if not notify_setup then
  return
end

notify.setup({
  background_colour = "#000000",
  timeout = 3000,
  render = 'compact'
  
})
