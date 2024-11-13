vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.g.python3_host_prog = "~/miniconda3/bin/python3"
-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

local null_ls = require("null-ls")

null_ls.setup({
 sources = { 
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.ruff,
    null_ls.builtins.diagnostics.ruff,
    -- null_ls.builtins.diagnostics.mypy.with({
    --   extra_args = function()
    --     local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
    --     return { "--python-executable", virtual .. "\\Scripts\\python.exe" }
    --     -- return { "--python-executable", virtual .. "\\python.exe" }
    --   end,
    -- }),
    -- null_ls.builtins.diagnostics.golangci_lint,
-- null_ls.builtins.diagnostics.shellcheck.with({
--             command = "C:\\Program Files (x86)\\AutoIt3\\Au3Check.exe", -- or the path to your linter
--             args = { "$FILENAME" },
--         }),
  },
})

require('lspconfig').ruff.setup {
  trace = 'messages',
  init_options = {
    settings = {
      logLevel = 'debug',
    }
  }
}

vim.cmd([[
augroup Linting
  autocmd!
  autocmd BufWritePre *.go lua vim.lsp.buf.format()
  autocmd BufWritePre *.py lua vim.lsp.buf.format()
augroup END
]])

require("remote-nvim").setup()

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
