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

-- shift+arrows to select
map("i", "<S-Left>", "<C-o>vh", { desc = "Select left" })
map("i", "<S-Right>", "<C-o>vl", { desc = "Select right" })
map("i", "<S-Up>", "<C-o>vk", { desc = "Select up" })
map("i", "<S-Down>", "<C-o>vj", { desc = "Select down" })
map("n", "<S-Left>", "vh", { desc = "Select left" })
map("n", "<S-Right>", "vl", { desc = "Select right" })
map("n", "<S-Up>", "vk", { desc = "Select up" })
map("n", "<S-Down>", "vj", { desc = "Select down" })

-- ctrl+k to cut selection
map({"n", "v"}, "<C-k>", "d", { desc = "Cut" })
map("i", "<C-k>", "<C-o>d", { desc = "Cut line" })



-- force neo-tree to always open on the right
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("neo-tree.command").execute({ action = "close" })
    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle right<cr>", { desc = "Explorer (Right)" })
    vim.keymap.set("n", "<leader>E", "<cmd>Neotree toggle right<cr>", { desc = "Explorer (Right)" })
  end,
})