return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
 {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
{
  "okuuva/auto-save.nvim",
  cmd = "ASToggle", -- optional for lazy loading on command
  event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
  opts = {
    -- your config goes here
    -- or just leave it empty :)
    preserve_undo= true,
    debounce_delay = 1000
  },
},
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css", "python"
  		},
  	},
  },
  {
 "nosduco/remote-sshfs.nvim",
 dependencies = { "nvim-telescope/telescope.nvim" },
 opts = {
  -- Refer to the configuration section below
 mounts = {
    base_dir = vim.fn.expand "$HOME" .. "/.sshfs/", -- base directory for mount points
    unmount_on_exit = true, -- run sshfs as foreground, will unmount on vim exit
  },
  log = {
    enable = false, -- enable logging
    truncate = false, -- truncate logs
    types = { -- enabled log types
      all = false,
      util = false,
      handler = false,
      sshfs = false,
    },
  }, -- or leave empty for defaults
 },
},
  {
    "mattn/emmet-vim"
  },
  {
   "amitds1997/remote-nvim.nvim",
   version = "v0.3.9", -- Pin to GitHub releases
   dependencies = {
       "nvim-lua/plenary.nvim", -- For standard functions
       "MunifTanjim/nui.nvim", -- To build the plugin UI
       "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
   },
   config = true,
},
-- {
--   "iamcco/markdown-preview.nvim",
--   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
--   build = "cd app && npm install",
--   init = function()
--     vim.g.mkdp_filetypes = { "markdown" }
--   end,
--   ft = { "markdown" },
-- },
{
    'MeanderingProgrammer/render-markdown.nvim',
ft = { 'markdown', 'quarto' },
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
},
}

