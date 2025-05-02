return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function(_, opts)
      require('telescope').setup(opts)

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fd', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      vim.keymap.set('n', '<leader>fx', builtin.diagnostics, { desc = 'Telescope diagnostics' })
      vim.keymap.set('n', '<leader>frr', builtin.lsp_references, { desc = 'Telescope lsp_references' })
      vim.keymap.set('n', '<leader>fdo', builtin.lsp_document_symbols, { desc = 'Telescope lsp_document_symbols' })
      vim.keymap.set('n', '<leader>fwo', builtin.lsp_dynamic_workspace_symbols, { desc = 'Telescope lsp_document_symbols' })
    end,
  }
}
