-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = function()
    local autopairs = require 'nvim-autopairs'

    autopairs.setup {
      -- Ignores alphanumeric, quotes and `.` symbol
      ignored_next_char = '[%w%\'%"%.]',
    }
  end,
}
