return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { 
        "c", "cpp", "go", "rust", "java",
        "lua", "vim", "vimdoc", "python", "bash",
        "yaml", "toml", "json",
        "javascript", "html", "typescript", "svelte", "xml", "css", "scss", "markdown"},
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },  
      })
    end
}

