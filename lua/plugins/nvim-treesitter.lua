return {
  "nvim-treesitter/nvim-treesitter",
  -- build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  -- lazy = false,
  opts = {
    -- fold = {
    --   enable = true,
    -- },
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "bash",
      "c",
      "diff",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "printf",
      "python",
      "query",
      "regex",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
    -- ref: https://www.josean.com/posts/nvim-treesitter-and-textobjects
    textobjects = {
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]a"] = "@parameter.inner",
          ["]f"] = { query = "@call.outer", desc = "Next function call start" },
          ["]m"] = { query = "@function.outer", desc = "Next method/function def start" },
          -- ["]c"] = { query = "@class.outer", desc = "Next class start" },
          ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
          ["]l"] = { query = "@loop.outer", desc = "Next loop start" },
          ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
          ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
        },
        goto_next_end = {
          ["]A"] = "@parameter.inner",
          ["]F"] = { query = "@call.outer", desc = "Next function call end" },
          ["]M"] = { query = "@function.outer", desc = "Next method/function def end" },
          -- ["]C"] = { query = "@class.outer", desc = "Next class end" },
          ["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
          ["]L"] = { query = "@loop.outer", desc = "Next loop end" },
        },
        goto_previous_start = {
          ["[a"] = "@parameter.inner",
          ["[f"] = { query = "@call.outer", desc = "Prev function call start" },
          ["[m"] = { query = "@function.outer", desc = "Prev method/function def start" },
          -- ["[c"] = { query = "@class.outer", desc = "Prev class start" },
          ["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
          ["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
          ["[z"] = { query = "@fold", query_group = "folds", desc = "Prev fold" },
        },
        goto_previous_end = {
          ["[A"] = "@parameter.inner",
          ["[F"] = { query = "@call.outer", desc = "Prev function call end" },
          ["[M"] = { query = "@function.outer", desc = "Prev method/function def end" },
          -- ["[C"] = { query = "@class.outer", desc = "Prev class end" },
          ["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
          ["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
        },
      },
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["a="] = "@assignment.outer",
          ["i="] = "@assignment.inner",
          ["l="] = "@assignment.lhs",
          ["r="] = "@assignment.rhs",
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["ai"] = "@conditional.outer",
          ["ii"] = "@conditional.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
          ["am"] = "@function.outer",
          ["im"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["af"] = "@call.outer",
          ["if"] = "@call.inner",
        },
        selection_modes = {
          ["@parameter.outer"] = "v", -- charwise
          ["@function.outer"] = "V", -- linewise
          ["@class.outer"] = "<c-v>", -- blockwise
        },
        include_surrounding_whitespace = true,
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
          ["<leader>m"] = "@function.outer",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
          ["<leader>M"] = "@function.outer",
        },
      },
    },
  },
  -- config = function(_, opts)
  --   require("nvim-treesitter.configs").setup(opts)
  --   -- 檔案讀取完（Treesitter 開始解析）後，稍微延遲再執行 zx
  --   vim.api.nvim_create_autocmd("BufReadPost", {
  --     callback = function()
  --       -- 延遲 30 ms，等解析完再重算 fold
  --       vim.defer_fn(function()
  --         -- silent! 防止沒有 fold 時出現訊息
  --         pcall(vim.cmd, "silent! normal! zx")
  --       end, 30)
  --     end,
  --   })
  -- end,
}
