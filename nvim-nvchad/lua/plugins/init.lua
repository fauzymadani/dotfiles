return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- Plugin untuk LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Setup LSP server untuk HTML
      lspconfig.html.setup{}

      -- Setup LSP server untuk CSS
      lspconfig.cssls.setup{}

      -- Setup LSP server untuk JavaScript dan TypeScript
      lspconfig.ts_ls.setup{}

      --lua
      lspconfig.lua_ls.setup{}

      -- Setup LSP server untuk PHP
      lspconfig.intelephense.setup{}

      -- C
      lspconfig.clangd.setup{}
    end,
  },
  { "nvchad/volt" , lazy = true },
  {
    "nvchad/menu",
    config = function()
    require "plugins.menu"
    end,
    lazy = true
  },
  -- Plugin Treesitter (jika ingin menggunakannya)
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = {
  --     ensure_installed = {
  --       "vim", "lua", "vimdoc",
  --       "html", "css"
  --     },
  --   },
  -- },
}

