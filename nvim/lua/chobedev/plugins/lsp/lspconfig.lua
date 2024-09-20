local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
  return
end

local keymap = vim.keymap 

local on_attach = function(client, bufnr)

  -- keyboard options
  local options = {noremap = true, silent = true, buffer = bufnr}

  -- set keybinds
   keymap.set("n", "gf", "<CMD>Lspsaga finder<CR>", opts) -- show definition, references
   keymap.set("n", "gd", "<CMD>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
   keymap.set("n", "gi", "<CMD>Lspsaga goto_definition<CR>", opts) -- go to implementation
   keymap.set("n", "<leader>ca", "<CMD>Lspsaga code_action<CR>", opts) -- see available code actions
   keymap.set("n", "<leader>rn", "<CMD>Lspsaga rename<CR>", opts) -- smart rename
   keymap.set("n", "<leader>D", "<CMD>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
   keymap.set("n", "[d", "<CMD>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
   keymap.set("n", "]d", "<CMD>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
   keymap.set("n", "K", "<CMD>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
   keymap.set("n", "<leader>o", "<CMD>LSoutlineToggle<CR>", opts) -- see outline on right hand side

  -- typescript specific keymaps
  if client.name == "tsserver" then
    keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
    keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
    keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
  end
end


-- used to enable autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

-- configure html server
lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure css server
lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configre tsserver
lspconfig["tsserver"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
})

-- configre ccls 
lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["pyright"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["tailwindcss"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["angularls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure typescript using custom plugin
typescript.setup({
    server = {
      capabilities = capabilities,
      on_attach = on_attach,
    },
})



