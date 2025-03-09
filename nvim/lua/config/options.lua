-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- try this: vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

opt.ignorecase = true

-- scrolling
opt.number = false
opt.relativenumber = false
opt.scrolloff = 8

-- wrap / break

opt.textwidth = 80
opt.linebreak = true

-- indentation

-- o.expandtab = true              -- convert tabs to spaces
-- o.tabstop = 4                   -- insert 4 spaces for a tab
-- o.shiftwidth = 4                -- the number of spaces inserted for each indentation
-- o.smartindent = true

-- windows
-- vim.o.splitbelow = true
-- vim.o.splitright = true

-- completion
-- vim.o.timeoutlen = 300 -- time to wait for a mapped sequence to complete
--
-- g.vim_markdown_conceal = 0
--
--
-- opt.vim_markdown_conceal = 0
--
-- vim.g.mkdp_browser = "/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge"

vim.g.lazygit_config = false

vim.g.snacks_animate = false

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Markdown preview enhanced
-- vim.g.mkdp_browser = "firefox" -- Change this to your preferred browser
-- vim.g.mkdp_preview_options = {
--   mkit = {},
--   katex = {},
--   uml = {},
--   maid = {},
--   disable_sync_scroll = 0,
--   sync_scroll_type = "middle",
--   hide_yaml_meta = 1,
--   sequence_diagrams = {},
--   flowchart_diagrams = {},
--   content_editable = false,
--   disable_filename = 0,
--   toc = {},
--   revealjs = {
--     theme = "black", -- You can use 'white', 'black', 'league', etc.
--     transition = "slide", -- Choose from 'none', 'fade', 'slide', 'convex', 'concave', 'zoom'
--     width = 1280,
--     height = 720,
--     controls = true,
--     progress = true,
--     history = true,
--     keyboard = true,
--     overview = true,
--     center = true,
--   },
-- }
