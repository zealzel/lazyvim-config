return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers.basedpyright = {
        settings = {
          basedpyright = {
            analysis = { typeCheckingMode = "off" },
          },
        },
      }
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft["python"] = { "black" }
    end,
  },
  {
    "williamboman/mason.nvim",
    enabled = true,
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "black")
      -- table.insert(opts.ensure_installed, "flake8")
      -- table.insert(opts.ensure_installed, "mypy")
      opts.ui.border = "rounded"
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    -- optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      table.insert(opts.sources, nls.builtins.formatting.black)
    end,
  },
}
