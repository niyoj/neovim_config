vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set autoindent")
vim.cmd("set smarttab")
vim.cmd("set shiftwidth=2")
vim.cmd("set mouse=a")
vim.cmd("set number")

-- lazypath.nvim snippet, source: https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Tuples for lazy config
local plugins = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "nvim-telescope/telescope.nvim", name = "telescope", dependencies = "tsakirist/telescope-lazy.nvim" },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    {
        "fdschmidt93/telescope-egrepify.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
          local configs = require("nvim-treesitter.configs")
    
          configs.setup({
              ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
              sync_install = false,
              highlight = { enable = true },
              indent = { enable = true },  
            })
        end
     }
}

local opts = {}

require("lazy").setup(plugins, opts)

-- See this for treesitter on Windows; https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support
require 'nvim-treesitter.install'.prefer_git = false
require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }

require("telescope").load_extension "lazy"
require("telescope").load_extension "file_browser"
require "telescope".load_extension "egrepify"

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"