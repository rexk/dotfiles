local loaded = false
local name = "biome"
local config = {
  -- Command and arguments to start the server.
  cmd = { 'biome', 'lsp-proxy' },

  -- Filetypes to automatically attach to.
  filetypes = { "astro", "css", "graphql", "javascript", "javascriptreact", "json", "jsonc", "svelte", "typescript", "typescript.tsx", "typescriptreact", "vue" },

  -- Sets the "root directory" to the parent directory of the file in the
  -- current buffer that contains either a ".luarc.json" or a
  -- ".luarc.jsonc" file. Files that share a root directory will reuse
  -- the connection to the same LSP server.
  root_markers = { 'biome.json', 'biome.jsonc' },
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
