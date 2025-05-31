return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      -- Keep the escape key mapping for terminal mode
      vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>')

      require("toggleterm").setup({
        -- Terminal configuration
        size = function(term)
          if term.direction == "float" then
            return vim.o.columns * 0.8, vim.o.lines * 0.8
          end
          return 15
        end,
        open_mapping = nil, -- We'll set our custom mapping
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = false,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "rounded",
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })

      -- Create a floating terminal
      local Terminal = require("toggleterm.terminal").Terminal
      local float_term = Terminal:new({
        direction = "float",
        hidden = true,
      })

      -- Function to toggle the floating terminal
      local function toggle_float_term()
        float_term:toggle()
      end

      -- Create user command to match original behavior
      vim.api.nvim_create_user_command('Terminalpop', toggle_float_term, {})

      -- Keep the same keymapping
      vim.keymap.set({ 'n', 't' }, '<space>c/', toggle_float_term, { noremap = true, silent = true })
    end,
  }
}
