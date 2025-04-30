-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- ###########################################
-- ########## custom key mappings ############
-- ###########################################

-- Define the save key based on the operating system
local save_key

if vim.fn.has 'win32' then
  save_key = '<C-s>' -- Ctrl+s on Windows
elseif vim.fn.has 'mac' then
  save_key = '<D-s>' -- Cmd+s on macOS
else
  -- Default to Ctrl+s for other operating systems (like Linux)
  save_key = '<C-s>'
end

-- Use cmd+s to save to buffer
vim.keymap.set({ 'n', 'i', 'v' }, save_key, '<cmd>w<CR><ESC>')

-- Close current buffer
vim.keymap.set('n', '<leader>x', '<cmd>bd<CR>', { desc = 'Close current buffer' })

-- Delete single character without copying into register
vim.keymap.set('n', 'x', '"_x')

-- Use jk to escape
vim.keymap.set('i', 'jk', '<ESC>')

-- Tab management
vim.keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' }) -- open new tab
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' }) -- close current tab
vim.keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' }) --  go to next tab
vim.keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' }) --  go to previous tab
vim.keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' }) --  move current buffer to new tab

-- Buffer management
vim.keymap.set('n', '<leader>bo', '<cmd>enew<CR>', { desc = 'Open new buffer' }) -- open new buffer
vim.keymap.set('n', '<leader>bx', '<cmd>bd<CR>', { desc = 'Close current buffer' }) -- close current buffer
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>', { desc = 'Go to next buffer' }) --  go to next buffer
vim.keymap.set('n', '<leader>bp', '<cmd>bprev<CR>', { desc = 'Go to previous buffer' }) --  go to previous buffer
vim.keymap.set('n', ']b', ':bnext<CR>', { desc = 'Navigate to the next buffer' })
vim.keymap.set('n', '[b', ':bprev<CR>', { desc = 'Navigate to the previous buffer' })

-- Oil
vim.keymap.set('n', '<leader>o', '<cmd>Oil<CR>', { desc = 'Open Oil' })

-- vim: ts=2 sts=2 sw=2 et
