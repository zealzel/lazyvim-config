-- local color1_bg = "#f265b5"
-- local color2_bg = "#37f499"
-- local color3_bg = "#04d1f9"
-- local color4_bg = "#a48cf2"
-- local color5_bg = "#f1fc79"
-- local color6_bg = "#f7c67f"
-- local color_fg = "#323449"

local color1_bg = "#2e3440" -- 深藍灰色，穩定且適合 H1
local color2_bg = "#3b4252" -- 深灰藍色，較淺但依然有份量
local color3_bg = "#4c566a" -- 中性灰藍色，易於閱讀
local color4_bg = "#5e81ac" -- 柔和的藍色，提升辨識度
local color5_bg = "#81a1c1" -- 淺藍灰色，增加層次感
local color6_bg = "#a3be8c" -- 柔和的綠色，為最低層級提供對比
local color5_bg = "#7b8794" -- 比之前略深的灰藍色，保證清晰度
local color6_bg = "#9aa5b1" -- 明顯的灰藍色，讓H6更清晰
local color6_bg = "#b48ead" -- 柔和的紫灰色，與其他色調形成區別
local color_fg = "#e5e9f0" -- 柔和的淺灰白色，保持文字清晰易讀
local color_fg = "#c0c5ce" -- 更暗的中性灰色，減少眼睛疲勞

LazyVim.on_very_lazy(function()
  vim.filetype.add({
    extension = { mdx = "markdown.mdx" },
  })
end)

