return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  keys = {
    {
      "<leader>z",
      function()
        require("zen-mode").toggle()
      end,
      desc = "Zen Mode",
    },
    {
      "<leader>e",
      function()
        local zm = require("zen-mode")
        local was_zen = require("zen-mode.view").is_open()

        if was_zen then
          zm.close()
          vim.g._zen_before_explorer = true
        end

        require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
      end,
      desc = "Explorer (zen-aware)",
    },
  },
  opts = {
    window = {
      backdrop = 0.0,
      width = 86,
      height = 1,
      options = {
        signcolumn = "no",
        number = true,
        relativenumber = true,
        cursorline = true,
        cursorcolumn = false,
        foldcolumn = "0",
        list = false,
      },
    },
    plugins = {
      options = { enabled = true, ruler = true, showcmd = true },
      twilight = { enabled = false },
      gitsigns = { enabled = false },
      tmux = { enabled = false },
      bufferline = { enabled = true },
    },
  },
  config = function(_, opts)
    require("zen-mode").setup(opts)

    -- Re-enter zen when neo-tree closes (file selected or :q)
    require("neo-tree").config.event_handlers = vim.list_extend(require("neo-tree").config.event_handlers or {}, {
      {
        event = "neo_tree_window_after_close",
        handler = function()
          if vim.g._zen_before_explorer then
            vim.g._zen_before_explorer = false
            vim.schedule(function()
              require("zen-mode").open()
            end)
          end
        end,
      },
    })
  end,
}
