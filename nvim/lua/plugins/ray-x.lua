return {
  "ray-x/go.nvim",
  dependencies = { -- optional but recommended
    "ray-x/guihua.lua",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("go").setup({
      -- set up your formatting options, etc.
    })
  end,
}
