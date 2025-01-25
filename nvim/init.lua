-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.zettelkasten")
require("nvim-treesitter.configs").setup({
  ensure_installed = { "markdown", "markdown_inline" },
  highlight = { enable = true },
})
require('telekasten').setup({
  home = vim.fn.expand("~/zettelkasten"), -- Put the name of your notes directory here
})
