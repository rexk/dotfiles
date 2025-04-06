local loaded = false
local name = "tsls"
local config = {
  -- Command and arguments to start the server.
  cmd = { 'typescript-language-server', '--stdio' },

  -- Filetypes to automatically attach to.
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },

  -- Sets the "root directory" to the parent directory of the file in the
  -- current buffer that contains either a ".luarc.json" or a
  -- ".luarc.jsonc" file. Files that share a root directory will reuse
  -- the connection to the same LSP server.
  root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json' },
}

local M = {
  name = name,
  config = config,
  setup = function()
    if loaded then
      return
    end

    vim.lsp.config[name] = config
    vim.lsp.enable(name)
    loaded = true
  end,
}

return M
