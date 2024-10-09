-- This file can be loaded by calling `lua require('plugins')` from your init.vim

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'catppuccin/nvim',
	  as = 'catppuccin',
	  config = function()
		  vim.cmd('colorscheme catppuccin')
	  end
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use 'nvim-treesitter/nvim-treesitter-context'

  use('mbbill/undotree')

  use('tpope/vim-fugitive')
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      {'neovim/nvim-lspconfig'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }

  }

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

  use {
    'vimwiki/vimwiki',
    init = function ()
      vim.g.vimwiki_list = {{ syntax = 'markdown', ext = '.md' }}
   end
  }

  use 'christoomey/vim-tmux-navigator'

  use 'prettier/vim-prettier'

  use 'stevearc/oil.nvim'
end)
