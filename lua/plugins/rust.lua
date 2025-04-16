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

      -- Diagnostic float (show full error/warning under cursor)
    vim.keymap.set("n", "<leader>k", function()
      vim.diagnostic.open_float(nil, { focus = false })
    end, opts)

    vim.keymap.set("n", "<leader>K", function()
      local diagnostics = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
      if #diagnostics == 0 then
        vim.notify("No diagnostic message here", vim.log.levels.INFO)
        return
      end
      local message = diagnostics[1].message
      vim.fn.setreg("+", message)
      vim.notify("Copied diagnostic to clipboard!", vim.log.levels.INFO)
    end, { noremap = true, silent = true, desc = "Copy diagnostic to clipboard" })



      -- You can also bind others like:
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    end,
  },
})

return {}
