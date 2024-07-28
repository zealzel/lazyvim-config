return {
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      clangd = function(_, opts)
        opts.capabilities.offsetEncoding = { "utf-16" }
      end,
    },
    diagnostics = {
      float = {
        border = "rounded",
        -- winhighlight = "Normal:CmpDocNormal",
      },
    },
    servers = {
      basedpyright = {
        settings = {
          -- ref: https://github.com/LazyVim/LazyVim/discussions/3350
          basedpyright = {
            analysis = {
              typeCheckingMode = "off", -- off|standard|strict
            },
          },
        },
      },
      -- not working, use .clangd file instead
      -- ref: https://clangd.llvm.org/config.html#clangtidy
      -- clangd = {
      --   settings = {
      --     clangd = {
      --       Diagnostics = { UnusedIncludes = "None" }, -- None|Strict
      --       -- UnusedIncludes = "Strict",
      --     },
      --   },
      -- },
    },
  },
}
