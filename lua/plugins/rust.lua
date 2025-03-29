-- lua/custom/plugins/rust.lua
local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Set keybindings here
      local opts = { noremap=true, silent=true, buffer=bufnr }

      -- 'gd' to go to definition
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'gD', require('telescope.builtin').lsp_definitions, opts)


      -- You can also bind others like:
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    end,
  },
})

return {}
