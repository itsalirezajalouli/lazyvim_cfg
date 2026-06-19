return {
  "folke/noice.nvim",
  opts = {
    views = {
      hover = {
        border = { style = "rounded" },
        position = { row = 2, col = 0 }, -- show below cursor, not above
        size = {
          max_height = 6,
          max_width = 80,
        },
        scrollbar = true,
      },
    },
    lsp = {
      signature = {
        enabled = true,
        opts = {
          border = { style = "rounded" },
          position = { row = 2, col = 0 }, -- below cursor
          size = {
            max_height = 4,
            max_width = 80,
          },
          scrollbar = true,
        },
      },
    },
  },
}
