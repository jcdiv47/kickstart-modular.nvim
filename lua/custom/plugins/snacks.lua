---@diagnostic disable
return {
  'folke/snacks.nvim',
  ---@type snacks.Config
  opts = {
    dashboard = {
      -- your dashboard configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      sections = {
        { section = 'header' },
        { icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
        { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
        { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
        { section = 'startup' },
      },
    },
    scroll = { enabled = true },
    styles = {
      terminal = {
        relative = 'editor',
        border = 'rounded',
        position = 'float',
        backdrop = 0.9,
        height = 0.7,
        width = 0.7,
        zindex = 50,
      },
    },
  },
  keys = {
    {
      '<leader>bd',
      function()
        Snacks.bufdelete()
      end,
      desc = 'Snacks delete Buffer',
    },
    {
      '<A-i>',
      function()
        Snacks.terminal()
      end,
      desc = 'Snacks toggle Terminal',
    },
    {
      '<leader>u',
      function()
        require('snacks').picker.undo()
      end,
      desc = 'Snacks undo history',
    },
  },
}
