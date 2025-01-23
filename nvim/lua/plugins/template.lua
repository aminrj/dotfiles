return {
  "nvimdev/template.nvim",
  opts = {
    -- temp_dir = "~/nvim/templates", -- Set your template directory
    -- author = "Amine Raji", -- Optional: Add your name for placeholders
    -- email = "your.email@example.com",
  },
  config = function()
    require("template").setup({
      temp_dir = "/Users/ARAJI/Library/Mobile Documents/iCloud~md~obsidian/Documents/Zettelkasten/templates",
    })
  end,
}
