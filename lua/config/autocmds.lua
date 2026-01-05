-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- vim.api.nvim_create_user_command("Upper", function(opts)
--   print(string.upper(opts.args))
-- end, { nargs = 1 })
--
-- vim.api.nvim_create_user_command("WTF", function()
--   print("WTF")
-- end, {})

-- # fix foldopen icon is not shown correctly. originally set to italic = true which causes the issue
vim.api.nvim_set_hl(0, "Folded", { fg = "#928374", bg = "#3c3836", italic = false })

--  ==== disable spell check in markdown (2025/9) ====
-- ref:
-- https://github.com/LazyVim/LazyVim/discussions/392
-- https://github.com/LazyVim/LazyVim/discussions/392#discussioncomment-12683657
vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

--  ==== for markdown paste image 應用 ====
local cache_dir = vim.fn.stdpath("cache") .. "/snacks/image"

local function purge_image_cache()
  -- 刪除再重建資料夾，避免下一次寫入報錯
  vim.print("purge_image_cache")
  vim.fn.delete(cache_dir, "rf")
  vim.fn.mkdir(cache_dir, "p")
end

-- 避免重複註冊：用專屬 augroup
local grp = vim.api.nvim_create_augroup("SnacksImageNoCache", { clear = true })

-- 進入/離開 Neovim 都清一次
vim.api.nvim_create_autocmd({ "VimEnter", "VimLeavePre" }, {
  group = grp,
  callback = purge_image_cache,
  desc = "Purge Snacks image cache on enter/exit",
})

-- （可選）寫入這些文件時就清（依需求增減）
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   group = grp,
--   pattern = { "*.md", "*.markdown", "*.norg", "*.org", "*.rst", "*.html" },
--   callback = purge_image_cache,
--   desc = "Purge Snacks image cache on save",
-- })

-- 提供手動清快取的指令與快捷鍵
vim.api.nvim_create_user_command("SnacksImagePurge", purge_image_cache, {})
vim.keymap.set("n", "<leader>ic", purge_image_cache, { desc = "Snacks: 清空圖片快取" })

-- fix: neorg broken after neovim 0.11.4
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "norg", "neorg" },
  callback = function()
    if pcall(vim.treesitter.start) then
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
