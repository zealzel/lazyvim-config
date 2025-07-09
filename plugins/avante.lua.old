return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  build = "make",
  opts = {
    -- add any opts here
    provider = "openai",
    mappings = {
      ask = "<leader>ha",
      edit = "<leader>he",
      refresh = "<leader>hr",
      --- @class AvanteConflictMappings
      diff = {
        ours = "co",
        theirs = "ct",
        none = "c0",
        both = "cb",
        next = "]x",
        prev = "[x",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
    },
    hints = { enabled = true },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
}
