return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  enabled = false,
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
  },
}
