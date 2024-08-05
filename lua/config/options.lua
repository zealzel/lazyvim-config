-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
-- vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#FF0000" })
-- opt.pumblend = 0

opt.relativenumber = true
opt.scrolloff = 0
opt.modeline = false
opt.timeoutlen = 1000

-- vim.g.mkdp_auto_start = 0
-- vim.g.mkdp_auto_close = 0
-- vim.g.mkdp_browser = "firefox"
-- vim.g.maplocalleader = ","

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
vim.g.lazyvim_statuscolumn = {
  folds_open = true, -- show fold sign when fold is open, default: false
  folds_githl = false, -- highlight fold sign with git sign color, default: false
}

vim.o.shell = "zsh"

-- set python lsp as basedpyright instead of pyright
-- https://github.com/DetachHead/basedpyright
-- ref: https://github.com/LazyVim/LazyVim/discussions/3350
vim.g.lazyvim_python_lsp = "basedpyright"

-- vim.g.python3_host_prog = "/Users/zealzel/.pyenv/versions/3.9.11/bin/python3"
vim.g.python3_host_prog = "/Users/zealzel/.pyenv/versions/3.10.8/bin/python3"
-- vim.g.python3_host_prog = "/Users/zealzel/.pyenv/versions/3.11.6/bin/python3"
-- vim.g.python3_host_prog = "/Users/zealzel/.pyenv/versions/3.12.0/bin/python3"
-- vim.g.python3_host_prog = "/usr/local/bin/python3"

-- vim.opt.clipboard:append("unnamedplus")
-- vim.opt.clipboard:append("unnamedplus")
vim.opt.clipboard = "unnamed,unnamedplus"
