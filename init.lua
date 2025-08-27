-- General settings
vim.opt.scroll = 5
vim.opt.conceallevel = 0
vim.opt.laststatus = 0
vim.opt.clipboard:append("unnamedplus")
vim.wo.relativenumber = true
vim.o.number = true
vim.o.relativenumber = true
vim.opt.guifont = "BlexMono Nerd Font Mono:h12"

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

-- Load plugins
require("lazy").setup("plugins")






-- Load other configurations
require('autocommands')
require('keybinds')
require("brr").setup()

vim.cmd("colorscheme pire")

-- Prevent E28 by defining missing groups
vim.cmd("hi def link markdownId            Identifier")
vim.cmd("hi def link markdownLineStart     Normal")
vim.cmd("hi def link markdownH1            Title")
vim.cmd("hi def link markdownH2            Title")
vim.cmd("hi def link markdownHeadingRule   Comment")
vim.cmd("hi def link markdownRule          Comment")
vim.cmd("hi def link markdownCode          String")
vim.cmd("hi def link markdownCodeBlock     String")
vim.cmd("hi def link markdownIdDeclaration Identifier")



-- Aliases for uppercase/lowercase write/quit commands
-- Workaround for Q! and W! (force versions)
vim.cmd("cnoreabbrev Q! q!")
vim.cmd("cnoreabbrev W! w!")

-- Normal aliases
vim.api.nvim_create_user_command("W",  "w",  {})
vim.api.nvim_create_user_command("Q",  "q",  {})
vim.api.nvim_create_user_command("WQ", "wq", {})
vim.api.nvim_create_user_command("Wq", "wq", {})

-- Make matching braces stand out
vim.api.nvim_set_hl(0, "MatchParen", { fg = "#ffff00", bg = "#1e1e5e", bold = true })

-- Auto-override MatchParen highlight after colorscheme is applied
-- vim.api.nvim_create_autocmd("ColorScheme", {
--   callback = function()
--     -- Example override: dark text (#282c34) on blue background (#61afef), bold
--     vim.api.nvim_set_hl(0, "MatchParen", { fg = "#ffff00", bg = "#1e1e5e", bold = true })
--   end,
-- })
