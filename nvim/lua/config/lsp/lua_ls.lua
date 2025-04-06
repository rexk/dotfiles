local name = "lua_ls"
local loaded = false

local M = {
  loaded = loaded,
  name = name,
  setup = function()
    if loaded then
      return
    end

    ---@type vim.lsp.Config
    local config = {
      -- Command and arguments to start the server.
      cmd = { 'lua-language-server' },

      -- Filetypes to automatically attach to.
      filetypes = { 'lua' },

      -- Sets the "root directory" to the parent directory of the file in the
      -- current buffer that contains either a ".luarc.json" or a
      -- ".luarc.jsonc" file. Files that share a root directory will reuse
      -- the connection to the same LSP server.
      root_markers = { '.luarc.json', '.luarc.jsonc', 'lazy-rock.json' },

      -- Specific settings to send to the server. The schema for this is
      -- defined by the server. For example the schema for lua-language-server
      -- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          }
        }
      },
    }
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    config.capabilities = capabilities
    vim.lsp.config[name] = config
    vim.lsp.enable(name)
    loaded = true
  end,
}

return M
