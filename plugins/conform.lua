return {
  "stevearc/conform.nvim",
  optional = true,
  opts = function(_, opts)
    local supported = {}

    -- prettier default
    supported["css"] = { "prettier" }
    supported["graphql"] = { "prettier" }
    supported["handlebars"] = { "prettier" }
    supported["html"] = { "prettier" }
    supported["javascript"] = { "prettier" }
    supported["javascriptreact"] = { "prettier" }
    supported["json"] = { "prettier" }
    supported["jsonc"] = { "prettier" }
    supported["less"] = { "prettier" }
    supported["markdown"] = { "prettier" }
    supported["markdown.mdx"] = { "prettier" }
    supported["scss"] = { "prettier" }
    supported["typescript"] = { "prettier" }
    supported["typescriptreact"] = { "prettier" }
    supported["vue"] = { "prettier" }
    supported["yaml"] = { "prettier" }

    -- python
    supported["python"] = { "black" }
    -- cmake
    supported["cmake"] = { "cmake_format" }

    opts.formatters_by_ft = opts.formatters_by_ft or {}
    -- end
    for ft, lsp in pairs(supported) do
      opts.formatters_by_ft[ft] = lsp
    end

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
