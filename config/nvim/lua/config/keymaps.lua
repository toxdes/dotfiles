-- telescope keybindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>b', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>r', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>ch', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>cm', builtin.man_pages, { desc = 'Telescope man pages' })
vim.keymap.set('n', '<leader>cc', builtin.colorscheme, { desc = 'Telescope colorschemes' })

-- indent entire file
vim.keymap.set('n', '<leader>=','gg=G', { noremap = true, silent = true })

-- NvimTree keybindings
vim.keymap.set('n', '<leader>t', ":NvimTreeToggle<CR>", {noremap = true, silent = true })

-- config
vim.keymap.set('n', '<leader>cr', ":w<CR>:source % <CR>", {noremap = true, silent = true })
vim.keymap.set('n', '<leader>cc', ":e ~/.config/nvim/init.lua <CR>", {noremap = true, silent = true })

-- move line up/down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = "move line down"})
vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv", { desc = "move line up"})


-- scroll with centered-cursor
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Clear find highlight
vim.keymap.set('n', '<C-c>', ':nohl<CR>', { silent = true })

-- delete char without copying
vim.keymap.set('n', 'x', '"_x', { noremap = true, silent = true})

