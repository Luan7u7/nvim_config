return {
  'nvim-telescope/telescope.nvim',
  branch = 'master',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
    },
    'nvim-tree/nvim-web-devicons',
    'andrew-george/telescope-themes',
  },
  config = function()
    local telescope = require 'telescope'
    local actions = require 'telescope.actions'
    local builtin = require 'telescope.builtin'

    telescope.setup {
      defaults = {
        path_display = { 'smart' },
        mappings = {
          i = {
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-j>'] = actions.move_selection_next,
          },
        },
      },
      extensions = {
        themes = {
          enable_previewer = true,
          enable_live_preview = true,
          persist = {
            enabled = true,
            path = vim.fn.stdpath 'config' .. '/lua/colorscheme.lua',
          },
        },
      },
    }

    telescope.load_extension 'fzf'
    telescope.load_extension 'themes'

    -- Keymaps
    vim.keymap.set('n', '<leader>pr', '<cmd>Telescope oldfiles<CR>', { desc = 'Fuzzy find recent files' })

    vim.keymap.set('n', '<leader>pWs', function()
      local word = vim.fn.expand '<cWORD>'
      builtin.grep_string { search = word }
    end, { desc = 'Find Connected Words under cursor' })

    vim.keymap.set(
      'n',
      '<leader>ths',
      '<cmd>Telescope themes<CR>',
      { noremap = true, silent = true, desc = 'Theme Switcher' }
    )
  end,
}
