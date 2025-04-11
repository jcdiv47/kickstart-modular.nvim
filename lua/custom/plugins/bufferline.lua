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
    vim.keymap.set('n', '<leader>bp', ':BufferLinePick<CR>', { desc = 'Pick a buffer' })
    vim.keymap.set('n', '<leader>bP', ':BufferLineTogglePin<CR>', { desc = 'Toggle the pin status of a buffer' })
    vim.keymap.set('n', '<leader>bX', ':BufferLinePickClose<CR>', { desc = 'Pick a buffer to close' })
  end,
}
