---@diagnostic disable
return {
  'folke/snacks.nvim',
  -- Dashboard appears to show up only with the following two lines
  priority = 1000,
  lazy = false,
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
  },
  vim.keymap.set('n', '<leader>bd', function()
    Snacks.bufdelete()
  end, { desc = 'Snacks delete buffer' }),
  vim.keymap.set('n', '<leader>u', function()
    Snacks.picker.undo()
  end, { desc = 'Snacks undo history' }),
  vim.keymap.set({ 'n', 't' }, '<A-i>', function()
    Snacks.terminal()
  end, { desc = 'Snacks toggle terminal' }),
}
