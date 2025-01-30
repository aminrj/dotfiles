-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("n", "<leader>p", '<cmd>lua require("cmp").setup { enabled = true }<cr>', { desc = "Enable completion" })
vim.keymap.set(
  "n",
  "<leader>P",
  '<cmd>lua require("cmp").setup { enabled = false }<cr>',
  { desc = "Disable completion" }
)

-- map esc to jk for laptop use
-- vim.keymap.set("i", "jk", "<Esc>", { desc = "Escape jk" })

-- insert the date in my desired configuration
vim.keymap.set("n", "<leader>d", "<cmd>r!gendate<cr>", { desc = "Insert date" })
vim.keymap.set("n", "<leader>h1", "<cmd>r!gendate h 1<cr>", { desc = "Insert date h1" })
vim.keymap.set("n", "<leader>h2", "<cmd>r!gendate h 2<cr>", { desc = "Insert date h2" })

-- lsp
vim.keymap.set("n", "<leader>S", "<cmd>LspStop<CR>", { desc = "LspStop" })

-- surrounding words
vim.keymap.set("n", "<leader>wsq", 'ciw""<Esc>P', { desc = "Word Surround Quotes" })

-- replaces
vim.keymap.set("n", "<leader>rbs", "<cmd>%s/\\//g<CR>", { desc = "Replace Backward Slash" })

-- telescope symbols
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope symbols<cr>", { desc = "Find Symbols" })

-- convert Current line to title cases
vim.keymap.set(
  "n",
  "<leader>rlt",
  "<cmd>lua require('textcase').current_word('to_title_case')<CR>",
  { desc = "Replace Line Title" }
)
-- vim.keymap.set("n", "<leader>rlt", "<cmd>s/<./\u&/g<cr>", { desc = "Replace Line Title" })

-- these keep the cursor in the middle when scrolling with ctrl d and u
-- from https://github.com/ThePrimeagen/init.lua
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- and these are for searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- nvim go related
vim.keymap.set("n", "<leader>gt", "<cmd>GoTest<CR>", { desc = "Go Test" })

-- snippets

vim.keymap.set("n", "<leader>hy", "i{{< youtube id >}}<Esc>", { desc = "Hugo Youtube" })

-- This will toggle [ ] to [x] with <leader>tt.
vim.api.nvim_set_keymap("n", "<leader>tt", "mz^f[lc x<ESC>`z", { noremap = true, silent = true })

-- Follow link in notes
vim.keymap.set("n", "<leader>tf", function()
  require("telekasten").follow_link()
end, { desc = "Follow Telekasten link" })

-- Telekasten keymaps

-- Launch panel if nothing is typed after <leader>z
vim.keymap.set("n", "<leader>z", "<cmd>Telekasten panel<CR>")

-- Most used functions
vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")
vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>")
vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")
vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>")
vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")
vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>")

-- Call insert link automatically when we start typing a link
vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")
