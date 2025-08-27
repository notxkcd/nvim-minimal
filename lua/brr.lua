local M = {}

-- Main function
local function strip_triple_dash()
  local bufnr = 0
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  local kept = {}
  for _, line in ipairs(lines) do
    if not line:match("^%-%-%-$") then
      table.insert(kept, line)
    end
  end

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, kept)
end

-- Expose function globally (Lua)
_G.brr = strip_triple_dash
_G.Brr = strip_triple_dash
_G.BRR = strip_triple_dash

-- Setup Neovim commands (must start with uppercase)
function M.setup()
  local names = {"Brr", "BRR"}  -- valid command names
  for _, name in ipairs(names) do
    vim.api.nvim_create_user_command(name, strip_triple_dash, {
      desc = "Delete lines that are exactly ---"
    })
  end

  -- Optional keymap
  vim.keymap.set("n", "<leader>br", ":Brr<CR>", { silent = true, desc = "Run brr()" })

  -- Mini help
  vim.api.nvim_create_user_command("HelpBrr", function()
    vim.notify([[
Brr function/command:
  - Removes all lines in the current buffer that contain only '---'
Usage:
  :Brr, :BRR          Commands (must start with uppercase)
  :lua brr(), Brr(), BRR()  Call as Lua functions
  <leader>br          Keymap
]], vim.log.levels.INFO, { title = "Help: brr" })
  end, { desc = "Show help for Brr" })
end

return M
