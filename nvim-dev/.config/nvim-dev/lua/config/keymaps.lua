-- telescope keybindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>p', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>r', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>ch', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>cm', builtin.man_pages, { desc = 'Telescope man pages' })
vim.keymap.set('n', '<leader>cc', builtin.colorscheme, { desc = 'Telescope colorschemes' })

-- indent entire file
vim.keymap.set('n', '<leader>=','magg=G`a', { noremap = true, silent = true })

-- netrw keybindings
vim.keymap.set('n', '<leader>t', ":NvimTreeToggle<CR>", {noremap = true, silent = true })

-- config
vim.keymap.set('n', '<leader>cr', ":w<CR>:source % <CR>", {noremap = true, silent = true })
vim.keymap.set('n', '<leader>cc', ":e ~/.config/nvim/init.lua <CR>", {noremap = true, silent = true })

-- movement with centered cursor
vim.keymap.set('n', 'J', '5jzz', { desc = "go 5 lines down" })
vim.keymap.set('n', 'K', '5kzz', { desc = "go 5 lines up" })
vim.keymap.set('v', 'J', '5jzz', { desc = "go 5 lines down" })
vim.keymap.set('v', 'K', '5kzz', { desc = "go 5 lines up" })
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Clear find highlight
vim.keymap.set('n', '<C-c>', ':nohl<CR>', { silent = true })

-- delete char without copying
vim.keymap.set('n', 'x', '"_x', { noremap = true, silent = true})
 
-- kj to esc 
vim.keymap.set('i', 'kj', '<Esc>', { desc = "Exit insert mode", nowait = true })

-- copy/delete entire buffer
local function copy_buffer()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  vim.fn.setreg("+", table.concat(lines, "\n") .. "\n")
end

local function clear_buffer()
  vim.api.nvim_buf_set_lines(0, 0, -1, false, {})
end

vim.keymap.set("n", "<leader>c", copy_buffer)
vim.keymap.set("n", "<leader>-", clear_buffer)

-- copy selection
local function copy_location(visual)
  local file = vim.api.nvim_buf_get_name(0)
  local root = vim.fs.root(0, { ".git" }) or vim.fn.getcwd()
  file = vim.fs.relpath(root, file) or file

  local first, last

  if visual then
    first = vim.fn.line("v")
    last = vim.fn.line(".")
    first, last = math.min(first, last), math.max(first, last)
  else
    first = vim.fn.line(".")
  end

  local location = visual and
    ("%s:%d:%d"):format(file, first, last) or
    ("%s:%d"):format(file, first)

  vim.fn.setreg("+", location)
end

vim.keymap.set("n", "<leader>.", function()
  copy_location(false)
end)

vim.keymap.set("v", "<leader>.", function()
  copy_location(true)
end)
