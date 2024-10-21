-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("lspconfig").pyright.setup({})
require("lspconfig").templ.setup({})
require("lspconfig").ast_grep.setup({})
require("lspconfig").vtsls.setup({})
require("lspconfig").intelephense.setup({})
require("lspconfig").stimulus_ls.setup({})
require("lspconfig").csharp_ls.setup({})
require("lspconfig").clangd.setup({})
require("lspconfig").rust_analyzer.setup({})
require("lspconfig").ast_grep.setup({
  filetypes = {
    "cpp",
    "rust",
    "go",
    "java",
    "python",
    "javascript",
    "typescript",
    "html",
    "css",
    "kotlin",
    "dart",
    "lua",
    "c",
  },
})
vim.api.nvim_set_keymap("n", "<A-b>", ":TodoTrouble<CR>", { noremap = true, silent = true })
-- Atur key mapping untuk F5
vim.api.nvim_set_keymap("n", "<F5>", ":TodoTelescope<CR>", { noremap = true, silent = true })
