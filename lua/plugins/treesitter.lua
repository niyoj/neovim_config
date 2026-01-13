return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    config = function()
      vim.schedule(function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = { "python", "lua", "vim", "vimdoc", "query", "bash", "json", "yaml" },
          auto_install = true,
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
      end)
    end,
  },
}
