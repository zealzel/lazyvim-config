return {
  "stevearc/conform.nvim",
  optional = true,
  opts = function(_, opts)
    local supported = {}

    -- python
    supported["python"] = { "black" }

    -- cmake
    -- supported["cmake"] = { "cmake_format" }

    opts.formatters_by_ft = opts.formatters_by_ft or {}
    -- end
    for ft, lsp in pairs(supported) do
      opts.formatters_by_ft[ft] = lsp
    end
  end,
}
