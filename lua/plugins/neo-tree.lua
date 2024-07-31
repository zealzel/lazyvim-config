local log = require("plenary.log").new({
  plugin = "my-plugin",
  level = "debug",
})

local function get_relative_path(base, target)
  local base_parts = vim.split(base, "/")
  local target_parts = vim.split(target, "/")

  while #base_parts > 0 and #target_parts > 0 and base_parts[1] == target_parts[1] do
    table.remove(base_parts, 1)
    table.remove(target_parts, 1)
  end

  return string.rep("../", #base_parts) .. table.concat(target_parts, "/")
end

local function copy_path(state)
  -- ref: https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/370
  -- NeoTree is based on [NuiTree](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree)
  -- The node is based on [NuiNode](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree#nuitreenode)
  local current_work_dir = vim.fn.getcwd()
  local node = state.tree:get_node()
  local filepath = node:get_id()
  local filename = node.name
  local modify = vim.fn.fnamemodify
  local relative_path = get_relative_path(current_work_dir, filepath)
  -- log.debug("relative_path: " .. relative_path)
  local results = {
    filepath,
    get_relative_path(current_work_dir, filepath),
    -- modify(filepath, ":."),
    modify(filepath, ":~"),
    filename,
    modify(filename, ":r"),
    modify(filename, ":e"),
  }

  vim.ui.select({
    "1. Absolute path: " .. results[1],
    "2. Path relative to CWD: " .. results[2],
    "3. Path relative to HOME: " .. results[3],
    "4. Filename: " .. results[4],
    "5. Filename without extension: " .. results[5],
    "6. Extension of the filename: " .. results[6],
  }, { prompt = "Choose to copy to clipboard:" }, function(choice)
    if choice then
      local i = tonumber(choice:sub(1, 1))
      if i then
        local result = results[i]
        -- vim.fn.setreg('"', result)
        vim.fn.setreg("*", result)
        vim.fn.setreg("+", result)
        vim.notify("Copied: " .. result)
      else
        vim.notify("Invalid selection")
      end
    else
      vim.notify("Selection cancelled")
    end
  end)
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    default_component_configs = {
      name = {
        use_git_status_colors = true,
      },
    },
    window = {
      mappings = {
        ["Y"] = copy_path,
        -- Additional mappings
      },
    },
  },
}
