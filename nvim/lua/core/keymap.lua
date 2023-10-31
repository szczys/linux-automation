vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- case insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.keymap.set('i', 'kj', '<Esc>', options)

-- remap pane navigation
vim.keymap.set('n', '<C-j>', '<C-W>j', options)
vim.keymap.set('n', '<C-k>', '<C-W>k', options)
vim.keymap.set('n', '<C-h>', '<C-W>h', options)
vim.keymap.set('n', '<C-l>', '<C-W>l', options)

-- show line numbers
vim.opt.number = true

-- Color the colum to the right of the limit
vim.opt.colorcolumn = "+1"

-- Use system clipboard by default
vim.opt.clipboard = "unnamedplus"
 
