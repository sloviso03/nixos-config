return {
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("dracula").setup({
        transparent_bg = true, 
      })
      vim.cmd("colorscheme dracula")
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",    
    opts = function(_, opts)      
      opts.window = opts.window or {}
      opts.window.position = "right"
      opts.window.width = 30
      
      opts.filesystem = opts.filesystem or {}
      opts.filesystem.follow_current_file = { enabled = true }
      
      return opts
    end,
    keys = {      
      { "<leader>e", false }, 
      { "<leader>E", false },
      { "<leader>e", "<cmd>Neotree toggle right<cr>", desc = "Explorer NeoTree (Right)" },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "dracula",
        icons_enabled = true,
      },
    },
  },
}