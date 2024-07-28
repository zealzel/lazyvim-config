return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.diagnostics = {
        float = { border = "rounded" },
      }
      opts.servers.basedpyright = {
        settings = {
          basedpyright = {
            analysis = { typeCheckingMode = "off" },
          },
        },
      }
      opts.servers.ruff = {
        cmd_env = { RUFF_TRACE = "messages" },
        init_options = {
          settings = {
            logLevel = "error",
          },
        },
        keys = {
          {
            "<leader>co",
            LazyVim.lsp.action["source.organizeImports"],
            desc = "Organize Imports",
          },
        },
      }
      -- opts.servers.ruff_lsp = {
      --   keys = {
      --     {
      --       "<leader>co",
      --       LazyVim.lsp.action["source.organizeImports"],
      --       desc = "Organize Imports",
      --     },
      --   },
      -- }
      -- opts.setup = {
      --   [ruff] = function()
      --     LazyVim.lsp.on_attach(function(client, _)
      --       -- Disable hover in favor of Pyright
      --       client.server_capabilities.hoverProvider = false
      --     end, ruff)
      --   end,
      -- }
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
  --     opts.ui.border = "rounded"
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
