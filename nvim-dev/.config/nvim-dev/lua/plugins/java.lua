local function get_active_jdk()
  local java_home = vim.fn.getenv("JAVA_HOME")
  if java_home and vim.fn.isdirectory(java_home) == 1 then
    return java_home
  end

  local sdkman_current = vim.fn.expand("~/.sdkman/candidates/java/current")
  if vim.fn.isdirectory(sdkman_current) == 1 then
    return sdkman_current
  end

  local default_sdkman = vim.fn.expand("~/.sdkman/candidates/java")
  if vim.fn.isdirectory(default_sdkman) == 1 then
    local entries = vim.fn.readdir(default_sdkman)
    for _, entry in ipairs(entries) do
      local full = default_sdkman .. "/" .. entry
      if vim.fn.isdirectory(full) == 1 and entry ~= "current" then
        return full
      end
    end
  end

  local path_java = vim.fn.exepath("java")
  if path_java then
    return vim.fn.fnamemodify(path_java, ":h:h")
  end

  return nil
end

local function detect_java_version(java_home)
  if not java_home then return "21" end
  local ok, result = pcall(vim.fn.system, java_home .. "/bin/java -version 2>&1")
  if not ok then return "21" end
  local major = result:match('"(%d+)')
  return major or "21"
end

local function detect_java_se_name(java_home)
  return "JavaSE-" .. detect_java_version(java_home)
end

return {
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
      local jdtls = require("jdtls")
      local java_home = get_active_jdk()
      local java_se = detect_java_se_name(java_home)

      local capabilities = vim.tbl_deep_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities()
      )

      local on_attach = function(_, bufnr)
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
        nmap("<leader>lk", jump_prev, "Prev diagnostic")
        nmap("<leader>lf", vim.lsp.buf.format, "Format buffer")
        nmap("<leader>ld", '<cmd>Trouble diagnostics toggle<cr>', "Diagnostics")
        nmap("<leader>lD", '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', "Buffer Diagnostics")

        nmap("<leader>lo", jdtls.organize_imports, "Organize imports")
        nmap("<leader>lrv", jdtls.extract_variable, "Extract variable")
        nmap("<leader>lrc", jdtls.extract_constant, "Extract constant")
        vim.keymap.set("v", "<leader>lrm", [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
          { buffer = bufnr, remap = false, silent = true, desc = "jdtls: Extract method" })

        vim.api.nvim_buf_create_user_command(bufnr, "Format", vim.lsp.buf.format, {})
      end

      vim.lsp.config.jdtls = {
        cmd = {
          "jdtls",
          "--jvm-arg=-Djava.import.generatesMetadataFilesAtProjectRoot=false",
          "-Xmx4G",
        },
        filetypes = { "java" },
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          java = {
            eclipse = { downloadSources = true },
            configuration = {
              updateBuildConfiguration = "interactive",
              runtimes = {
                {
                  name = java_se,
                  path = java_home,
                  default = true,
                },
              },
            },
            maven = { downloadSources = true },
            implementationsCodeLens = { enabled = true },
            referencesCodeLens = { enabled = true },
            references = { includeDecompiledSources = true },
            format = { enabled = true },
          },
        },
        init_options = {
          bundles = {},
        },
      }
      vim.lsp.enable("jdtls")
    end,
  },
}
