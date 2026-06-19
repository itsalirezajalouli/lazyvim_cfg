-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ── 1. Navigation & editing feel ─────────────────────────────────────────────

-- Move lines up/down
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")

-- Stay in visual mode after indent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Join line but keep cursor position
vim.keymap.set("n", "J", "mzJ`z")

-- Half-page jump + center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search next/prev + center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Top/bottom + center
vim.keymap.set("n", "gg", "ggzz", { noremap = true })
vim.keymap.set("n", "G", "Gzz", { noremap = true })

-- ── 2. System clipboard by default ───────────────────────────────────────────

vim.keymap.set("n", "y", '"+y')
vim.keymap.set("v", "y", '"+y')
vim.keymap.set("n", "Y", '"+Y')
vim.keymap.set("n", "d", '"+d')
vim.keymap.set("v", "d", '"+d')

-- ── 3. Paste without clobbering register ─────────────────────────────────────

vim.keymap.set("x", "<leader>p", '"_dP')

-- ── 4. Swapped number row ────────────────────────────────────────────────────
-- Layout (insert + normal):
--   Physical key  →  Output
--   1..0          →  !@#$%^&*()    (shifted symbols)
--   !@#$%^&*(     →  123456789     (back to numbers)
--   )             →  0
--
-- Insert mode special 3-way cycle:
--   @  →  2  (physical @ gives digit 2)
--   2  →  :  (physical 2 gives colon)
--   :  →  @  (physical : gives @)
--
-- Normal mode:
--   :  ↔  ;   (command line on semicolon, repeat f/t on colon)
--   2  ↔  @   (@ runs macro, 2 is easier to reach)
--   r  ↔  R   (swap single-char and replace-mode)

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Insert mode: numbers ↔ symbols
keymap("i", "!", "1", opts)
keymap("i", "1", "!", opts)
keymap("i", "#", "3", opts)
keymap("i", "3", "#", opts)
keymap("i", "$", "4", opts)
keymap("i", "4", "$", opts)
keymap("i", "%", "5", opts)
keymap("i", "5", "%", opts)
keymap("i", "^", "6", opts)
keymap("i", "6", "^", opts)
keymap("i", "&", "7", opts)
keymap("i", "7", "&", opts)
keymap("i", "*", "8", opts)
keymap("i", "8", "*", opts)
keymap("i", "(", "9", opts)
keymap("i", ")", "0", opts)
keymap("i", "0", ")", opts)

-- Insert mode: 3-way cycle  @→2  2→:  :→@
keymap("i", "@", "2", opts)
keymap("i", "2", ":", opts)
keymap("i", ":", "@", opts)

-- Normal mode: numbers ↔ symbols
keymap("n", "!", "1", opts)
keymap("n", "1", "!", opts)
keymap("n", "#", "3", opts)
keymap("n", "3", "#", opts)
keymap("n", "$", "4", opts)
keymap("n", "4", "$", opts)
keymap("n", "%", "5", opts)
keymap("n", "5", "%", opts)
keymap("n", "^", "6", opts)
keymap("n", "6", "^", opts)
keymap("n", "&", "7", opts)
keymap("n", "7", "&", opts)
keymap("n", "*", "8", opts)
keymap("n", "8", "*", opts)
keymap("n", "(", "9", opts)
keymap("n", ")", "0", opts)
keymap("n", "0", ")", opts)

-- Normal mode: 2 ↔ @
keymap("n", "2", "@", opts)
keymap("n", "@", "2", opts)

-- Normal mode: : ↔ ;
keymap("n", ":", ";", opts)
keymap("n", ";", ":", opts)

-- Swap r / R
keymap("n", "r", "R", opts)
keymap("n", "R", "r", opts)

-- Swap - and _ in insert
keymap("i", "-", "_", opts)
keymap("i", "_", "-", opts)

vim.keymap.set("n", "E", function()
  vim.diagnostic.open_float({
    border = "rounded",
    max_height = 4,
    max_width = 80,
    close_events = { "CursorMoved", "BufHidden", "InsertLeave" },
  })
end, { noremap = true, silent = true, desc = "Open diagnostic float" })

vim.keymap.set("i", "9", function()
  local keys = vim.api.nvim_replace_termcodes("()<Left>", true, false, true)
  vim.api.nvim_feedkeys(keys, "n", false)
  vim.defer_fn(function()
    vim.lsp.buf.signature_help()
  end, 1)
end, { noremap = true, silent = true })
