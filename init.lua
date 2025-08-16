-- C:/Users/shahid/APPDATA/Local/nvim/nvim-minimal/init.lua

-- General settings
vim.opt.scroll = 5
vim.opt.conceallevel = 0
vim.opt.laststatus = 0
vim.opt.clipboard:append("unnamedplus")
vim.wo.relativenumber = true
vim.o.number = true
vim.o.relativenumber = true

vim.g.mapleader = " "
vim.keymap.set("n", "va", "ggVG")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>h", ":noh<CR>")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load configuration files
require("lazy").setup("plugins")
require('autocommands')
require('keybinds')
require('plugins')


vim.cmd("colorscheme pire")
