return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  opts = {
    suggestion = { enabled = false },
    panel = { enabled = false },
    filetypes = {
      python = true,
      c = true,
      help = true,
      -- ["*"] = false,
    },
    -- copilot_node_command = vim.fn.expand("$HOME") .. "/root/.nvm/versions/node/v22.3.0/bin/node",
    copilot_node_command = vim.fn.expand("$HOME") .. "/.nvm/versions/node/" .. vim.fn
      .system("source $HOME/.nvm/nvm.sh && nvm current")
      :gsub("\n", "") .. "/bin/node",
  },
}
