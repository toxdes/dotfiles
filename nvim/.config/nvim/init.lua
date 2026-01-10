-- tab = 2 spaces
local spaces = 2
vim.opt.expandtab = true
vim.opt.tabstop = spaces
vim.opt.softtabstop = spaces
vim.opt.shiftwidth = spaces


-- fix splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- fix clipboard and search highlight
vim.opt.clipboard:append("unnamedplus")
vim.opt.hlsearch = true

-- set leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- enable mouse
vim.opt.mouse = "a"
vim.g.editorconfig = true

-- set line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- neovide specific config
if vim.g.neovide then
    require("config.neovide")
end

-- load package manager
require("config.lazy")

require("config.keymaps")

