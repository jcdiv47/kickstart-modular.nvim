return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      options = {
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'File Explorer',
            text_align = 'center',
          },
        },
        separator_style = 'slant',
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
      },
    }
    vim.keymap.set('n', '<leader>bn', ':BufferLineCycleNext<CR>', { desc = 'Navigate to next buffer' })
    vim.keymap.set('n', '<leader>bp', ':BufferLineCyclePrev<CR>', { desc = 'Navigate to previous buffer' })
    vim.keymap.set('n', '<leader>bP', ':BufferLinePick<CR>', { desc = 'Pick a buffer' })
    vim.keymap.set('n', '<leader>bx', ':BufferLinePickClose<CR>', { desc = 'Pick a buffer to close' })
  end,
}
