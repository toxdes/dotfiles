return {
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    ---@type solarized.config
    opts = {
      palette = 'solarized',
      variant = 'spring',
      transparent = {
        enabled = true,
      },
    },
    config = function(_, opts)
      vim.o.termguicolors = true
      vim.o.background = 'dark'
      require('solarized').setup(opts)
      vim.cmd.colorscheme 'solarized'
    end,
  },

  { 
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 0,
    lazy = true,
  }
}
