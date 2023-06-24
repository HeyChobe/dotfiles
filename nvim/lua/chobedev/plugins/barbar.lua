local status, barbar = pcall(require, "bufferline")
if not status then
  return
end

barbar.setup({
  maximum_padding = 1,
  minimum_padding = 0
})
