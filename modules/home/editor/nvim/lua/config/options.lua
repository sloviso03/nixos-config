vim.g.mapleader = " "        
vim.g.maplocalleader = " "

local opt = vim.opt
opt.mouse = "a"              
opt.number = true            
opt.relativenumber = true    
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.clipboard = "unnamedplus"
opt.termguicolors = true
opt.splitright = true
opt.splitbelow = true
opt.ignorecase = true
opt.smartcase = true
opt.updatetime = 200

local map = vim.keymap.set

-- nano-style keymaps
map({"n", "i"}, "<C-s>", "<cmd>w<cr>", { desc = "Save" })
map({"n", "i"}, "<C-q>", "<cmd>q<cr>", { desc = "Quit" })
map({"n", "i"}, "<C-z>", "<cmd>undo<cr>", { desc = "Undo" })
map({"n", "i"}, "<C-y>", "<cmd>redo<cr>", { desc = "Redo" })
map({"n", "i"}, "<C-f>", "/", { desc = "Search" })
map({"n", "i"}, "<C-a>", "ggVG", { desc = "Select all" })
map("i", "<C-v>", "<C-r>+", { desc = "Paste" })

-- arrow keys work in normal mode too 
map("n", "<Up>", "k", { desc = "Up" })
map("n", "<Down>", "j", { desc = "Down" })
map("n", "<Left>", "h", { desc = "Left" })
map("n", "<Right>", "l", { desc = "Right" })