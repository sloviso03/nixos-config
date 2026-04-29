return {
  "folke/persistence.nvim",
  event = "BufReadPre", 
  opts = {    
    options = { "buffers", "curdir", "tabpages" }, 
    pre_save = function()      
      vim.cmd("Neotree close")
    end,
  },
}