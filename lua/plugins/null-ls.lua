-- Formatting and diagnostics for Python and general development
-- Source: https://github.com/nvimtools/none-ls.nv
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Lua
        null_ls.builtins.formatting.stylua,
        
        -- Python
        null_ls.builtins.formatting.black.with({
          extra_args = { "--line-length=88" },
        }),
        null_ls.builtins.diagnostics.pylint,
        require("none-ls.diagnostics.eslint_d"),
        null_ls.builtins.diagnostics.ruff,
        
        -- General
        null_ls.builtins.completion.spell,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
