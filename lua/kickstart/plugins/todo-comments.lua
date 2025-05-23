-- Highlight todo, notes, etc in comments
return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local todo_comments = require 'todo-comments'

    todo_comments.setup {
      signs = false,
      vim.keymap.set('n', '<leader>st', '<cmd>TodoTelescope<CR>', { desc = '[S]earch [T]odos' }),
      vim.keymap.set('n', '[t', function()
        todo_comments.jump_next()
      end, { desc = 'Next todo comment' }),
      vim.keymap.set('n', ']t', function()
        todo_comments.jump_prev()
      end, { desc = 'Previous todo comment' }),
    }
  end,
}
-- vim: ts=2 sts=2 sw=2 et
