vim.g.mapleader = " "

vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>sf', ':w<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>tt', ':ToggleTerm direction=float<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>er', ':TroubleToggle<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>ss', ':SessionSave<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>sl', ':SessionLoad<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>bc', ':BufferClose<cr>', {})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
local function cmd(command)
   return table.concat({ '<Cmd>', command, '<CR>' })
end

vim.keymap.set('n', '<C-w>z', cmd 'WindowsMaximize')
vim.keymap.set('n', '<C-w>_', cmd 'WindowsMaximizeVertically')
vim.keymap.set('n', '<C-w>|', cmd 'WindowsMaximizeHorizontally')
vim.keymap.set('n', '<C-w>=', cmd 'WindowsEqualize')

vim.api.nvim_set_keymap('n', '<leader>sh', ':Gitsigns stage_hunk<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>uh', ':Gitsigns undo_stage_hunk<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>ph', ':Gitsigns preview_hunk<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>rh', ':Gitsigns reset_hunk<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>n', ':Gitsigns next_hunk<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>N', ':Gitsigns prev_hunk<cr>', {})


vim.cmd('set number relativenumber')
vim.keymap.set("x", "p", function() return 'pgv"' .. vim.v.register .. "y" end, { remap = false, expr = true })
vim.keymap.set("x", "d", "\"_d", {})

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

require('packer-plugins')

