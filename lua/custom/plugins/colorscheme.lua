return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha', -- latte, frappe, macchiato, mocha
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        integrations = {
          harpoon = true,
        },
        ---@diagnostic disable-next-line: unused-local
        custom_highlights = function(colors)
          return {
            IncSearch = { bg = '#ff9e64' },
          }
        end,
      }
      -- setup must be called before loading
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
