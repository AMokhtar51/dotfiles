vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)


-- Prevents 'x' from copying deleted characters to the clipboard
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true})
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Competitive Programming
vim.keymap.set("n", "<localleader>t", "<cmd>CompetiTest run<CR>")
vim.keymap.set("n", "<localleader>rc", "<cmd>CompetiTest receive contest<CR>")
vim.keymap.set("n", "<localleader>rp", "<cmd>CompetiTest receive problem<CR>")
vim.keymap.set("n", "<localleader>at", "<cmd>CompetiTest add_testcase<CR>")
vim.keymap.set("n", "<localleader>et", "<cmd>CompetiTest edit_testcase<CR>")

