return {
  { "ellisonleao/gruvbox.nvim" },
  {
    -- Configure LazyVim to load gruvbox
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
  { "sunaku/tmux-navigate" },
  { "nvimdev/lspsaga.nvim" },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = {
      window = {
        completion = {
          border = "rounded",
          winhighlight = "Normal:CmpDocNormal",
        },
        documentation = {
          border = "rounded",
          winhighlight = "Normal:CmpDocNormal",
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        float = {
          border = "rounded",
          -- winhighlight = "Normal:CmpDocNormal",
        },
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      window = {
        border = "rounded",
        -- winblend = 100, -- value between 0-100 0 for fully opaque and 100 for fully transparent
        -- winhighlight = "Normal:CmpDocNormal",
      },
    },
  },
  {
    -- Markdown preview
    -- ref: https://www.reddit.com/r/neovim/comments/10w4u51/comment/j7lpl9u/?utm_source=share&utm_medium=web2x&context=3
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "ellisonleao/glow.nvim",
    config = true,
    cmd = "Glow",
    opts = {
      -- width = 80,
      -- height = 100,
      width = 160,
      height = 200,
    },
  },
}
