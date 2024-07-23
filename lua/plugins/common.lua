return {
  { "ellisonleao/gruvbox.nvim" },
  -- { "tpope/vim-obsession" },
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
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        float = {
          border = "rounded",
          -- winhighlight = "Normal:CmpDocNormal",
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
    -- Markdown preview
    -- ref: https://www.reddit.com/r/neovim/comments/10w4u51/comment/j7lpl9u/?utm_source=share&utm_medium=web2x&context=3
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "ellisonleao/glow.nvim",
    config = true,
    cmd = "Glow",
    opts = {
      -- width = 80,
      -- height = 100,
      width = 160,
      height = 200,
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
  {
    "MeanderingProgrammer/markdown.nvim",
    name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    config = function()
      require("render-markdown").setup({})
    end,
  },
  -- {
  --   "SmiteshP/nvim-navic",
  --   opts = function()
  --     return {
  --       separator = " ",
  --       highlight = true,
  --       depth_limit = 5,
  --       icons = LazyVim.config.icons.kinds,
  --       lazy_update_context = true,
  --     }
  --   end,
  -- },
}
