    local lspconfig = require("lspconfig")

    -- TypeScript, JavaScript
    lspconfig.tsserver.setup({})

    -- Lua
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    })
