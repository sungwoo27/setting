-- plugins/lsp/lspconfig.lua
return {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    require("lspconfig").clangd.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
	client.server_capabilities.documentFormattingProvider = false
      end
    })
    require("lspconfig").pyright.setup({ capabilities = capabilities,
      settings = {
	python = {
	  analysis = {
	    typeCheckingMode = "basic",
	    diagnosticSeverityOverrides = {
	      reportAttributeAccessIssue = "none",
	    },
	  },
	},
      },
    })

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
	border = "rounded",
	source = "always",
	header = "",
	prefix = "",
      },
    })
  end,
}
