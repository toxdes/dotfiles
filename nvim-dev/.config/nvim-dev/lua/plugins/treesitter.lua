return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = { 'neovim-treesitter/treesitter-parser-registry' },
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local treesitter = require("nvim-treesitter")
    
    local ensure_installed = {
      "json", "javascript", "typescript", "tsx", "go", "yaml", "html", "css", "python",
      "http", "svelte", "graphql", "bash", "vim", "dockerfile", "gitignore", "dart",
      "groovy", "vimdoc", "c", "java", "rust", "markdown_inline",
    }

    treesitter.install(ensure_installed)
  end
}
