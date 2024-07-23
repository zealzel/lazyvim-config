return {
  "williamboman/mason.nvim",
  opts = {
    ui = {
      border = "rounded",
    },
    ensure_installed = {
      "bash-language-server",
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
      "black",
      -- "mypy",
    },
  },
}
