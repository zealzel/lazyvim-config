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
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
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
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
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
    -- https://github.com/xiyaowong/transparent.nvim
    -- use :TransparentToggle to toggle transparency
    "xiyaowong/transparent.nvim",
    opts = {
      -- groups = { -- table: default groups
      -- "Normal",
      -- "NormalNC",
      -- "Comment",
      -- "Constant",
      -- "Special",
      -- "Identifier",
      -- "Statement",
      -- "PreProc",
      -- "Type",
      -- "Underlined",
      -- "Todo",
      -- "String",
      -- "Function",
      -- "Conditional",
      -- "Repeat",
      -- "Operator",
      -- "Structure",
      -- "LineNr",
      -- "NonText",
      -- "SignColumn",
      -- "CursorLine",
      -- "CursorLineNr",
      -- "StatusLine",
      -- "StatusLineNC",
      -- "EndOfBuffer",
      -- },
      exclude_groups = { "CursorLine" },
      -- extra_groups = { "RenderMarkdownCode" },
    },
  },
  { "brenoprata10/nvim-highlight-colors", config = true },
  {
    "b0o/incline.nvim",
    config = true,
    opts = {
      window = {
        padding = 0,
        margin = { horizontal = 0 },
      },
      render = function(props)
        local helpers = require("incline.helpers")
        local devicons = require("nvim-web-devicons")
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if filename == "" then
          filename = "[No Name]"
        end
        local ft_icon, ft_color = devicons.get_icon_color(filename)
        local modified = vim.bo[props.buf].modified
        return {
          ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
          " ",
          { filename, gui = modified and "bold,italic" or "bold" },
          " ",
          guibg = "#44406e",
        }
      end,
    },
  },
  {
    "mfussenegger/nvim-lint",
    -- https://github.com/mfussenegger/nvim-lint
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        json = { "jsonlint" },
        -- markdown = { "vale", "write-good" },
        markdown = { "vale" },
      }
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
      vim.api.nvim_create_user_command("ListLinters", function()
        lint.try_lint()
        local linters = lint.get_running()
        if #linters == 0 then
          print("no linters")
        else
          print(table.concat(linters, ", "))
        end
      end, {})
      -- vim.keymap.set("n", "<leader>ll", "<cmd>ListLinters<cr>", { desc = "List linters attached to this buffer" })
    end,
  },
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
}
