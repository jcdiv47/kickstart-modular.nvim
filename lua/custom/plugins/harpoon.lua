-- directly copied from https://github.com/tonybanters/nvim/blob/db83c748143ac8a9e8c2ee90611ac3a8527b3b2d/lua/plugins/harpoon.lua
local conf = require('telescope.config').values
local themes = require 'telescope.themes'

-- helper function to use telescope on harpoon list.
-- change get_ivy to other themes if wanted
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end
  local opts = themes.get_ivy {
    promt_title = 'Working List',
  }

  require('telescope.pickers')
    .new(opts, {
      finder = require('telescope.finders').new_table {
        results = file_paths,
      },
      previewer = conf.file_previewer(opts),
      sorter = conf.generic_sorter(opts),
    })
    :find()
end

return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local harpoon = require 'harpoon'

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Add a buffer to Harpoon' })
    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
    vim.keymap.set('n', '<leader>H', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Open harpoon floating window' })
    vim.keymap.set('n', '<C-p>', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<C-n>', function()
      harpoon:list():next()
    end)
    vim.keymap.set('n', '<leader>1', function()
      harpoon:list():select(1)
    end, { desc = 'Go to the first buffer in Harpoon' })
    vim.keymap.set('n', '<leader>2', function()
      harpoon:list():select(2)
    end, { desc = 'Go to the second buffer in Harpoon' })
    vim.keymap.set('n', '<leader>3', function()
      harpoon:list():select(3)
    end, { desc = 'Go to the third buffer in Harpoon' })
    vim.keymap.set('n', '<leader>4', function()
      harpoon:list():select(4)
    end, { desc = 'Go to the fourth buffer in Harpoon' })
    vim.keymap.set('n', '<leader>5', function()
      harpoon:list():select(5)
    end, { desc = 'Go to the fifth buffer in Harpoon' })
  end,
}
