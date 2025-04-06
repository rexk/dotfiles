return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "saghen/blink.cmp",
    },
    config = function()
      require('mason').setup()

      -- set up with blink
      require('config.lsp.lua_ls').setup()
      require('config.lsp.tsls').setup()
      require('config.lsp.biome').setup()

      vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
      vim.keymap.set('n', 'gD', vim.lsp.buf.implementation)

      vim.keymap.set('n', '<space>cf', function()
        local bufnr = vim.api.nvim_get_current_buf()
        local clients = vim.lsp.get_clients({ bufnr = bufnr })
        local biome_name = "biome"
        local biome_client = nil

        for _, client in pairs(clients) do
          if client.name == biome_name then
            biome_client = client
            break
          end
        end

        if biome_client then
          vim.lsp.buf.format({
            bufnr = bufnr,
            filter = function(client)
              return client.name == biome_name
            end,
          })
        else
          vim.lsp.buf.format({ bufnr = bufnr })
        end
      end)
    end
  },

  -- completion
  { -- optional blink completion source for require statements and module annotations
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts_extend = { "sources.default" },
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      sources = {
        -- add lazydev to your completion providers
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
    },
  },

  -- lua
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
