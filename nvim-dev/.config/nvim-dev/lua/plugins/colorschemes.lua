return {
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    ---@type solarized.config
    opts = {
      palette = 'solarized',
      variant = 'spring',
    },
    config = function(_, opts)
      vim.o.termguicolors = true
      vim.o.background = 'dark'
      require('solarized').setup(opts)
      vim.cmd.colorscheme 'solarized'
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
  }
}
