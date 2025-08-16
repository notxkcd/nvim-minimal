-- It is recommended to put this into a separate file (e.g. lua/plugins.lua)
-- and require it from your init.lua

return {
  --========================================================================
  --============================== THEMES ==================================
  --========================================================================
  
  { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} },
  -- { "shaunsingh/solarized.nvim" },
  { "habamax/vim-pire" },
  -- { "Mofiqul/dracula.nvim" },
  -- { "sainnhe/gruvbox-material" },
  -- { "loctvl842/monokai-pro.nvim" },
  -- { "navarasu/onedark.nvim" },
  -- { "Shatur/neovim-ayu" },
  -- { 
  --   "projekt0n/github-nvim-theme",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("github-theme").setup({})
  --     vim.cmd("colorscheme github_dark")
  --   end,
  -- },

  --========================================================================
  --============================== UTILITIES ===============================
  --========================================================================

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 30, side = "left" },
        actions = { open_file = { quit_on_open = true } },
      })
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
      vim.keymap.set("n", "<leader>f", ":NvimTreeFindFile<CR>", { silent = true })
    end,
  },

  -- Fuzzy finding
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = { 
          file_ignore_patterns = { "node_modules", ".git" },
          borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
        },
      })
      vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
      vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
      vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
      vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
    end,
  },

  -- Commenting
  { "tpope/vim-commentary" },

  -- Alignment
  {
    "Vonr/align.nvim",
    branch = "v2",
    lazy = true,
    init = function()
      local NS = { noremap = true, silent = true }
      vim.keymap.set("x", "aa", function() require("align").align_to_char({ length = 1 }) end, NS)
      vim.keymap.set("x", "ad", function() require("align").align_to_char({ preview = true, length = 2 }) end, NS)
      vim.keymap.set("x", "aw", function() require("align").align_to_string({ preview = true, regex = false }) end, NS)
      vim.keymap.set("x", "ar", function() require("align").align_to_string({ preview = true, regex = true }) end, NS)
      vim.keymap.set("n", "gaw", function() local a = require("align"); a.operator(a.align_to_string, { regex = false, preview = true }) end, NS)
      vim.keymap.set("n", "gaa", function() local a = require("align"); a.operator(a.align_to_char) end, NS)
    end,
  },

  -- Multiple cursors
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
        local mc = require("multicursor-nvim")
        mc.setup()
        local set = vim.keymap.set
        set({"n", "x"}, "<up>", function() mc.lineAddCursor(-1) end)
        set({"n", "x"}, "<down>", function() mc.lineAddCursor(1) end)
        set({"n", "x"}, "<leader><up>", function() mc.lineSkipCursor(-1) end)
        set({"n", "x"}, "<leader><down>", function() mc.lineSkipCursor(1) end)
        set({"n", "x"}, "<leader>n", function() mc.matchAddCursor(1) end)
        set({"n", "x"}, "<leader>s", function() mc.matchSkipCursor(1) end)
        set({"n", "x"}, "<leader>N", function() mc.matchAddCursor(-1) end)
        set({"n", "x"}, "<leader>S", function() mc.matchSkipCursor(-1) end)
        set("n", "<c-leftmouse>", mc.handleMouse)
        set("n", "<c-leftdrag>", mc.handleMouseDrag)
        set("n", "<c-leftrelease>", mc.handleMouseRelease)
        set({"n", "x"}, "mw", mc.matchAllAddCursors)
        set({"n", "x"}, "<c-q>", mc.toggleCursor)
        set("n", "ga", mc.addCursorOperator)
        set("x", "S", mc.splitCursors)
        mc.addKeymapLayer(function(layerSet)
            layerSet({"n", "x"}, "<left>", mc.prevCursor)
            layerSet({"n", "x"}, "<right>", mc.nextCursor)
            layerSet({"n", "x"}, "<leader>x", mc.deleteCursor)
            layerSet("n", "<esc>", function()
                if not mc.cursorsEnabled() then
                    mc.enableCursors()
                else
                    mc.clearCursors()
                end
            end)
        end)
        local hl = vim.api.nvim_set_hl
        hl(0, "MultiCursorCursor", { reverse = true })
        hl(0, "MultiCursorVisual", { link = "Visual" })
        hl(0, "MultiCursorSign", { link = "SignColumn"})
        hl(0, "MultiCursorMatchPreview", { link = "Search" })
        hl(0, "MultiCursorDisabledCursor", { reverse = true })
        hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
        hl(0, "MultiCursorDisabledSign", { link = "SignColumn"})
    end
  },

  -- Other utilities
  { "tpope/vim-dispatch" },
  { "tpope/vim-surround" },
  { "ThePrimeagen/harpoon" },
  { "vimwiki/vimwiki" },
  {
    "TimUntersberger/neofs",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("neofs").setup({
        devicons = true,
      })
      vim.keymap.set("n", "<leader>n", function()
        require("neofs").open()
      end, { noremap = true })
    end,
  },
  { "drzel/vim-gui-zoom" },

  --========================================================================
  --============================== LANGUAGES ===============================
  --========================================================================
  
  { "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "vim", "html", "javascript" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  { "sheerun/vim-polyglot" },
  { "vmchale/ats-vim" },
  { "ixru/nvim-markdown" },
  { "gauteh/vim-cppman" },
  { "rescript-lang/vim-rescript", ft = "rescript" },
  { "aspeddro/rescript-tools.nvim" },
  { "elmcast/elm-vim" },
  { "mtdl9/vim-log-highlighting", ft = { "log" } },

  --========================================================================
  --============================== COMPILING & RUNNING =====================
  --========================================================================
  
  { "jpalardy/vim-slime" },
}
