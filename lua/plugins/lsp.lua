return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(client, bufnr)
        local set = vim.keymap.set
        local opts = { buffer = bufnr, remap = false }

        if client.name == "eslint" then
          client.server_capabilities.documentFormattingProvider = false
        end

        set("n", "gd", vim.lsp.buf.definition, opts)
        set("n", "K", vim.lsp.buf.hover, opts)
        set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        set("n", "<leader>q", vim.diagnostic.open_float, opts)
        set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
        set("n", "<leader>vrr", vim.lsp.buf.references, opts)
        set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
      end

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim", "require" } },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.fn.expand("$VIMRUNTIME/lua"),
                  vim.fn.stdpath("config") .. "/lua",
                },
              },
            },
          },
        },
        vtsls = {
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
        },
        gopls = {},
        rust_analyzer = {},
        templ = {},
        eslint = {},
      }

      for server_name, custom_opts in pairs(servers) do
        local server_config = {
          on_attach = on_attach,
          capabilities = capabilities,
        }

        -- Combina a configuração padrão com a customizada (se existir).
        server_config = vim.tbl_deep_extend("force", server_config, custom_opts)

        -- Inicia o servidor com a configuração final.
        lspconfig[server_name].setup(server_config)
      end
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          -- ['<Tab>'] = nil,
          -- ['<S-Tab>'] = nil,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
          { name = "lazydev" },
        },
      })
    end,
  },
  {
    "ray-x/go.nvim",
    ft = { "go", "gomod" },
    dependencies = { "ray-x/guihua.lua" },
    config = function()
      require("go").setup()

      vim.g.go_fmt_command = "goimports"

      local format_on_save_group = vim.api.nvim_create_augroup(
        "GoAutoFormat",
        { clear = true }
      )
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        group = format_on_save_group,
        callback = function()
          require('go.format').goimports()
        end,
      })
    end,
  },
  { "prettier/vim-prettier" },
}
