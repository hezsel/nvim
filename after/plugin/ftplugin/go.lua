local function format()
  require('go.format').goimports()
end

-- Create an augroup to avoid duplicate autocmds
vim.api.nvim_create_augroup("GoAutoFormat", { clear = true })

-- Correct way to run the function on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.go",
  group = "GoAutoFormat",
  callback = format
})
