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
-- ########## Custom key mappings ############
-- ###########################################

-- Use ctrl+s to save to buffer in windows and linux
vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', '<cmd>w<CR><ESC>')
-- Use cmd+s to save to buffer in macos
vim.keymap.set({ 'n', 'i', 'v' }, '<D-s>', '<cmd>w<CR><ESC>')

-- Delete single character without copying into register
vim.keymap.set('n', 'x', '"_x')

-- Use jk to escape
vim.keymap.set('i', 'jk', '<ESC>')
-- Use jk to exit terminal mode
vim.keymap.set('t', 'jk', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set({ 'n', 'x' }, '<S-h>', '^', { desc = 'Go to start of line' })
vim.keymap.set({ 'n', 'x' }, '<S-l>', '$', { desc = 'Go to end of line' })

-- Tab management
vim.keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new [T]ab' }) -- open new tab
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current [T]ab' }) -- close current tab
vim.keymap.set('n', '<leader>tn', '<cmd>tabnext<CR>', { desc = 'Go to next [T]ab' }) --  go to next tab
vim.keymap.set('n', '<leader>tp', '<cmd>tabprevious<CR>', { desc = 'Go to previous [T]ab' }) --  go to previous tab
vim.keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new [T]ab' }) --  move current buffer to new tab

-- Buffer management
vim.keymap.set('n', '<leader>bo', '<cmd>enew<CR>', { desc = 'Open new [B]uffer' }) -- open new buffer
vim.keymap.set('n', '<leader>bx', '<cmd>bd<CR>', { desc = 'Close current [B]uffer' }) -- close current buffer
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>', { desc = 'Go to next [B]uffer' }) --  go to next buffer
vim.keymap.set('n', '<leader>bp', '<cmd>bprev<CR>', { desc = 'Go to previous [B]uffer' }) --  go to previous buffer
vim.keymap.set('n', ']b', ':bnext<CR>', { desc = 'Navigate to the next [B]uffer' })
vim.keymap.set('n', '[b', ':bprev<CR>', { desc = 'Navigate to the previous [B]uffer' })

-- Window management
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Split [W]indow [V]ertically' }) -- Split window vertically
vim.keymap.set('n', '<leader>wh', '<C-w>s', { desc = 'Split [W]indow [H]orizontally' }) -- Split window horizontally
vim.keymap.set('n', '<leader>we', '<C-w>=', { desc = 'Make split [W]indows [E]qual size' }) -- Make split windows equal width & height
vim.keymap.set('n', '<leader>wx', '<cmd>close<CR>', { desc = 'Close current split [W]indow' }) -- Close current split window

-- Oil
vim.keymap.set('n', '<leader>o', '<cmd>Oil<CR>', { desc = 'Open [O]il' })

-- Fuzzy finder for git dirty files
vim.keymap.set('n', '<space>gb', function()
  require('telescope.builtin').git_branches()
end, { noremap = true, silent = true, desc = '[G]it [B]ranches' })
vim.keymap.set('n', '<space>gc', function()
  require('telescope.builtin').git_commits()
end, { noremap = true, silent = true, desc = '[G]it [C]ommits' })
vim.keymap.set('n', '<space>gs', function()
  require('telescope.builtin').git_status()
end, { noremap = true, silent = true, desc = '[G]it [S]tatus' })

-- Paste from system clipboard (using "*")
vim.keymap.set('n', '<leader>y', ':normal! "*p<CR>', { noremap = true, silent = true, desc = 'Paste from system clipboard' })
-- Optional: Paste from primary selection (using "+")
vim.keymap.set('n', '<leader>Y', ':normal! "+p<CR>', { noremap = true, silent = true, desc = 'Paste from primary selection' })

vim.keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights', silent = true })

-- vim: ts=2 sts=2 sw=2 et
