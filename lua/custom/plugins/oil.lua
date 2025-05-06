return {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup {
      columns = {
        'icon',
        'permissions',
        'size',
        'mtime',
      },
      keymaps = {
        ['<M-v>'] = { 'actions.select', opts = { vertical = true } },
        ['<M-j>'] = { 'actions.select', opts = { horizontal = true } },
        ['q'] = 'actions.close',
      },
    }
  end,
  -- Optional dependencies
  -- dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
