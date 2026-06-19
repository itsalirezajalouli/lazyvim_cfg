return {
  -- Install rose-pine
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000, -- load before everything else
    opts = {
      styles = {
        transparency = true, -- replaces the ColorMyPencils bg = none trick
      },
    },
  },

  -- Tell LazyVim to use it
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
