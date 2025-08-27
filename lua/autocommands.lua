-- autocommands.lua

-- Autocommands for specific filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "c" },
  callback = function()
    vim.keymap.set("n", "<space><space>", ":vsplit input.txt | write<CR>", { silent = true })
  end,
})

-- Optional Python mapping (uncomment if needed)
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "python",
--   callback = function()
--     vim.keymap.set("n", "<space><space>", ":vsplit input.txt | write | wincmd h<CR>", { silent = true })
--   end,
-- })
--


-- Markdown-specific keymap for Brr
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "markdown",
--   callback = function()
--     vim.keymap.set("n", ",b", ":Brr<CR>", { buffer = true, silent = true, desc = "Run Brr for Markdown" })
--   end,
-- })

-- Filetype detection for custom extensions
vim.filetype.add({
  extension = {
    cpp2 = "cpp",
    bf = "brainfsck",
    nasm = "nasm",
    asm = "nasm",
    yasm = "nasm",
    fasm = "fasm",
    gren = "elm",
    love = "lua",
    c3 = "c3",
    c2 = "c2",
    s = "nasm",
  },
})
