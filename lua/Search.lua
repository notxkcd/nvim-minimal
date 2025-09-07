local M = {}

-- Define Search command
function M.setup()
  vim.api.nvim_create_user_command("Search", function(opts)
    -- Split input into words
    local words = vim.split(opts.args, " ")
    -- Escape regex special chars
    for i, w in ipairs(words) do
      words[i] = vim.fn.escape(w, "\\/.*$^~[]")
    end
    -- Build regex (word1|word2|word3)
    local pattern = "\\v(" .. table.concat(words, "|") .. ")"
    -- Enable hlsearch
    vim.opt.hlsearch = true
    -- Run search
    vim.cmd("/" .. pattern)
  end, {
    nargs = "+",   -- at least one argument required
    complete = "file",
  })
end

return M

