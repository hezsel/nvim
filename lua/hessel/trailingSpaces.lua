local opt = vim.opt
local cmd = vim.cmd
local api = vim.api
local nvim_create_autocmd = api.nvim_create_autocmd
local nvim_set_hl = api.nvim_set_hl

-- Enable list mode to allow custom whitespace rendering
opt.list = true

-- Set only the trailing spaces and non-breaking spaces to a visible symbol
local space = "·"
opt.listchars = {
  trail = space,
  nbsp = space,
}

-- Show trailing whitespace with Error highlight group
cmd([[match TrailingWhitespace /\s\+$/]])
nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })

-- Make highlighting less aggressive while typing
nvim_create_autocmd("InsertEnter", {
  callback = function()
    -- Make the highlight less distracting in Insert mode
    nvim_set_hl(0, "TrailingWhitespace", { link = "Whitespace" })
  end
})

nvim_create_autocmd("InsertLeave", {
  callback = function()
    nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })
  end
})
