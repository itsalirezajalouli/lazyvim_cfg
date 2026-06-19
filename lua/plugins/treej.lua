return {
  "Wansmer/treesj",
  keys = {
    { "<leader>s", "<cmd>TSJSplit<cr>", desc = "Split to multiple lines" },
    { "<leader>j", "<cmd>TSJJoin<cr>",  desc = "Join to single line" },
  },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    use_default_keymaps = false,
    max_join_length = 80,
  },
}
