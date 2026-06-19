return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ruff = {
        on_attach = function(client)
          -- Keep ruff for linting/diagnostics, disable its formatter
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      },
    },
  },
}
 

