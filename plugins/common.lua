return {
  -- "tpope/vim-fugitive",
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
  "williamboman/mason-lspconfig.nvim",
  "ellisonleao/gruvbox.nvim",
  "sunaku/tmux-navigate",
  "nvimdev/lspsaga.nvim",
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = true,
  },
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
  -- {
  --   -- Markdown preview
  --   -- ref: https://www.reddit.com/r/neovim/comments/10w4u51/comment/j7lpl9u/?utm_source=share&utm_medium=web2x&context=3
  --   "iamcco/markdown-preview.nvim",
  --   build = function()
  --     vim.fn["mkdp#util#install"]()
  --   end,
  -- },
  -- {
  --   "ellisonleao/glow.nvim",
  --   config = true,
  --   cmd = "Glow",
  --   opts = {
  --     -- width = 80,
  --     -- height = 100,
  --     width = 160,
  --     height = 200,
  --   },
  -- },
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
  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup({})
    end,
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
  {
    "ErickKramer/nvim-ros2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      -- Add any custom options here
      autocmds = true,
      telescope = true,
      treesitter = true,
    },
  },
  "tribela/vim-transparent",
}
