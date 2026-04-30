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
map("i", "<C-v>", "<C-r>+", { desc = "Paste" })

-- arrow keys work in normal mode too 
map("n", "<Up>", "k", { desc = "Up" })
map("n", "<Down>", "j", { desc = "Down" })
map("n", "<Left>", "h", { desc = "Left" })
map("n", "<Right>", "l", { desc = "Right" })


-- shift + arrows to select text in insert mode
map("i", "<S-Left>",  "<C-o>vh", { desc = "Select left" })
map("i", "<S-Right>", "<C-o>vl", { desc = "Select right" })
map("i", "<S-Up>",    "<C-o>vk", { desc = "Select up" })
map("i", "<S-Down>",  "<C-o>vj", { desc = "Select down" })


-- force neo-tree to always open on the right
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("neo-tree.command").execute({ action = "close" })
    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle right<cr>", { desc = "Explorer (Right)" })
    vim.keymap.set("n", "<leader>E", "<cmd>Neotree toggle right<cr>", { desc = "Explorer (Right)" })
  end,
})

-- compile and run current file based on filetype
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "c" },
  callback = function()
    map("n", "<F5>", function()
      local file = vim.fn.expand("%:p")
      local out  = vim.fn.expand("%:p:r")
      vim.cmd("w")
      vim.cmd("split | terminal g++ " .. file .. " -o " .. out .. " && " .. out)
    end, { desc = "Compile and run", buffer = true })
  end,
})
