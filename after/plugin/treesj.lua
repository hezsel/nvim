vim.keymap.set('n', '<leader>m', require('treesj').toggle)
vim.keymap.set('n', '<leader>M', function()
  require('treesj').toggle({ split = { recursive = true } })
end)
