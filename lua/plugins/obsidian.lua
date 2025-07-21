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

return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local obsidian = require("obsidian")

      obsidian.setup({
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
        note_id_func = function(title)
          local suffix = ""
          if title ~= nil then
            suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
          else
            for _ = 1, 4 do
              suffix = suffix .. string.char(math.random(65, 90))
            end
          end
          return tostring(os.time()) .. "-" .. suffix
        end,
        follow_url_func = function(url)
          local path = vim.fn.expand(url)
          if vim.fn.filereadable(path) == 1 then
            vim.cmd("edit " .. path)
          else
            vim.fn.jobstart({ "xdg-open", url }) -- for Linux
          end
        end,
        mappings = {
          ["gf"] = {
            action = function()
              return obsidian.util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true },
          },
          ["<S-CR>"] = {
            action = function()
              return obsidian.util.toggle_checkbox()
            end,
            opts = { buffer = true },
          },
          ["<CR>"] = {
            action = function()
              return obsidian.util.smart_action()
            end,
            opts = { buffer = true, expr = true },
          },
        },
      })
    end,
  }
}
