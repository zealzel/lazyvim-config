return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "onsails/lspkind.nvim",
  },
  opts = function(_, opts)
    local lspkind = require("lspkind")
    opts.window = {
      completion = { border = "rounded", winhighlight = "Normal:CmpDocNormal" },
      documentation = { border = "rounded", winhighlight = "Normal:CmpDocNormal" },
    }
    opts.sources = vim.list_extend(opts.sources or {}, {
      { name = "buffer" },
      { name = "supermaven" },
    })
    opts.formatting = {
      format = lspkind.cmp_format({
        -- mode = "symbol", -- show only symbol annotations
        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        show_labelDetails = true, -- show labelDetails in menu. Disabled by default
        symbol_map = {
          Supermaven = "",
        },
        before = function(entry, vim_item)
          return vim_item
        end,
      }),
    }
  end,
}
