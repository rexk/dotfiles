local function format()
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
end

local M = {
  setup = function()
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
          vim.print('running usual')
          vim.lsp.buf.format({ bufnr = bufnr })
        end
      end,
      { desc = "[C]ode [F]ormat" })
  end,
}

return M
