return {
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  { "christoomey/vim-tmux-navigator" },
  { "mg979/vim-visual-multi" },
}
