return {
  { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  require("todo-comments").setup({
    keywords = {
      FIX = { icon = " ", color = "error" },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      PERF = { icon = " ", color = "performance" },
      NOTE = { icon = " ", color = "hint" },
    }, --TODO : implements this
  }), --FIX : fix this shit
}

-- TODO: Implement this function
-- FIX: Fix the bug in line 42
-- HACK: This is a temporary workaround
-- PERF: Optimize the loop
-- NOTE: This is a note for future reference
