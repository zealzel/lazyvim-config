return {
  "williamboman/mason.nvim",
  opts = {
    ui = {
      border = "rounded",
    },
    ensure_installed = {
      "stylua",
      "bash-language-server",
      "shellcheck",
      "shfmt",
      "flake8",
      "black",
      -- "mypy",
    },
  },
}
