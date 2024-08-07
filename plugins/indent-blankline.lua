return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = function(_, opts)
    local highlight = {
      "RainbowYellow",
      "RainbowCyan",
      "RainbowBlue",
      "RainbowRed",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
    }
    local hooks = require("ibl.hooks")

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    end)
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

    -- opts.indent = {
    --   highlight = highlight,
    --   -- char = "",
    -- }
    -- opts.whitespace = {
    --   highlight = highlight,
    --   remove_blankline_trail = false,
    -- }
    -- opts.scope = { enabled = true }
    -- opts.indent = { char = "┊" }
    opts.scope = {
      enabled = true,
      highlight = highlight,
      -- char = "┊",
    }
  end,
}
