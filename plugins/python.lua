return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      vim.g.lazyvim_python_lsp = "basedpyright"
      opts.servers.basedpyright = {
        settings = {
          basedpyright = {
            analysis = { typeCheckingMode = "off" }, -- strict|standard|basic|off
          },
        },
      }
    end,
  },
  -- Uncomment below if you want to use black besides ruff
  -- {
  --   "stevearc/conform.nvim",
  --   opts = function(_, opts)
  --     opts.formatters_by_ft["python"] = { "black" }
  --   end,
  -- },
  -- {
  --   "williamboman/mason.nvim",
  --   enabled = true,
  --   opts = function(_, opts)
  --     table.insert(opts.ensure_installed, "black")
  --     -- table.insert(opts.ensure_installed, "flake8")
  --     -- table.insert(opts.ensure_installed, "mypy")
  --   end,
  -- },
  -- Uncomment below if you want to use black provided by none-ls
  -- {
  --   "nvimtools/none-ls.nvim",
  --   -- optional = true,
  --   opts = function(_, opts)
  --     local nls = require("null-ls")
  --     opts.sources = opts.sources or {}
  --     table.insert(opts.sources, nls.builtins.formatting.black)
  --   end,
  -- },
}
