local tsj = require('treesj')

tsj.setup({
  use_default_keymaps = false,
  max_join_length = 500,
})

vim.keymap.set('n', '<leader>m', require('treesj').toggle)
vim.keymap.set('n', '<leader>M', function()
  require('treesj').toggle({ split = { recursive = true } })
end)
