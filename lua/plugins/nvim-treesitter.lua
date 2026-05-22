-- Migrated to nvim-treesitter main branch (2026-05-22)
-- Old master-branch config backed up as: nvim-treesitter.lua.bak.master-branch-20260522
--
-- What changed:
--   - branch removed → LazyVim's main-branch spec applies
--   - config function removed → LazyVim handles setup
--   - opts simplified to new main-branch API
--   - select / swap moved from opts to manual keymaps (new API requirement)
--
-- What was DROPPED (re-add manually if needed):
--   - incremental_selection (gone in main branch; use built-in v_an/v_in or another plugin)
--   - selection_modes / include_surrounding_whitespace (no longer config options)
--   - @scope (locals) and @fold (folds) move targets (different query_group; can add separately)

return {
  -- nvim-treesitter (main branch — branch/build/config handled by LazyVim spec)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        enable = true,
        disable = { "markdown", "markdown_inline" },
      },
      indent = { enable = true },
      ensure_installed = {
        "bash", "c", "diff", "html", "javascript", "jsdoc",
        "json", "jsonc", "lua", "luadoc", "luap",
        "markdown", "markdown_inline", "printf", "python",
        "query", "regex", "toml", "tsx", "typescript",
        "vim", "vimdoc", "xml", "yaml",
      },
    },
  },

  -- nvim-treesitter-textobjects (main branch)
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    opts = {
      move = {
        enable = true,
        set_jumps = true,
        keys = {
          goto_next_start = {
            ["]a"] = "@parameter.inner",
            ["]f"] = "@call.outer",
            ["]m"] = "@function.outer",
            ["]i"] = "@conditional.outer",
            ["]l"] = "@loop.outer",
          },
          goto_next_end = {
            ["]A"] = "@parameter.inner",
            ["]F"] = "@call.outer",
            ["]M"] = "@function.outer",
            ["]I"] = "@conditional.outer",
            ["]L"] = "@loop.outer",
          },
          goto_previous_start = {
            ["[a"] = "@parameter.inner",
            ["[f"] = "@call.outer",
            ["[m"] = "@function.outer",
            ["[i"] = "@conditional.outer",
            ["[l"] = "@loop.outer",
          },
          goto_previous_end = {
            ["[A"] = "@parameter.inner",
            ["[F"] = "@call.outer",
            ["[M"] = "@function.outer",
            ["[I"] = "@conditional.outer",
            ["[L"] = "@loop.outer",
          },
        },
      },
    },
    -- Select + swap: main branch removed these from opts → use explicit keymaps
    keys = {
      -- Select
      { "a=", function() require("nvim-treesitter-textobjects.select").select_textobject("@assignment.outer", "textobjects") end, mode = { "x", "o" }, desc = "Outer assignment" },
      { "i=", function() require("nvim-treesitter-textobjects.select").select_textobject("@assignment.inner", "textobjects") end, mode = { "x", "o" }, desc = "Inner assignment" },
      { "l=", function() require("nvim-treesitter-textobjects.select").select_textobject("@assignment.lhs", "textobjects") end, mode = { "x", "o" }, desc = "Assignment LHS" },
      { "r=", function() require("nvim-treesitter-textobjects.select").select_textobject("@assignment.rhs", "textobjects") end, mode = { "x", "o" }, desc = "Assignment RHS" },
      { "aa", function() require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects") end, mode = { "x", "o" }, desc = "Outer parameter" },
      { "ia", function() require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects") end, mode = { "x", "o" }, desc = "Inner parameter" },
      { "ai", function() require("nvim-treesitter-textobjects.select").select_textobject("@conditional.outer", "textobjects") end, mode = { "x", "o" }, desc = "Outer conditional" },
      { "ii", function() require("nvim-treesitter-textobjects.select").select_textobject("@conditional.inner", "textobjects") end, mode = { "x", "o" }, desc = "Inner conditional" },
      { "al", function() require("nvim-treesitter-textobjects.select").select_textobject("@loop.outer", "textobjects") end, mode = { "x", "o" }, desc = "Outer loop" },
      { "il", function() require("nvim-treesitter-textobjects.select").select_textobject("@loop.inner", "textobjects") end, mode = { "x", "o" }, desc = "Inner loop" },
      { "am", function() require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects") end, mode = { "x", "o" }, desc = "Outer function" },
      { "im", function() require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects") end, mode = { "x", "o" }, desc = "Inner function" },
      { "ac", function() require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects") end, mode = { "x", "o" }, desc = "Outer class" },
      { "ic", function() require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects") end, mode = { "x", "o" }, desc = "Inner class" },
      { "af", function() require("nvim-treesitter-textobjects.select").select_textobject("@call.outer", "textobjects") end, mode = { "x", "o" }, desc = "Outer call" },
      { "if", function() require("nvim-treesitter-textobjects.select").select_textobject("@call.inner", "textobjects") end, mode = { "x", "o" }, desc = "Inner call" },
      -- Swap
      { "<leader>a", function() require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner") end, desc = "Swap next parameter" },
      { "<leader>A", function() require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner") end, desc = "Swap previous parameter" },
      { "<leader>m", function() require("nvim-treesitter-textobjects.swap").swap_next("@function.outer") end, desc = "Swap next function" },
      { "<leader>M", function() require("nvim-treesitter-textobjects.swap").swap_previous("@function.outer") end, desc = "Swap previous function" },
    },
  },
}
