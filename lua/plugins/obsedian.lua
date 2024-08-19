return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  vim.keymap.set("n", "\\oo", ":ObsidianOpen<CR>", { desc = "Open obsidian" }),
  vim.keymap.set("n", "\\on", ":ObsidianNew<CR>", { desc = "New note" }),
  vim.keymap.set("n", "\\oN", ":ObsidianNewFromTemplate<CR>", { desc = "New from template" }),
  vim.keymap.set("n", "\\ot", ":ObsidianTemplate<CR>", { desc = "Templates" }),
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal",
      },
      {
        name = "work",
        path = "~/vaults/work",
      },
    },
    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
    },

    -- see below for full list of options 👇
  },
}
