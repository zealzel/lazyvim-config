return {
  "nvim-neorg/neorg",
  dependencies = {
    "luarocks.nvim",
    { "nvim-lua/plenary.nvim" },
    { "nvim-neorg/neorg-telescope" },
  },
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = "*", -- Pin Neorg to the latest stable release
  config = function()
    vim.keymap.set( "n", "\\f", "<Plug>(neorg.telescope.insert_file_link)", { desc = "Insert file link" })
    require("neorg").setup({
      configure_parsers = true,
      install_parsers = true,
      load = {
        ["core.defaults"] = {},
        -- ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.concealer"] = {
          config = {
            folds = true,
            -- icon_preset = "diamond",
            icon_preset = "varied",
            icons = {
              code_block = {
                conceal = true,
                width = "content", -- content or fullwidth
                content_only = true,
                min_width = 85,
                highlight = "RenderMarkdownCode",
                padding = {
                  left = 0,
                  right = 0,
                },
              },
              -- ordered = {
              --     icons = { "item 1.", "[0]", "A.", "a.", "§ 1)", "I.", "i.", "⒈", "⑴", "Ⓐ", "ⓐ" },
              -- },
              -- list = {
              --     icons = { "*", " +", "  -", "   >" },
              -- },
            },
          },
        }, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/notes",
              tests = "~/vaults/neorg/tests",
            },
            default_workspace = "notes",
          },
        },
        ["core.export"] = {},
        ["core.latex.renderer"] = {},
        -- config = {
        --     conceal = true,
        --     scale = 1,
        --     render_on_enter = true,
        --     renderer = "core.integrations.image",
        -- }
        -- },
        ["core.export.markdown"] = {
          config = {
            extension = "md",
            extensions = "all",
          },
        },
        ["core.summary"] = {
          config = {
            strategy = "default",
          },
        },
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
            name = "[Neorg]",
          },
        },
        ["core.presenter"] = {
          config = {
            zen_mode = "zen-mode",
          },
        },
        ["core.integrations.telescope"] = {
          config = {
            insert_file_link = {
              -- Whether to show the title preview in telescope. Affects performance with a large
              -- number of files.
              show_title_preview = false,
            },
          },
        },
      },
      highlight = { enable = true },
    })
  end,
}
