-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = function()
    local autopairs = require 'nvim-autopairs'
    local Rule = require 'nvim-autopairs.rule'
    local npairs = require 'nvim-autopairs'

    local cond = require 'nvim-autopairs.conds'

    autopairs.setup {
      ignored_next_char = '[%w%.]', -- will ignore alphanumeric and `.` symbol
    }
  end,
}
