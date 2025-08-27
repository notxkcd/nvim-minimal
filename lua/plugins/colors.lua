return {
  --========================================================================
  --============================== THEMES ==================================
  --========================================================================
  
  { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} },
  -- { "shaunsingh/solarized.nvim" },
  { "habamax/vim-pire" },
  { "mellow-theme/mellow.nvim" },
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('onedark').setup {
        style = 'darker'
      }
      -- Enable theme
      require('onedark').load()
    end
  },
  -- { "Mofiqul/dracula.nvim" },
  -- { "sainnhe/gruvbox-material" },
  -- { "loctvl842/monokai-pro.nvim" },
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
}
