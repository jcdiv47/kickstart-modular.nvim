return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      -- local statusline = require 'mini.statusline'
      -- -- set use_icons to true if you have a Nerd Font
      -- statusline.setup { use_icons = vim.g.have_nerd_font }
      --
      -- -- You can configure sections in the statusline by overriding their
      -- -- default behavior. For example, here we set the section for
      -- -- cursor location to LINE:COLUMN
      -- ---@diagnostic disable-next-line: duplicate-set-field
      -- statusline.section_location = function()
      --   return '%2l:%-2v'
      -- end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  {
    -- File explorer (this works properly with oil unlike nvim-tree)
    'echasnovski/mini.files',
    config = function()
      local MiniFiles = require 'mini.files'
      MiniFiles.setup {
        mappings = {
          close = 'q',
          go_in = 'l',
          go_in_plus = 'L',
          go_out = 'h',
          go_out_plus = 'H',
          reveal_cwd = '@',
          show_help = 'g?',
          synchronize = '=', -- Sync user edits to filesystem
          trim_left = '<',
          trim_right = '>',
        },
        windows = {
          -- Whether to show preview of file/directory under cursor
          preview = true,
          -- Width of focused window
          width_focus = 30,
          -- Width of non-focused window
          width_nofocus = 15,
          -- Width of preview window
          width_preview = 40,
        },
      }
      -- Open mini file explorer
      vim.keymap.set('n', '<leader>ee', '<cmd>lua MiniFiles.open()<CR>', { desc = 'Open mini file explorer' })
      vim.keymap.set('n', '<leader>ef', function()
        MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
        MiniFiles.reveal_cwd()
      end, { desc = 'Toggle into currently opened file' })
    end,
  },
  {
    -- Split & join
    'echasnovski/mini.splitjoin',
    config = function()
      local miniSplitJoin = require 'mini.splitjoin'
      miniSplitJoin.setup {
        mappings = { toggle = '' }, -- Disable default mapping
      }
      vim.keymap.set({ 'n', 'x' }, 'sj', function()
        miniSplitJoin.join()
      end, { desc = 'Join arguments' })
      vim.keymap.set({ 'n', 'x' }, 'sk', function()
        miniSplitJoin.split()
      end, { desc = 'Split arguments' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
