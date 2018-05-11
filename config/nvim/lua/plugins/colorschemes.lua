return {
  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = false, 
    priority = 1000, 
    config = function()
      require("NeoSolarized").setup {
        style = "dark", -- "dark" or "light"
        transparent = false, -- true/false; Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        enable_italics = false, -- Italics for different hightlight groups (eg. Statement, Condition, Comment, Include, etc.)
        styles = {
          -- Style to be applied to different syntax groups
          comments = { italic = false },
          keywords = { italic = false },
          functions = { bold = false },
          variables = {},
          string = { italic = false },
          underline = true, -- true/false; for global underline
          undercurl = true, -- true/false; for global undercurl
        },
      }
      vim.cmd [[ colorscheme NeoSolarized]]
    end
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    lazy = true,
    config = function()
      -- require('onedark').setup {
      --   style = 'deep',
      --   transparent = true
      -- }
    end
  },
  {
    "akinsho/horizon.nvim",
    priority = 1000,
    lazy = true
  }
}
