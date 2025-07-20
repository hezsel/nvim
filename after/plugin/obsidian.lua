require("obsidian").setup({
  dir = "~/notes",
  daily_notes = {
    folder = "daily",
    date_format = "%Y-%m-%d",
    default_tags = { "daily-notes" },
  },
  ui = {
    enable = false,
  },
  completion = {
    nvim_cmp = true,
  },
  note_frontmatter_func = function(note)
    return {
      title = note.title,
      tags = { "obsidian" },
      created_at = os.date("%Y-%m-%d %H:%M:%S"),
      updated_at = os.date("%Y-%m-%d %H:%M:%S"),
    }
  end,
  -- Optional, customize how note IDs are generated given an optional title.
  ---@param title string|?
  ---@return string
  note_id_func = function(title)
    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    -- In this case a note with the title 'My new note' will be given an ID that looks
    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
    local suffix = ""
    if title ~= nil then
      -- If title is given, transform it into valid file name.
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else

      -- If title is nil, just add 4 random uppercase letters to the suffix.
      for _ = 1, 4 do

        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return tostring(os.time()) .. "-" .. suffix
  end,
  follow_url_func = function(url)
    -- Check if it's a local file (not an actual web URL)
    local path = vim.fn.expand(url)
    if vim.fn.filereadable(path) == 1 then
      vim.cmd("edit " .. path)  -- Open the JSON file in Neovim
    else
      -- Default behavior for web URLs
      vim.fn.jobstart({"xdg-open", url})  -- Linux (uses default browser)
      -- vim.fn.jobstart({"open", url})  -- macOS (uncomment for Mac)
    end
  end,
  mappings = {
    -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
    ["gf"] = {
      action = function()
        return require("obsidian").util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
    -- Toggle check-boxes.
    ["<S-CR>"] = {
      action = function()
        return require("obsidian").util.toggle_checkbox()
      end,
      opts = { buffer = true },
    },
    -- Smart action depending on context, either follow link or toggle checkbox.
    ["<cr>"] = {
      action = function()
        return require("obsidian").util.smart_action()
      end,
      opts = { buffer = true, expr = true },
    }
  },
})

vim.keymap.set("n", "<leader>o", ":ObsidianOpen<CR>")
-- vim.opt.conceallevel = 1

vim.keymap.set("n", "<leader>on", function()
  vim.cmd("set splitright")
  vim.cmd("vsplit")  -- Open new horizontal split
  vim.cmd("edit " .. vim.fn.expand("~/notes/index.md"))
  vim.cmd("lcd " .. vim.fn.expand("~/notes"))
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>ot", function()
  vim.cmd("tabnew " .. vim.fn.expand("~/notes/index.md"))
  vim.cmd("lcd " .. vim.fn.expand("~/notes"))
end, { noremap = true, silent = true })

