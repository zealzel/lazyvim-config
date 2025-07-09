return {
  -- "tpope/vim-fugitive",
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").load_extension("bookmarks")
    end,
  },
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
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
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
  -- rocks = {
  --   hererocks = true, -- recommended if you do not have global installation of Lua 5.1.
  -- },
  -- {
  --   "vhyrro/luarocks.nvim",
  --   priority = 1000,
  --   config = true,
  -- },
  {
    "echasnovski/mini.nvim",
    version = false,
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
  { "brenoprata10/nvim-highlight-colors", config = true },
  -- {
  --   "HakonHarnes/img-clip.nvim",
  --   event = "VeryLazy",
  --   keys = {
  --     { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  --   },
  -- },
  -- {
  --   "TobinPalmer/pastify.nvim",
  --   cmd = { "Pastify", "PastifyAfter" },
  --   config = function()
  --     require("pastify").setup({
  --       opts = {
  --         apikey = "YOUR API KEY (https://api.imgbb.com/)", -- Needed if you want to save online.
  --       },
  --     })
  --   end,
  -- },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },
  {
    "dhruvmanila/browser-bookmarks.nvim",
    version = "*",
    -- Only required to override the default options
    opts = {
      -- Override default configuration values
      selected_browser = "chrome",
    },
    keys = { { "<leader>fB", "<cmd>Telescope bookmarks<cr>", desc = "Open browser bookmarks" } },
    -- usage :Telescope bookmarks
    -- Multiple bookmarks can be opened at the same time using multi selections feature in Telescope.
    dependencies = {
      -- Only if your selected browser is Firefox, Waterfox or buku
      -- "kkharji/sqlite.lua",

      -- Only if you're using the Telescope extension
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "mpas/marp-nvim",
    config = function()
      require("marp").setup({
        port = 8080,
        wait_for_response_timeout = 30,
        wait_for_response_delay = 1,
      })
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  {
    "olimorris/codecompanion.nvim",
    opts = {
      -- language = "en",
      language = "Chinese",
      strategies = {
        chat = {
          adapter = "anthropic",
          -- adapter = "openai",
        },
        inline = {
          adapter = "anthropic",
          -- adapter = "openai",
        },
      },
      adapters = {
        openai = function()
          return require("codecompanion.adapters").extend("openai", {
            env = {
              -- api_key = "cmd:op read op://personal/OpenAI/credential --no-newline",
              api_key = "",
            },
          })
        end,
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "j-hui/fidget.nvim",
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "codecompanion" },
        },
        ft = { "markdown", "codecompanion" },
      },
    },
  },
  -- {
  --   "ravitemer/mcphub.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
  --   },
  --   -- uncomment the following line to load hub lazily
  --   --cmd = "MCPHub",  -- lazy load
  --   build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
  --   -- uncomment this if you don't want mcp-hub to be available globally or can't use -g
  --   -- build = "bundled_build.lua",  -- Use this and set use_bundled_binary = true in opts  (see Advanced configuration)
  --   config = function()
  --     -- require("mcphub").setup()
  --     require("mcphub").setup({
  --       extensions = {
  --         avante = {
  --           make_slash_commands = true, -- make /slash commands from MCP server prompts
  --         },
  --       },
  --     })
  --   end,
  -- },
  {
    "hat0uma/csvview.nvim",
    ---@module "csvview"
    ---@type CsvView.Options
    opts = {
      parser = { comments = { "#", "//" } },
      keymaps = {
        -- Text objects for selecting fields
        textobject_field_inner = { "if", mode = { "o", "x" } },
        textobject_field_outer = { "af", mode = { "o", "x" } },
        -- Excel-like navigation:
        -- Use <Tab> and <S-Tab> to move horizontally between fields.
        -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
        -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
        jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
        jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
        jump_next_row = { "<Enter>", mode = { "n", "v" } },
        jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
      },
    },
    cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
  },
  { "augmentcode/augment.vim" },
  -- {
  --   "kevinhwang91/nvim-ufo",
  --   dependencies = {
  --     { "kevinhwang91/promise-async" },
  --   },
  -- },
}
