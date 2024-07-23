return {
  "nvim-lualine/lualine.nvim",
  -- config = function()
  --   require("lualine").setup({
  opts = {
    options = {
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        { "branch", color = { fg = "yellow" } },
        LazyVim.lualine.root_dir(),
        -- { "filetype", icon_only = false, separator = "", padding = { left = 1, right = 0 } },
        { LazyVim.lualine.pretty_path() },
      },
      lualine_c = {
        {
          "diff",
          symbols = {
            added = LazyVim.config.icons.git.added,
            modified = LazyVim.config.icons.git.modified,
            removed = LazyVim.config.icons.git.removed,
          },
          source = function()
            local gitsigns = vim.b.gitsigns_status_dict
            if gitsigns then
              return {
                added = gitsigns.added,
                modified = gitsigns.changed,
                removed = gitsigns.removed,
              }
            end
          end,
        },
      },
      lualine_x = {
        {
          "diagnostics",
          sources = { "nvim_diagnostic", "nvim_lsp" },
          symbols = {
            error = LazyVim.config.icons.diagnostics.Error,
            warn = LazyVim.config.icons.diagnostics.Warn,
            info = LazyVim.config.icons.diagnostics.Info,
            hint = LazyVim.config.icons.diagnostics.Hint,
          },
        },
      },
      lualine_y = {
        { "progress", separator = " ", padding = { left = 1, right = 0 } },
        { "location", padding = { left = 0, right = 1 } },
      },
      lualine_z = {
        function()
          return " " .. os.date("%R")
        end,
      },
    },
  },
  --   })
  -- end,
}
