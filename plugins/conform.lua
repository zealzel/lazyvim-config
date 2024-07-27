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
    -- opts.formatters_by_ft = {
    --   cmake = { "cmake_format" },
    -- }

    opts.formatters = opts.formatters or {}
    opts.formatters.prettier = {
      -- condition = function(_, ctx)
      --   return M.has_parser(ctx) and (vim.g.lazyvim_prettier_needs_config ~= true or M.has_config(ctx))
      -- end,
    }
    -- cmake_format detailed config does not work using conform.nvim. use none-ls instead.
    -- below are failed trails
    --
    -- opts.formatters = {
    --   cmake_format = {
    --     -- condition = function(_, ctx)
    --     --   return vim.fs.find({ "cmakeformat.yml" }, { path = ctx.filename, upward = true })[1]
    --     -- end,
    --     command = "cmake-format",
    --     args = { "--tab-size", 4 },
    --   },
    -- }
    -- opts.formatters.cmake_format = {
    --   -- condition = function(_, ctx)
    --   --   return vim.fs.find({ "cmakeformat.yml" }, { path = ctx.filename, upward = true })[1]
    --   -- end,
    --   command = "cmake-format",
    --   args = "--tab-size=4",
    -- }
  end,
}
