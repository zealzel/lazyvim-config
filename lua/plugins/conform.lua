return {
  "stevearc/conform.nvim",
  optional = true,
  opts = function(_, opts)
    -- prettier default
    local supported = {
      "css",
      "graphql",
      "handlebars",
      "html",
      "javascript",
      "javascriptreact",
      "json",
      "jsonc",
      "less",
      "markdown",
      "markdown.mdx",
      "scss",
      "typescript",
      "typescriptreact",
      "vue",
      "yaml",
    }
    opts.formatters_by_ft = opts.formatters_by_ft or {}
    for _, ft in ipairs(supported) do
      opts.formatters_by_ft[ft] = { "prettier" }
    end
    opts.formatters = opts.formatters or {}
    opts.formatters.prettier = {
      -- condition = function(_, ctx)
      --   return M.has_parser(ctx) and (vim.g.lazyvim_prettier_needs_config ~= true or M.has_config(ctx))
      -- end,
    }
  end,
}
