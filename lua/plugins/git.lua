return {
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end,
  },
  { "zivyangll/git-blame.vim" },
  { "sindrets/diffview.nvim" },
}
