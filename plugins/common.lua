return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    config = true,
  },
  { "ellisonleao/gruvbox.nvim" },
  {
    -- Configure LazyVim to load gruvbox
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
  { "sunaku/tmux-navigate" },
  { "nvimdev/lspsaga.nvim" },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = {
      window = {
        completion = {
          border = "rounded",
          winhighlight = "Normal:CmpDocNormal",
        },
        documentation = {
          border = "rounded",
          winhighlight = "Normal:CmpDocNormal",
        },
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      win = {
        border = "rounded",
        -- winblend = 100, -- value between 0-100 0 for fully opaque and 100 for fully transparent
        -- winhighlight = "Normal:CmpDocNormal",
      },
    },
  },
  {
    "echasnovski/mini.nvim",
    version = false,
    -- config = function()
    --   require("mini.animate").setup({
    --     -- Configuration here, or leave empty to use defaults
    --   })
    -- end,
  },
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    opts = {
      laststatus = 3,
      splitkeep = "screen",
    },
  },
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup()
    end,
  },
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    config = function()
      require("outline").setup({
        outline_window = {
          position = "right", -- "right"
          width = 40,
          relative_width = false,
          auto_jump = true,
        },
      })
    end,
  },
  { "akinsho/toggleterm.nvim", version = "*", config = true },
  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup({})
    end,
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
  "sindrets/diffview.nvim",
}
