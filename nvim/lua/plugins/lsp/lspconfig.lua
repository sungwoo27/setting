-- plugins/lsp/lspconfig.lua
return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.config.clangd = {
      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
      end,
    }

    vim.lsp.enable('clangd')
    vim.lsp.enable('pyright')

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
    })
  end,
}
