return {
  "williamboman/mason.nvim",
  opts = {
    ui = {
      border = "rounded",
    },
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
      "black",
      "mypy",
    },
  },
}
