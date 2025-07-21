return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "javascript", "typescript", "c", "lua", "rust", "go" },

        sync_install = false,
        auto_install = true,

        highlight = {
          -- `false` will disable the whole extension
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  },
  { "nvim-treesitter/nvim-treesitter-context" },
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup({
        use_default_keymaps = false,
        max_join_length = 1000, -- max length of line to join
      })

      vim.keymap.set('n', '<leader>m', require('treesj').toggle)
      vim.keymap.set('n', '<leader>M', function()
        require('treesj').toggle({ split = { recursive = true } })
      end)
    end,
  },
}
