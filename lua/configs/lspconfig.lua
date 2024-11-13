-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "pyright", "svelte", "clangd", "dockerls"}
-- local servers = { "html", "cssls", "pyright" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.gopls.setup{
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
  single_file_support = true,
}

-- JavaScript/TypeScript
lspconfig.ts_ls.setup {
  on_attach = function(client)
    -- Disable tsserver's own formatting as you'll use Prettier
    client.server_capabilities.document_formatting = false
  end,
  capabilities = nvlsp.capabilities,
}

-- Enable ESLint
lspconfig.eslint.setup {}

lspconfig.svelte.setup {
 -- on_init = nvlsp.on_init,
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "svelte" },
  cmd = { "svelteserver", "--stdio" },
  root_dir = lspconfig.util.root_pattern("package.json", ".git"),
  settings = {
    svelte = {
      plugin = {
        html = {
          completions = {
            enable = true,
            emmet = false,
          },
        },
        svelte = {
          format = {
            enable = true,
          },
        },
        css = {
          completions = {
            enable = true,
            emmet = false,
          },
        },
      },
    },
  },
}
-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
