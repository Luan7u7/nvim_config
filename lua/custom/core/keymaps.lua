-- tree explorer
vim.keymap.set('n', '<leader>ee', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
vim.keymap.set('n', '<leader>ef', '<cmd>NvimTreeFindFile<CR>', { desc = 'Toggle file explorer on current file' })
vim.keymap.set('n', '<leader>ec', '<cmd>NvimTreeCollapse<CR>', { desc = 'Collapse file explorer' })
vim.keymap.set('n', '<leader>er', '<cmd>NvimTreeRefresh<CR>', { desc = 'Refresh file explorer' })

-- utilities
vim.keymap.set('v', '[', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
vim.keymap.set('v', ']', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up' })
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Center next search result' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Center previous search result' })
vim.keymap.set({ 'v' }, '<leader>D', [["_d]], { desc = 'Delete to black hole register' })
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')
vim.keymap.set(
  'n',
  '<leader>rw',
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = 'Replace word under cursor' }
)

vim.keymap.set('n', '<leader>o', 'o<ESC>', { desc = 'Insert new line below' })
vim.keymap.set('n', '<leader>O', 'O<ESC>', { desc = 'Insert new line above' })

-- tab stuff
vim.keymap.set('n', '<leader>to', '<cmd>tabnew<CR>')   --open new tab
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>') --close current tab
vim.keymap.set('n', '<leader>tn', '<cmd>tabn<CR>')     --go to next
vim.keymap.set('n', '<leader>tp', '<cmd>tabp<CR>')     --go to pre
vim.keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>') --open current tab in new tab

--split management
vim.keymap.set('n', '<leader>lv', '<C-w>v', { desc = 'Split window vertically' })
-- split window vertically
vim.keymap.set('n', '<leader>lh', '<C-w>s', { desc = 'Split window horizontally' })
-- split window horizontally
vim.keymap.set('n', '<leader>le', '<C-w>=', { desc = 'Make splits equal size' }) -- make split windows equal width & height
-- close current split window
vim.keymap.set('n', '<leader>lx', '<cmd>close<CR>', { desc = 'Close current split' })

-- Toggle LSP diagnostics visibility
local isLspDiagnosticsVisible = true
vim.keymap.set('n', '<leader>lx', function()
  isLspDiagnosticsVisible = not isLspDiagnosticsVisible
  vim.diagnostic.config {
    virtual_text = isLspDiagnosticsVisible,
    underline = isLspDiagnosticsVisible,
  }
end, { desc = 'Toggle LSP diagnostics' })
