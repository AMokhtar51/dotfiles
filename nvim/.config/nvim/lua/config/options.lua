local opt = vim.opt

opt.inccommand = "split"
opt.relativenumber = true
opt.cursorline = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.clipboard = "unnamedplus"
opt.smartcase = true
opt.ignorecase = true
opt.fileformats = { "unix", "dos" }

-- Prevent 'x' from copying deleted characters to the clipboard
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })
vim.keymap.set("x", "<leader>p", [["_dP]])