return {
  recommended = function()
    return LazyVim.extras.wants({
      ft = { "markdown", "markdown.mdx" },
      root = "README.md",
    })
  end,
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters = {
        ["markdown-toc"] = {
          condition = function(_, ctx)
            for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
              if line:find("<!%-%- toc %-%->") then
                return true
              end
            end
          end,
        },
        ["markdownlint-cli2"] = {
          condition = function(_, ctx)
            local diag = vim.tbl_filter(function(d)
              return d.source == "markdownlint"
            end, vim.diagnostic.get(ctx.buf))
            return #diag > 0
          end,
        },
      },
      formatters_by_ft = {
        -- ["markdown"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
        -- ["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
        ["markdown"] = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
      },
    },
  },
  { -- "williamboman/mason.nvim",
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "markdownlint-cli2", "markdown-toc" } },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = { "markdownlint-cli2" },
        -- markdown = { "markdownlint-cli2", "vale" },
        -- markdown = { "markdownlint-cli2", "markdown-toc" },
        -- markdown = { "vale", "write-good" },
      },
    },
  },
  { -- Markdown preview
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_markdown_css = vim.fn.expand("~/.dotfiles/lazyvim-config/github-markdown.css")
    end,
    keys = {
      {
        "<leader>mp",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
    config = function()
      vim.cmd([[do FileType]])
      vim.cmd([[
        function OpenMarkdownPreview (url)
            execute "silent ! open -a 'Google Chrome' -n --args --new-window " . a:url
        endfunction
      ]])
      vim.g.mkdp_browserfunc = "OpenMarkdownPreview"

      -- checkbox
      -- https://pierolescano.com/blog/a-picker-for-bullet-journal-style-checkboxes-for-neovim
      -- This is using nerd fonts, so you might not be able to see the icons.
      local checkboxes = {
        { char = " ", icon = "󰄱", label = "to-do" },
        { char = "/", icon = "", label = "in-progress" },
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

      local function check_checkbox()
        if vim.bo.filetype ~= "markdown" then
          return
        end
        local pattern = "%- %[.-%] "
        local line = vim.api.nvim_get_current_line()
        if not line:match(pattern) then
          return
        end
        local checkbox = "- [x] "
        local modified_line = line:gsub(pattern, checkbox, 1)
        vim.api.nvim_set_current_line(modified_line)
      end

      local function uncheck_checkbox()
        if vim.bo.filetype ~= "markdown" then
          return
        end
        local pattern = "%- %[.-%] "
        local line = vim.api.nvim_get_current_line()
        if not line:match(pattern) then
          return
        end
        local checkbox = "- [ ] "
        local modified_line = line:gsub(pattern, checkbox, 1)
        vim.api.nvim_set_current_line(modified_line)
      end

      vim.keymap.set("n", "<leader>mt", select_checkbox, { desc = "Select checkbox status" })
      vim.keymap.set("n", "<leader>md", check_checkbox, { desc = "Check checkbox" })
      vim.keymap.set("n", "<leader>mu", uncheck_checkbox, { desc = "Uncheck checkbox" })
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = true,
    -- render_modes = { "n", "c", "t" },
    -- render_modes = {},
    render_modes = false,
    -- render_modes = true,
    keys = {
      {
        "<leader>mm",
        ft = "markdown",
        "<cmd>RenderMarkdown toggle<cr>",
        desc = "Toggle RenderMarkdown",
      },
    },
    opts = {
      -- file_types = { "markdown", "norg", "rmd", "org", "Avante" },
      file_types = { "markdown", "norg", "rmd", "org", "Avante", "CodeCompanion" },
      sign = {
        -- Turn on / off sign rendering
        enabled = true,
        -- Applies to background of sign text
        highlight = "RenderMarkdownSign",
      },
      code = {
        -- Turn on / off code block & inline code rendering
        enabled = true,
        -- Turn on / off any sign column related rendering
        sign = true,
        -- Determines how code blocks & inline code are rendered:
        --  none: disables all rendering
        --  normal: adds highlight group to code blocks & inline code, adds padding to code blocks
        --  language: adds language icon to sign column if enabled and icon + name above code blocks
        --  full: normal + language
        style = "full",
        -- Amount of padding to add to the left of code blocks
        left_pad = 0,
        -- Amount of padding to add to the right of code blocks when width is 'block'
        right_pad = 0,
        -- Width of the code block background:
        --  block: width of the code block
        --  full: full width of the window
        width = "full",
        -- Determins how the top / bottom of code block are rendered:
        --  thick: use the same highlight as the code body
        --  thin: when lines are empty overlay the above & below icons
        border = "thick",
        -- Used above code blocks for thin border
        above = "▀",
        below = "▄",
        -- above = "▄",
        -- below = "▀",
        --
        -- above = "▄",
        -- below = "▄",
        -- Used below code blocks for thin border
        -- above = "▀",
        -- below = "▀",
        -- Highlight for code blocks & inline code
        highlight = "RenderMarkdownCode",
        highlight_inline = "RenderMarkdownCodeInline",
      },
      anti_conceal = {
        -- This enables hiding any added text on the line the cursor is on
        -- This does have a performance penalty as we must listen to the 'CursorMoved' event
        enabled = false,
      },
      pipe_table = {
        -- Turn on / off pipe table rendering
        enabled = true,
        -- Pre configured settings largely for setting table border easier
        --  heavy:  use thicker border characters
        --  double: use double line border characters
        --  round:  use round border corners
        --  none:   does nothing
        preset = "normal",
        -- Determines how the table as a whole is rendered:
        --  none:   disables all rendering
        --  normal: applies the 'cell' style rendering to each row of the table
        --  full:   normal + a top & bottom line that fill out the table when lengths match
        style = "full",
        -- Determines how individual cells of a table are rendered:
        --  overlay: writes completely over the table, removing conceal behavior and highlights
        --  raw:     replaces only the '|' characters in each row, leaving the cells unmodified
        --  padded:  raw + cells are padded with inline extmarks to make up for any concealed text
        cell = "padded",
        -- Gets placed in delimiter row for each column, position is based on alignmnet
        alignment_indicator = "━",
        -- Characters used to replace table border
        -- Correspond to top(3), delimiter(3), bottom(3), vertical, & horizontal
        -- stylua: ignore
        border = {
            '┌', '┬', '┐',
            '├', '┼', '┤',
            '└', '┴', '┘',
            '│', '─',
        },
        -- Highlight for table heading, delimiter, and the line above
        head = "RenderMarkdownTableHead",
        -- Highlight for everything else, main table rows and the line below
        row = "RenderMarkdownTableRow",
        -- Highlight for inline padding used to add back concealed space
        filler = "RenderMarkdownTableFill",
      },
      checkbox = {
        enabled = true,
        checked = {
          icon = "󰱒 ",
        },
        unchecked = {
          icon = "󰄱 ",
        },
        custom = {
          in_progress = { raw = "[/]", rendered = " " }, -- 進行中
          -- 緊急度三檔（全線條）
          urgency_med = { raw = "[!]", rendered = "󰀪 " }, -- alert-circle-outline（若缺字，用 "! "）
          urgency_high = { raw = "[!!]", rendered = "󰀦 " }, -- alert-outline（三角形線條，若缺字，用 "!! "）
          urgency_low = { raw = "[i]", rendered = "󰋽 " }, -- information-outline（若缺字，用 "i "）
          -- - 重要程度（P1 / P2 / P3）
          importance_high = { raw = "[P1]", rendered = "󰎤 " }, -- 1-circle-outline
          importance_med = { raw = "[P2]", rendered = "󰎥 " }, -- 2-circle-outline
          importance_low = { raw = "[P3]", rendered = "󰎦 " }, -- 3-circle-outline
        },
      },
      heading = {
        sign = true,
        position = "overlay", -- inline | overlay
        width = "full", -- | block | full
        icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },

        -- Heading colors (when not hovered over), extends through the entire line
        vim.cmd(string.format([[highlight Headline1Bg guifg=%s guibg=%s]], color_fg, color1_bg)),
        vim.cmd(string.format([[highlight Headline2Bg guifg=%s guibg=%s]], color_fg, color2_bg)),
        vim.cmd(string.format([[highlight Headline3Bg guifg=%s guibg=%s]], color_fg, color3_bg)),
        vim.cmd(string.format([[highlight Headline4Bg guifg=%s guibg=%s]], color_fg, color4_bg)),
        vim.cmd(string.format([[highlight Headline5Bg guifg=%s guibg=%s]], color_fg, color5_bg)),
        vim.cmd(string.format([[highlight Headline6Bg guifg=%s guibg=%s]], color_fg, color6_bg)),

        -- Highlight for the heading and sign icons (symbol on the left)
        -- I have the sign disabled for now, so this makes no effect
        vim.cmd(string.format([[highlight Headline1Fg cterm=bold gui=bold guifg=%s]], color1_bg)),
        vim.cmd(string.format([[highlight Headline2Fg cterm=bold gui=bold guifg=%s]], color2_bg)),
        vim.cmd(string.format([[highlight Headline3Fg cterm=bold gui=bold guifg=%s]], color3_bg)),
        vim.cmd(string.format([[highlight Headline4Fg cterm=bold gui=bold guifg=%s]], color4_bg)),
        vim.cmd(string.format([[highlight Headline5Fg cterm=bold gui=bold guifg=%s]], color5_bg)),
        vim.cmd(string.format([[highlight Headline6Fg cterm=bold gui=bold guifg=%s]], color6_bg)),
        vim.api.nvim_set_hl(0, "RenderMarkdownCode", { fg = "NONE", bg = "#202020" }),
        -- vim.api.nvim_set_hl(0, "@neorg.tags.ranged_verbatim.code_block", { fg = "NONE", bg = "#202020" }),

        backgrounds = {
          "Headline1Bg",
          "Headline2Bg",
          "Headline3Bg",
          "Headline4Bg",
          "Headline5Bg",
          "Headline6Bg",
        },
        foregrounds = {
          "Headline1Fg",
          "Headline2Fg",
          "Headline3Fg",
          "Headline4Fg",
          "Headline5Fg",
          "Headline6Fg",
        },
      },
    },
    -- ft = { "markdown", "norg", "rmd", "org" },
    ft = { "markdown", "Avante", "norg" },
    config = function(_, opts)
      require("render-markdown").setup(opts)
      -- LazyVim.toggle.map("<leader>um", {
      --   name = "Render Markdown",
      --   get = function()
      --     return require("render-markdown.state").enabled
      --   end,
      --   set = function(enabled)
      --     local m = require("render-markdown")
      --     if enabled then
      --       m.enable()
      --     else
      --       m.disable()
      --     end
      --   end,
      -- })
    end,
  },
}
