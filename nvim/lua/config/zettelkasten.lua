local function create_and_open_zk_note()
  ----------------------------------------------------------------
  -- 1) Adjust these paths as needed:
  ----------------------------------------------------------------
  local zettelkasten_root = "/Users/ARAJI/Library/Mobile Documents/iCloud~md~obsidian/Documents/Zettelkasten"
  local inbox_subdir = "0-inbox"

  ----------------------------------------------------------------
  -- 2) Get the current line and extract the [[title]]:
  ----------------------------------------------------------------
  local line = vim.api.nvim_get_current_line()
  local title = line:match("%[%[(.-)%]%]")

  if not title or title == "" then
    vim.notify("No title found between double square brackets", vim.log.levels.WARN)
    return
  end

  ----------------------------------------------------------------
  -- 3) Sanitize the title to create a safe filename:
  --    - Convert to lowercase
  --    - Replace groups of non-alphanumeric/underscore/dash with a single dash
  --    - Remove leading/trailing dashes
  --    - (Optionally) append '.md' if you want explicit extensions
  ----------------------------------------------------------------
  local sanitized_filename = title
    :lower() -- make lowercase
    :gsub("%s+", "-") -- replace spaces with dashes
    :gsub("[^%w%-_]", "-") -- replace invalid chars with dashes
    :gsub("%-+", "-") -- merge consecutive dashes
    :gsub("^%-", "") -- remove leading dash if any
    :gsub("%-$", "") -- remove trailing dash if any

  -- Optionally add extension (remove this line if zk already adds .md automatically):
  sanitized_filename = sanitized_filename .. ".md"

  ----------------------------------------------------------------
  -- 4) Build the `zk new` command:
  --    Passing the subdir (positional arg) for "0-inbox"
  --    `--notebook-dir` to specify your main ZK folder
  --    `-t` (or `--title`) for the note's title
  --    `--id` for the desired filename
  --    `-p` so it prints only the newly created file path
  ----------------------------------------------------------------
  local cmd = string.format(
    "zk new %q --notebook-dir=%q -t %q --id=%q -p",
    inbox_subdir,
    zettelkasten_root,
    title,
    sanitized_filename
  )

  ----------------------------------------------------------------
  -- 5) Execute the command and read its output (which should be the note’s path)
  ----------------------------------------------------------------
  local output = vim.fn.system(cmd)

  -- Clean up the path (remove newlines, carriage returns, etc.)
  local file_path = output:gsub("\r", ""):gsub("\n", ""):gsub("^%s*(.-)%s*$", "%1")

  ----------------------------------------------------------------
  -- 6) Check if we got a valid path:
  ----------------------------------------------------------------
  if file_path == "" then
    vim.notify("Failed to create note: " .. title .. "\nCommand output:\n" .. output, vim.log.levels.ERROR)
    return
  end

  ----------------------------------------------------------------
  -- 7) Open the newly created note in Neovim:
  ----------------------------------------------------------------
  vim.cmd("badd " .. vim.fn.fnameescape(file_path))
  local bufnr = vim.fn.bufnr(file_path)
  if bufnr > 0 then
    vim.api.nvim_set_current_buf(bufnr)
    vim.notify(
      "Created and opened new note:\nTitle: " .. title .. "\nFilename: " .. sanitized_filename,
      vim.log.levels.INFO
    )
  else
    vim.notify("Could not open new note buffer:\n" .. file_path, vim.log.levels.ERROR)
  end
end

-- Create a Vim command to call this function
vim.api.nvim_create_user_command("CreateAndOpenZkNote", create_and_open_zk_note, {})

-- Optional: Add a key mapping
vim.keymap.set("n", "<leader>zn", ":CreateAndOpenZkNote<CR>", { desc = "Create and open zk note" })

local function yank_and_search_markdown_link()
  vim.cmd("normal! yi]")
  local yanked_text = vim.fn.getreg('"')

  -- Remove the brackets if they were captured
  yanked_text = yanked_text:gsub("%[%[(.-)%]%]", "%1")

  if yanked_text ~= "" then
    -- Escape special characters for find_files
    yanked_text = vim.fn.escape(yanked_text, "\\.")

    require("telescope.builtin").find_files({
      search_file = yanked_text,
      hidden = true,
      no_ignore = true,
      follow = true,
    })
  else
    print("No text found inside brackets")
  end
end

vim.api.nvim_create_user_command("YankAndSearchMarkdownLink", yank_and_search_markdown_link, {})

vim.keymap.set(
  "n",
  "<leader>zo",
  ":YankAndSearchMarkdownLink<CR>",
  { desc = "Zet Open - Yank and search markdown link" }
)
