-- ~/.config/nvim/lua/plugins/lualine.lua
return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "tokyonight",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = { "NvimTree", "dashboard" },
      },
      sections = {
        lualine_a = { {
          "mode",
          fmt = function(str)
            return str:sub(1, 1)
          end,
        } },
        lualine_b = { { "filename", path = 1 }, { "branch" } },
        lualine_c = {
          {
            "diagnostics",
            sources = { "nvim_lsp" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
          },
        },
        lualine_x = { { "encoding" }, { "fileformat" }, { "filetype" }, { "progress" } },
        lualine_y = { "location" },
        lualine_z = { { 'os.date("%H:%M")' } },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    })
  end,
}
