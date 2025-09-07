vim.g.mapleader = " "
local map = vim.keymap.set
local nomap = vim.keymap.del
local cmd = vim.cmd

map("n", "<leader>hm", ":lua require(\"harpoon.mark\").add_file()\n\n");
map("n", "<leader>he", ":lua require(\"harpoon.ui\").toggle_quick_menu()\n\n");
map("n", "<leader>hp", ":lua require(\"harpoon.ui\").nav_prev()\n\n");
map("n", "<leader>hn", ":lua require(\"harpoon.ui\").nav_next()\n\n");
map("n", "<C-s>", ":w \n");
map("n", "<S-q>", ":q! \n");

map("n", "<C-f>", ":lua require('fzf-lua').files() \n");
map("n", "<leader>g", ":lua require('fzf-lua').live_grep() \n");
map("n", "<leader>f", ":FzfLua\n");

map("n", "<leader>R", ":FzfLua resume\n", { noremap = true, silent = true });

map("n", "<F5>", ":TMUXcompile Run\n", { silent = true });
-- map("n", ",b", ":TMUXcompile Run\n", { silent = true });
map("n", "<leader>b", ":TMUXcompile RunV\n", { silent = true });

map("n", ",p", ":!opout <c-r>%\n\n");
map("n", ",c", ":Compile\n", { silent = true });
map("n", "<leader>r", ":Recompile\n", { silent = true });


--Neovide Settings
-- vim.opt.guifont = "BlexMono Nerd Font Mono:h12"
-- vim.opt.guifont = "Inconsolata Nerd Font:h12"
-- Zoom In/Out
vim.keymap.set('n', '<C-=>', ':ZoomIn<CR>', { silent = true })
vim.keymap.set('n', '<A-S-k>', ':ZoomIn<CR>', { silent = true })
vim.keymap.set('n', '<C-->', ':ZoomOut<CR>', { silent = true })
vim.keymap.set('n', '<A-S-j>', ':ZoomOut<CR>', { silent = true })



-- Quickfix list keymaps
map("n", "<C-k>", ":cprev\n", { noremap = true, silent = true });
map("n", "<C-j>", ":cnext\n", { noremap = true, silent = true });
map("n", "<C-E>", ":copen\n", { noremap = true, silent = true });

map("n", "<C-Tab>", ":tabnext\n", { noremap = true, silent = true });
map("n", "<C-S-Tab>", ":tabprev\n", { noremap = true, silent = true });

map("n", "<C-PageDown>", ":tabnext\n", { noremap = true, silent = true });
map("n", "<C-PageUp>", ":tabprev\n", { noremap = true, silent = true });

map("n", "<C-Right>", ":tabnext\n", { noremap = true, silent = true });
map("n", "<C-Left>", ":tabprev\n", { noremap = true, silent = true });

map('n', 'ciw', '"_ciw', { noremap = true, silent = true });

map("i", "<C-w>", "<C-o><C-w>w<Esc>", { noremap = true, silent = true });

map("n", "yp", function()
  local filepath = vim.fn.expand("%:p")
  vim.fn.setreg("+", filepath)
  print("Copied: " .. filepath)
end, { noremap = true, silent = true });

map('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true });
map('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true });
map('i', ',u', '<Esc>yyp<c-v>$r-A', { noremap = true, silent = true });
map('i', ',c', '<Esc>$a ✅<Esc>', { noremap = true, silent = true });

-- Open compiler
vim.api.nvim_set_keymap('n', '<F6>', "<cmd>CompilerOpen<cr>", { noremap = true, silent = true });

-- Redo last selected option
vim.api.nvim_set_keymap('n', '<S-F6>',
     "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
  .. "<cmd>CompilerRedo<cr>",
 { noremap = true, silent = true });

-- Toggle compiler results
vim.api.nvim_set_keymap('n', '<S-F7>', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true });

vim.keymap.set('n', '<space>o', function()
  local qf_is_open = false
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      qf_is_open = true
      break
    end
  end
  if qf_is_open then
    vim.cmd('cclose')
  else
    vim.cmd('copen')
  end
end, { noremap = true, silent = true });

vim.keymap.set("n", ",o", function()
  local target_name = "compilation"
  local bufnr = nil

  for _, b in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_name(b):match(target_name) then
      bufnr = b
      break
    end
  end

  if not bufnr then
    print("Buffer '" .. target_name .. "' not found.")
    return
  end

  local is_visible = false
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_buf(win) == bufnr then
      is_visible = true
      vim.api.nvim_win_close(win, true) -- force close window showing it
      return
    end
  end

  vim.cmd("vsplit")
  vim.api.nvim_win_set_buf(0, bufnr)
end, { desc = "Toggle 'compilation' buffer" });

local function smap(mode, lhs, rhs, opts)
  opts = opts or { noremap = true, silent = true }
  vim.keymap.set(mode, lhs, rhs, opts)
end

local function show_compiler_output()
  local filename = vim.fn.expand('%')
  local file_ext = vim.fn.expand('%:e')
  local output = vim.fn.systemlist('compiler ' .. filename)
  output = vim.tbl_map(function(line)
    return type(line) == 'string' and line:gsub('\r$', '') or ''
  end, output)

  local target_buf_name = 'compilerlog_right'
  local buf = nil
  local target_win = nil

  for _, b in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_name(b):match(target_buf_name .. '$') then
      buf = b
      break
    end
  end

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_buf(win) == buf then
      target_win = win
      break
    end
  end

  local current_win = vim.api.nvim_get_current_win()

  if not buf then
    buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_name(buf, target_buf_name)

    vim.bo[buf].buftype = 'nofile'
    vim.bo[buf].bufhidden = 'wipe'
    vim.bo[buf].swapfile = false

    vim.opt.relativenumber = false

    if file_ext == 'java' then
      vim.bo[buf].filetype = 'log'
    elseif file_ext == 'py' then
      vim.bo[buf].filetype = 'python'
    else
      vim.bo[buf].filetype = 'log'
    end

    vim.api.nvim_buf_set_keymap(buf, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
  end

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)

  if not target_win then
    local original_hidden = vim.o.hidden
    vim.o.hidden = true
    vim.cmd('botright vsplit')
    local new_win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(new_win, buf)
    vim.api.nvim_set_current_win(current_win)
    vim.o.hidden = original_hidden
  end

  vim.api.nvim_set_current_win(current_win)
end

smap('n', '<leader>c', show_compiler_output)
vim.keymap.set('i', '<C-Space>', 'vim.lsp.buf.completion()', {noremap = true, silent = true})




vim.keymap.set("n", "<leader>jc", function()
  local cache_path = os.getenv("USERPROFILE") .. "\\.cache\\jdtls"
  os.execute('rmdir /s /q "' .. cache_path .. '"')
  print("JDTLS cache cleared from " .. cache_path)
end, { desc = "Clear JDTLS cache" })
