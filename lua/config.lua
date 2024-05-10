vim.g.mapleader = " "
vim.keymap.set("n", "<leader>sc", ":source init.lua<CR>")

-- [ normal maps ] --
vim.keymap.set("n", "<leader>ap", ":Ex<CR>")

-- enable line number and relative line number
vim.opt.number = true
vim.opt.relativenumber = true

-- width of a tab
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- use number of spaces to insert a <Tab>
vim.opt.expandtab = true
