return {
	{
		"kmontocam/nvim-conda",
		dependencies = { "nvim-lua/plenary.nvim" },
		ft = "python",
	},
  -- SQL language server (using nvim-lspconfig)
  {
      'neovim/nvim-lspconfig',
      config = function()
          require'lspconfig'.sqlls.setup{
              cmd = { "sql-language-server", "up", "--method", "stdio" },
              filetypes = { "sql" },
              settings = {
                  sqlLanguageServer = {
                      connections = {
                          -- Define your database connections here
                          {
                              driver = 'PostgreSQL',
                              dataSourceName = 'postgres://bevvee_rw:mLMI16UXUyqJbwHP@161.35.228.34:5432/bevvee',
                          },
                      },
                  },
              },
          }
      end,
  },
    -- Null-ls for SQL linting
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.diagnostics.sqlfluff.with({
                    extra_args = { "--dialect", "postgres" },  -- replace with your dialect
                }),
            },
        })
    end,
  },



  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
}
