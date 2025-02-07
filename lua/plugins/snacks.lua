return {
  "folke/snacks.nvim",
  event = "VeryLazy",
  opts = {
    -- dashaboard = { example = "github" },
    -- dashboard = {
    --   sections = {
    --     {
    --       section = "terminal",
    --       cmd = "chafa ~/Downloads/4k-desktop-bg/avatar04.png --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1",
    --       height = 17,
    --       padding = 1,
    --     },
    --     {
    --       pane = 2,
    --       { section = "keys", gap = 1, padding = 1 },
    --       { section = "startup" },
    --     },
    --   },
    -- },
    -- dashboard = {
    --   sections = {
    --     { section = "header", pand = 1 },
    --     { section = "keys", gap = 1, padding = 1 },
    --     { section = "startup" },
    --     {
    --       section = "terminal",
    --       cmd = "ascii-image-converter ~/Downloads/4k-desktop-bg/avatar04.png -C -c",
    --       -- random = 10,
    --       pane = 2,
    --       -- indent = 4,
    --       height = 30,
    --       padding = 1,
    --     },
    --   },
    -- },
    dashboard = {
      sections = {
        { section = "header" },
        -- {
        --   pane = 2,
        --   section = "terminal",
        --   cmd = "colorscript -e square",
        --   height = 5,
        --   padding = 1,
        -- },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "hub status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = "startup" },
      },
    },
    -- dashboard = {
    --   sections = {
    --     { section = "header" },
    --     { section = "keys", gap = 1, padding = 1 },
    --     { section = "startup" },
    --     {
    --       section = "terminal",
    --       cmd = "pokemon-colorscripts -r --no-title; sleep .1",
    --       random = 10,
    --       pane = 2,
    --       indent = 4,
    --       height = 30,
    --     },
    --   },
    -- },
  },
}
