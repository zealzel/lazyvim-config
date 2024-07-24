return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end,
  opts = {
    animate = {
      enabled = true,
      -- fps = 100, -- frames per second
      -- cps = 120, -- cells per second
      fps = 80, -- frames per second
      cps = 80, -- cells per second
      on_begin = function()
        vim.g.minianimate_disable = true
        -- vim.g.minianimate_disable = true
      end,
      on_end = function()
        vim.g.minianimate_disable = true
        -- vim.g.minianimate_disable = false
      end,
      -- Spinner for pinned views that are loading.
      -- if you have noice.nvim installed, you can use any spinner from it, like:
      -- spinner = require("noice.util.spinners").spinners.circleFull,
      spinner = {
        frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
        interval = 80,
      },
    },
    bottom = {
      -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
      {
        ft = "toggleterm",
        size = { height = 0.4 },
        -- exclude floating windows
        filter = function(buf, win)
          return vim.api.nvim_win_get_config(win).relative == ""
        end,
      },
      -- {
      --   ft = "lazyterm",
      --   title = "LazyTerm",
      --   size = { height = 0.4 },
      --   filter = function(buf)
      --     return not vim.b[buf].lazyterm_cmd
      --   end,
      -- },
      "Trouble",
      { ft = "qf", title = "QuickFix" },
      {
        ft = "help",
        size = { height = 20 },
        -- only show help buffers
        filter = function(buf)
          return vim.bo[buf].buftype == "help"
        end,
      },
      { ft = "spectre_panel", size = { height = 0.4 } },
    },
    -- left = {
    --   -- Neo-tree filesystem always takes half the screen height
    --   {
    --     title = "Neo-Tree",
    --     ft = "neo-tree",
    --     filter = function(buf)
    --       return vim.b[buf].neo_tree_source == "filesystem"
    --     end,
    --     size = { height = 0.5 },
    --   },
    --   -- any other neo-tree windows
    --   "neo-tree",
    -- },
    right = {
      {
        title = function()
          local buf_name = vim.api.nvim_buf_get_name(0) or "[No Name]"
          return vim.fn.fnamemodify(buf_name, ":t")
        end,
        ft = "Outline",
        pinned = true,
        size = { width = 40 },
        -- open = "SymbolsOutlineOpen",
        open = "Outline",
      },
    },
  },
}
