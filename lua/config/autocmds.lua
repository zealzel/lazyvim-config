-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })

vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=none]])
vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guibg=none]])

vim.api.nvim_set_hl(0, "LspInfoBorder", { fg = "#d5c4a1", bg = "NONE" })

-- # fix foldopen icon is not shown correctly. originally set to italic = true which causes the issue
vim.api.nvim_set_hl(0, "Folded", { fg = "#928374", bg = "#3c3836", italic = false })

-- vim.api.nvim_create_user_command("Upper", function(opts)
--   print(string.upper(opts.args))
-- end, { nargs = 1 })
--
-- vim.api.nvim_create_user_command("WTF", function()
--   print("WTF")
-- end, {})
