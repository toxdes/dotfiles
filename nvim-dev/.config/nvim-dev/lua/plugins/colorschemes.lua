-- Choose a theme by changing the active_theme assignment below.
local themes = {
  everforest_dark_hard = {
    colorscheme = 'everforest', background = 'dark', everforest_background = 'hard',
  },
  everforest_dark_medium = {
    colorscheme = 'everforest', background = 'dark', everforest_background = 'medium',
  },
  everforest_dark_soft = {
    colorscheme = 'everforest', background = 'dark', everforest_background = 'soft',
  },
  everforest_light_hard = {
    colorscheme = 'everforest', background = 'light', everforest_background = 'hard',
  },
  everforest_light_medium = {
    colorscheme = 'everforest', background = 'light', everforest_background = 'medium',
  },
  everforest_light_soft = {
    colorscheme = 'everforest', background = 'light', everforest_background = 'soft',
  },
  solarized_dark = { colorscheme = 'solarized', background = 'dark' },
  solarized_light = { colorscheme = 'solarized', background = 'light' },
}
local active_theme = themes.everforest_dark_hard

return {
  {
    'sainnhe/everforest',
    lazy = false,
    priority = 1001,
    config = function()
      vim.g.everforest_background = active_theme.everforest_background
    end,
  },
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      palette = 'solarized',
      variant = 'spring',
    },
    config = function(_, opts)
      vim.o.termguicolors = true
      vim.o.background = active_theme.background
      require('solarized').setup(opts)
      vim.cmd.colorscheme(active_theme.colorscheme)
      local hl_groups = vim.api.nvim_get_hl(0, {})
      for key, hl_group in pairs(hl_groups) do
        if hl_group.italic then
          vim.api.nvim_set_hl(0, key, vim.tbl_extend("force", hl_group, {italic = false}))
        end
      end
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 0,
    lazy = true,
  },
}
