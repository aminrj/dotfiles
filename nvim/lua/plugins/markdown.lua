return {
  {
    "preservim/vim-markdown",
    dependencies = "godlygeek/tabular",
    config = function()
      vim.g.vim_markdown_folding_disabled = 0
      vim.g.vim_markdown_conceal = 1
      vim.g.vim_markdown_strikethrough = 1
    end,
  },
  {
    "dkarter/bullets.vim",
    ft = { "markdown", "text" },
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  -- {
  --   "lukas-reineke/headlines.nvim",
  --   dependencies = "nvim-treesitter/nvim-treesitter",
  --   config = function()
  --     require("headlines").setup({
  --       markdown = {
  --         headline_highlights = { "Headline1", "Headline2", "Headline3" },
  --         checkbox_highlights = { "Checkbox" },
  --       },
  --     })
  --   end,
  -- },
}
