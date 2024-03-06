local setup, lsp_toggle = pcall(require, "lsp-toggle")
if not setup then
  return
end

lsp_toggle.setup() 
