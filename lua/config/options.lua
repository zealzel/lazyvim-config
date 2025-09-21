-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- vim.cmd([[autocmd! ColorScheme * highlight CmpNormal guibg=#ff0000]])
-- vim.cmd([[autocmd! ColorScheme * highlight CmpDocNormal guifg=#ffffff guibg=#00ff00]])

vim.g.lazyvim_picker = "snacks" -- snacks.smart can preivew image files

vim.api.nvim_set_hl(0, "CmpNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpDocNormal", { bg = "NONE" })

vim.api.nvim_set_hl(0, "LspInfoBorder", { fg = "#d5c4a1", bg = "NONE" })

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
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" --- https://github.com/LazyVim/LazyVim/issues/1319
opt.foldlevel = 99
-- opt.foldenable = false
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

vim.g.lazyvim_check_order = false

-- vim.opt.clipboard:append("unnamedplus")
-- vim.opt.clipboard:append("unnamedplus")
vim.opt.clipboard = "unnamed,unnamedplus"

-- vim.opt.conceallevel = 2
vim.opt.conceallevel = 0
vim.opt.concealcursor = ""

opt.laststatus = 3

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dbout",
  callback = function()
    vim.wo.foldenable = false
  end,
})

-- vim.api.nvim_set_keymap(
--   "v",
--   "<leader>O",
--   [[:'<,'>w !xargs -n 1 -I {} open -a "Google Chrome" {}<CR>]],
--   { noremap = true, silent = true }
-- )

-- vim.api.nvim_set_keymap(
--   "v",
--   "<leader>o",
--   [[:'<,'>w !open -na "Google Chrome" --args --new-window $(cat)<CR>]],
--   { noremap = true, silent = true }
-- )

-- select multiple lines of urls, and open using google chrome. provide by chatgpt
-- ex: url followed by a description enclosed in square brackets
-- https://www.google.com [google site]
-- https://abc.com.tw [this is a dummy site]

vim.api.nvim_set_keymap(
  "v",
  "<leader>O",
  [[:'<,'>lua OpenUrlsFromSelectionAppend()<CR>]],
  { noremap = true, silent = true }
)

function OpenUrlsFromSelectionAppend()
  local start_line, end_line = vim.fn.line("'<"), vim.fn.line("'>")
  local lines = vim.fn.getline(start_line, end_line)
  -- 確保 lines 是表格格式
  if type(lines) == "string" then
    lines = { lines }
  end
  local urls = {}
  for _, line in ipairs(lines) do
    -- 提取URL（忽略描述部分）
    local url = line:match("^%s*(https?://[%w%p]+)%s*")
    if url then
      -- 對 URL 進行引號包裹，避免特殊字符影響
      table.insert(urls, url)
    end
  end
  if #urls > 0 then
    -- 構造系統命令：使用 --new-tab 打開 URL
    for _, url in ipairs(urls) do
      local cmd = string.format("open -a 'Google Chrome' '%s'", url)
      print("Executing: " .. cmd) -- 調試資訊
      vim.fn.system(cmd)
    end
  else
    print("No valid URLs found in selection!")
  end
end

vim.api.nvim_set_keymap("v", "<leader>o", [[:'<,'>lua OpenUrlsFromSelection()<CR>]], { noremap = true, silent = true })
function OpenUrlsFromSelection()
  local start_line, end_line = vim.fn.line("'<"), vim.fn.line("'>")
  local lines = vim.fn.getline(start_line, end_line)
  -- 確保 lines 是表格格式
  if type(lines) == "string" then
    lines = { lines }
  end
  local urls = {}
  for _, line in ipairs(lines) do
    -- 提取URL（忽略描述部分）
    local url = line:match("^%s*(https?://[%w%p]+)%s*")
    if url then
      -- 用單引號包裹URL
      table.insert(urls, "'" .. url .. "'")
    end
  end
  if #urls > 0 then
    -- 將URL列表拼接成單一命令，打開Chrome
    local cmd = "open -na 'Google Chrome' --args --new-window " .. table.concat(urls, " ")
    print("Executing: " .. cmd) -- 調試資訊
    vim.fn.system(cmd)
  else
    print("No valid URLs found in selection!")
  end
end

vim.api.nvim_set_keymap("v", "<leader>p", [[:'<,'>lua OpenPDFsFromSelection()<CR>]], { noremap = true, silent = true })
function OpenPDFsFromSelection()
  -- 獲取選中區域的行數範圍
  local start_line, end_line = vim.fn.line("'<"), vim.fn.line("'>")
  -- 獲取選中的文字行
  local lines = vim.fn.getline(start_line, end_line)
  -- 確保 lines 是表格格式
  if type(lines) == "string" then
    lines = { lines }
  end
  local pdf_files = {}
  for _, line in ipairs(lines) do
    -- 提取 PDF 檔案路徑，假設檔案路徑以 ".pdf" 結尾
    local pdf_path = line:match("^%s*(.-%.pdf)%s*$")
    if pdf_path then
      table.insert(pdf_files, "'" .. pdf_path .. "'")
    end
  end
  if #pdf_files > 0 then
    for i = 1, #pdf_files do
      local cmd = "open -a 'PDF Expert' " .. pdf_files[i]
      print("Executing: " .. cmd) -- 調試資訊
      vim.fn.system(cmd)
    end
  else
    print("No valid PDF files found in selection!")
  end
end

vim.g.augment_workspace_folders = {
  "/Users/zealzel/Documents/Codes/Current/ssi/python+rust/facty_audio_python_module",
}

-- checkbox
-- https://pierolescano.com/blog/a-picker-for-bullet-journal-style-checkboxes-for-neovim
-- This is using nerd fonts, so you might not be able to see the icons.
local checkboxes = {
  { char = " ", icon = "󰄱", label = "to-do" },
  { char = "/", icon = "", label = "in-progress" },
  { char = "x", icon = "󰱒", label = "done" },
}

local function select_checkbox()
  if vim.bo.filetype ~= "markdown" then
    return
  end

  local pattern = "%- %[.-%] "

  local line = vim.api.nvim_get_current_line()
  if not line:match(pattern) then
    return
  end

  vim.ui.select(checkboxes, {
    prompt = "Checkboxes:",
    format_item = function(item)
      return string.format("%s %s", item.icon, item.label)
    end,
  }, function(choice)
    if not choice then
      return
    end

    local checkbox = string.format("- [%s] ", choice.char)
    local modified_line = line:gsub(pattern, checkbox, 1)
    vim.api.nvim_set_current_line(modified_line)
  end)
end

vim.keymap.set("n", "<leader>tt", select_checkbox)
