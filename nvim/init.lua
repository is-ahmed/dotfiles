vim.g.mapleader = " "

vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>sf', ':w<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>tt', ':ToggleTerm direction=float<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>tf', ':ToggleTerm dir=%:p:h direction=float<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>er', ':TroubleToggle<cr>', {})

vim.keymap.set("n", "<leader>ed", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>eq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>gr", function() require("trouble").toggle("lsp_references") end)
vim.keymap.set("n", "<leader>gd", function() require("trouble").toggle("lsp_definitions") end)
vim.keymap.set("n", "<leader>gt", function() require("trouble").toggle("lsp_type_definitions") end)

vim.keymap.set("n", "<leader>en", function() require("trouble").next({skip_groups = true, jump = true}) end)
vim.keymap.set("n", "<leader>ep", function() require("trouble").previous({skip_groups = true, jump = true}) end)
vim.keymap.set("n", "<leader>ef", function() require("trouble").first({skip_groups = true, jump = true}) end)
vim.keymap.set("n", "<leader>el", function() require("trouble").last({skip_groups = true, jump = true}) end)

vim.api.nvim_set_keymap('n', '<leader>ss', ':SessionSave<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>sl', ':SessionLoad<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>bc', ':BufferClose<cr>', {})
vim.keymap.set("n", "<leader>ff",
  "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set("n", "<leader>fg",
  "<cmd>lua require('fzf-lua').grep_project()<CR>", { silent = true })
vim.keymap.set("n", "<leader>fc",
  "<cmd>lua require('fzf-lua').grep_curbuf()<CR>", { silent = true })
vim.keymap.set("n", "<leader>fs",
  "<cmd>lua require('fzf-lua').git_status()<CR>", { silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', ':FzfLua buffers<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>fr', ':FzfLua resume<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>fm', ':FzfLua marks<cr>', {})
vim.api.nvim_set_keymap('n', ';', "`", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Tab>', ':BufferNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferPrevious<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>do', ':DiffviewOpen<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>dc', ':DiffviewClose<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>dh', ':DiffviewFileHistory<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>df', ':DiffviewToggleFiles<cr>', {})
local function cmd(command)
   return table.concat({ '<Cmd>', command, '<CR>' })
end

vim.keymap.set('n', '<C-w>z', cmd 'WindowsMaximize')
vim.keymap.set('n', '<C-w>_', cmd 'WindowsMaximizeVertically')
vim.keymap.set('n', '<C-w>|', cmd 'WindowsMaximizeHorizontally')
vim.keymap.set('n', '<C-w>=', cmd 'WindowsEqualize')

vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})

vim.api.nvim_set_keymap('n', '<leader>sh', ':Gitsigns stage_hunk<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>sb', ':Gitsigns stage_buffer<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>uh', ':Gitsigns undo_stage_hunk<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>ph', ':Gitsigns preview_hunk<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>pi', ':Gitsigns preview_hunk_inline<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>rh', ':Gitsigns reset_hunk<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>rb', ':Gitsigns reset_buffer<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>n', ':Gitsigns next_hunk<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>N', ':Gitsigns prev_hunk<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>cbr', ':BufferCloseBuffersRight<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>cbl', ':BufferCloseBuffersLeft<cr>', {})


vim.cmd('set number relativenumber')
vim.cmd('set smartcase')
vim.cmd('set ignorecase')
vim.keymap.set("x", "p", function() return 'pgv"' .. vim.v.register .. "y" end, { remap = false, expr = true })
vim.keymap.set("x", "d", "\"_d", {})

vim.keymap.set({ 'n' }, '<C-k>', function() require('lsp_signature').toggle_float_win()
    end, { silent = true, noremap = true, desc = 'toggle signature' })

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.api.nvim_create_autocmd({ "VimLeave" }, {
  callback = function()
    vim.cmd('!notify-send  ""')
    vim.cmd('sleep 10m')
  end,
})

vim.api.nvim_create_autocmd({ "VimLeave" }, {
  callback = function()
    vim.fn.jobstart('notify-send ""', {detach=true})
  end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern="*",
	callback = function ()
		vim.opt.formatoptions:remove({"c", "r", "o"})
	end
})

-- ~/.config/nvim/after/ftplugin/haskell.lua
local ht = require('haskell-tools')
local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = bufnr, }
-- haskell-language-server relies heavily on codeLenses,
-- so auto-refresh (see advanced configuration) is enabled by default
vim.keymap.set('n', '<space>cl', vim.lsp.codelens.run, opts)
-- Hoogle search for the type signature of the definition under the cursor
vim.keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature, opts)
-- Evaluate all code snippets
vim.keymap.set('n', '<space>ea', ht.lsp.buf_eval_all, opts)
-- Toggle a GHCi repl for the current package
vim.keymap.set('n', '<leader>rr', ht.repl.toggle, opts)
-- Toggle a GHCi repl for the current buffer
vim.keymap.set('n', '<leader>rf', function()
  ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, opts)
vim.keymap.set('n', '<leader>rq', ht.repl.quit, opts)

require('packer-plugins')

