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

vim.o.shell = "zsh"
