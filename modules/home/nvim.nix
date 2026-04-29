{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    withRuby = false;
    withPython3 = false;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      # Plugin manager
      lazy-nvim

      # File explorer (right side)
      neo-tree-nvim
      nvim-web-devicons

      # LSP
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      luasnip
      cmp_luasnip
      friendly-snippets

      # Treesitter (syntax highlighting)
      nvim-treesitter.withAllGrammars

      # Fuzzy finder
      telescope-nvim
      plenary-nvim

      # Status line
      lualine-nvim

      # Theme
      dracula-nvim

      # Git signs
      gitsigns-nvim

      # Auto pairs
      nvim-autopairs

      # Which key (shows keybindings)
      which-key-nvim

      # Comment
      comment-nvim
    ];

    initLua = ''
      -- Basic settings
      vim.g.mapleader = " "
      vim.g.maplocalleader = " "

      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.mouse = "a"
      vim.opt.clipboard = "unnamedplus"
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
      vim.opt.wrap = false
      vim.opt.termguicolors = true
      vim.opt.scrolloff = 8
      vim.opt.signcolumn = "yes"
      vim.opt.updatetime = 50

      -- Theme
      vim.cmd("colorscheme dracula")

      -- File explorer on the right
      require("neo-tree").setup({
        window = {
          position = "right",
          width = 35,
        },
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
          },
        },
      })

      -- Toggle explorer
      vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle file explorer" })

      -- LSP setup
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Go
      lspconfig.gopls.setup({ capabilities = capabilities })

      -- JavaScript / TypeScript
      lspconfig.ts_ls.setup({ capabilities = capabilities })

      -- C / C++
      lspconfig.clangd.setup({ capabilities = capabilities })

      -- C# 
      lspconfig.omnisharp.setup({
        capabilities = capabilities,
        cmd = { "omnisharp" },
      })

      -- Java
      lspconfig.jdtls.setup({ capabilities = capabilities })

      -- Kotlin
      lspconfig.kotlin_language_server.setup({ capabilities = capabilities })

      -- LSP keymaps
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover docs" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
      vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format" })

      -- Autocomplete
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }),
      })

      -- Telescope
      local telescope = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Buffers" })

      -- Status line
      require("lualine").setup({
        options = {
          theme = "dracula",
        },
      })

      -- Autopairs
      require("nvim-autopairs").setup()

      -- Comments
      require("Comment").setup()

      -- Which key
      require("which-key").setup()

      -- Git signs
      require("gitsigns").setup()

      -- Window navigation
      vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Focus left" })
      vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Focus right" })
      vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Focus down" })
      vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Focus up" })

      -- Buffer navigation
      vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
      vim.keymap.set("n", "<leader>bp", ":bprev<CR>", { desc = "Prev buffer" })
      vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Close buffer" })

      -- Save
      vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save" })
      vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
    '';
  };
}
