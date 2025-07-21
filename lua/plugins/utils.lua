return {
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
  },
  {
    "ojroques/vim-oscyank",
    config = function()
      vim.keymap.set('n', '<leader>C', '<Plug>OSCYankOperator')
      vim.keymap.set('n', '<leader>CC', '<leader>c_', {remap = true})
      vim.keymap.set('v', '<leader>C', '<Plug>OSCYankVisual')
      vim.keymap.set('v', '<leader>c', '"+y')
    end,
  },
  {
    "echasnovski/mini.ai",
    version = "*",
    config = function()
      require("mini.ai").setup()
    end,
  },
  {
    "echasnovski/mini.comment",
    version = "*",
    config = function()
      require("mini.comment").setup()
    end,
  },
  {
    "echasnovski/mini.surround",
    version = "*",
    config = function()
      require("mini.surround").setup()
    end,
  },
  {
    "echasnovski/mini.trailspace",
    version = "*",
    config = function()
      require("mini.trailspace").setup()
    end,
  },
}
