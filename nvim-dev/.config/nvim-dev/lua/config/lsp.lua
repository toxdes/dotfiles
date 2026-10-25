-- toggle diagnostics
-- style
local diagnostic_virtual_text = {
  spacing = 2,
  source = "if_many",
  prefix = "■",
  severity = { min = vim.diagnostic.severity.HINT },
}
vim.diagnostic.config({
  virtual_text = diagnostic_virtual_text,
  severity_sort = true,
})

-- Toggle inline diagnostics (<leader>lt)
local virtual_text_enabled = true

vim.keymap.set("n", "<leader>lt", function()
  virtual_text_enabled = not virtual_text_enabled
  vim.diagnostic.config({
    virtual_text = virtual_text_enabled and diagnostic_virtual_text or false,
  })
  print("Inline diagnostics: " .. (virtual_text_enabled and "VISIBLE" or "HIDDEN"))
end, { desc = "Toggle inline virtual text" })

-- toggle all diagnostics 
local diagnostics_enabled = true

vim.keymap.set("n", "<leader>lT", function()
  diagnostics_enabled = not diagnostics_enabled
  vim.diagnostic.enable(diagnostics_enabled)
  print("Diagnostics: " .. (diagnostics_enabled and "ENABLED" or "DISABLED"))
end, { desc = "Toggle all diagnostics" })


-- lsp config for built-in vim.lsp.config
local capabilities = vim.tbl_deep_extend(
  "force",
  vim.lsp.protocol.make_client_capabilities(),
  require("cmp_nvim_lsp").default_capabilities()
)

local on_attach = function(_, bufnr)
  -- helper functions
  local nmap = function(keys, func, desc)
    vim.keymap.set("n", keys, func, { buffer = bufnr, remap = false, silent = true, desc = "lsp: " .. desc })
  end

  local jump_next = function()
    vim.diagnostic.jump({ count = 1, float = true })
  end

  local jump_prev = function() 
    vim.diagnostic.jump({ count = -1, float = true })
  end 


  nmap("<leader>lgd", vim.lsp.buf.definition, "Go to definition")
  nmap("<leader>lK", vim.lsp.buf.hover, "Hover docs")
  nmap("<leader>lgi", vim.lsp.buf.implementation, "Go to implementation")
  nmap("<leader>lgr", vim.lsp.buf.references, "References")
  nmap("<leader>lrn", vim.lsp.buf.rename, "Rename")
  nmap("<leader>lca", vim.lsp.buf.code_action, "Code action")
  nmap("<leader>lj", jump_next, "Next diagnostic")
  nmap("<leader>lk",  jump_prev, "Prev diagnostic")
  nmap("<leader>lf", vim.lsp.buf.format, "Format buffer")
  nmap("<leader>ld", '<cmd>Trouble diagnostics toggle<cr>', 'Diagnostics')
  nmap("<leader>lD", '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', 'Buffer Diagnostics')

  -- :Format command 
  vim.api.nvim_buf_create_user_command(bufnr, "Format", vim.lsp.buf.format, {})
end

-- golang
vim.lsp.config.gopls = {
  cmd = { "gopls" },
  filetypes = { "go" },
  capabilities = capabilities,
  on_attach = on_attach,
}
vim.lsp.enable("gopls")

-- rust
vim.lsp.config.rust_analyzer = {
  cmd = { "rustup", "run", "stable", "rust-analyzer" },
  filetypes = { "rust" },
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = true,
      check = { command = "clippy" },
      inlayHints = { enable = true },
    },
  },
}
vim.lsp.enable("rust_analyzer")


-- dart
vim.lsp.config.dartls = {
  cmd = { "dart", "language-server", "--protocol=lsp" },
  filetypes = { "dart" },
  capabilities = capabilities,
  on_attach = on_attach,
  init_options = {
    onlyAnalyzeProjectsWithOpenFiles = true,
    suggestFromUnimportedLibraries = true,
    closingLabels = true,
    flutterOutline = true,
  },
}
vim.lsp.enable("dartls")

-- typescript
vim.lsp.config.ts_ls = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
  capabilities = capabilities,
  on_attach = on_attach,
  init_options = {
    preferences = {
      includeInlayParameterNameHints = "all",
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayVariableTypeHintsWhenTypeMatchesName = false,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
    },
  },
}
vim.lsp.enable("ts_ls")


-- cpp
vim.lsp.config.clangd = {
  cmd = { "clangd", "--background-index" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  capabilities = capabilities,
  on_attach = on_attach,
}
vim.lsp.enable("clangd")

-- python3
vim.lsp.config.basedpyright = {
  cmd = { "basedpyright-langserver", "--stdio" },
  filetypes = { "python" },
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "strict" 
      },
      disableOrganizeImports = true,
    },
  },
  capabilities = capabilities,
  on_attach = on_attach,
}
vim.lsp.enable("basedpyright")

vim.lsp.config.ruff = {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  capabilities = capabilities,
  on_attach = on_attach,
}
vim.lsp.enable("ruff")



