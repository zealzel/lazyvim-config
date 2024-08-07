return {
  -- Configure LazyVim to load gruvbox
  "LazyVim/LazyVim",
  -- opts = {
  --   colorscheme = "tokyonight-night", -- moon, storm, night, day
  -- },
  opts = {
    colorscheme = "gruvbox",
    vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" }), -- line to fix de background color border
  },
  -- opts = {
  --   colorscheme = "catppuccin-macchiato", -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
  --   integrations = {
  --     aerial = true,
  --     alpha = true,
  --     cmp = true,
  --     dashboard = true,
  --     flash = true,
  --     gitsigns = true,
  --     headlines = true,
  --     illuminate = true,
  --     indent_blankline = { enabled = true },
  --     leap = true,
  --     lsp_trouble = true,
  --     mason = true,
  --     markdown = true,
  --     mini = true,
  --     native_lsp = {
  --       enabled = true,
  --       underlines = {
  --         errors = { "undercurl" },
  --         hints = { "undercurl" },
  --         warnings = { "undercurl" },
  --         information = { "undercurl" },
  --       },
  --     },
  --     navic = { enabled = true, custom_bg = "lualine" },
  --     neotest = true,
  --     neotree = true,
  --     noice = true,
  --     notify = true,
  --     semantic_tokens = true,
  --     telescope = true,
  --     treesitter = true,
  --     treesitter_context = true,
  --     which_key = true,
  --   },
  -- },
}
