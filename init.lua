vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set autoindent")
vim.cmd("set smartindent")
vim.cmd("set smarttab")
vim.cmd("set shiftwidth=2")
vim.cmd("set mouse=a")
vim.cmd("set number")
vim.g.mapleader = " "

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
-- local opts = {}

require("lazy").setup("plugins")
require("config.keymaps")

-- See this for treesitter on Windows; https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support
require("nvim-treesitter.install").prefer_git = false
require("nvim-treesitter.install").compilers = { "clang" }

require("catppuccin").setup()
vim.cmd.colorscheme("catppuccin")
