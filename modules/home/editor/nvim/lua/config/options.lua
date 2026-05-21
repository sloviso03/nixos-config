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
-- NVIM KEYMAPS ---------------- {
  map({"n", "i"}, "<C-s>", "<cmd>w<cr>", { desc = "Save" })
  map({"n", "i"}, "<C-z>", "<cmd>undo<cr>", { desc = "Undo" })
  map({"n", "i"}, "<C-r>", "<cmd>redo<cr>", { desc = "Redo" })

  -- arrow keys work in normal mode too 
  map("n", "<Up>", "k", { desc = "Up" })
  map("n", "<Down>", "j", { desc = "Down" })
  map("n", "<Left>", "h", { desc = "Left" })
  map("n", "<Right>", "l", { desc = "Right" })


-- force neo-tree to always open on the right
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("neo-tree.command").execute({ action = "close" })
    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle right<cr>", { desc = "Explorer (Right)" })
    vim.keymap.set("n", "<leader>E", "<cmd>Neotree toggle right<cr>", { desc = "Explorer (Right)" })
  end,
})

