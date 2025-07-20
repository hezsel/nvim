-- This file can be loaded by calling `lua require('plugins')` from your init.vim

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- use({
  --   'catppuccin/nvim',
  --   as = 'catppuccin',
  --   config = function()
  --     vim.cmd('colorscheme catppuccin')
  --   end
  -- })

  use({
    'rebelot/kanagawa.nvim',
    as = 'kanagawa',
    config = function()
      vim.cmd('colorscheme kanagawa-dragon')
    end
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use 'nvim-treesitter/nvim-treesitter-context'

  use('mbbill/undotree')

  use('tpope/vim-fugitive')

  -- lsp
  use { 'williamboman/mason.nvim' }
  use { 'williamboman/mason-lspconfig.nvim' }
  use { 'neovim/nvim-lspconfig' }

  -- Autocompletion
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-nvim-lua' }

  -- Snippets
  use { 'L3MON4D3/LuaSnip' }
  use { 'rafamadriz/friendly-snippets' }

  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  use 'tpope/vim-surround'

  use 'zivyangll/git-blame.vim'

  use 'mileszs/ack.vim'

  use 'ojroques/vim-oscyank'

  use 'airblade/vim-gitgutter'

  use 'mg979/vim-visual-multi'

  use {
    'Wansmer/treesj',
    requires = { 'nvim-treesitter' },
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use 'github/copilot.vim'

  use 'ggandor/leap.nvim'

  use 'christoomey/vim-tmux-navigator'

  use 'prettier/vim-prettier'

  use 'stevearc/oil.nvim'

  use 'sindrets/diffview.nvim'

  use {
    'ray-x/go.nvim',
    ft = { 'go', 'gomod' },
    dependencies = { 'ray-x/guihua.lua' },
    config = function()
      require('go').setup()
    end
  }

  use {
    "epwalsh/obsidian.nvim",
    tag = "*",  -- recommended, use latest release instead of latest commit
    requires = {
      -- Required.
      "nvim-lua/plenary.nvim",
    }
  }
end)
