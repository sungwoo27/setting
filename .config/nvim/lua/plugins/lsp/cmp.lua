-- plugins/lsp/cmp.lua
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets", 
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- Load vscode-style snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
	expand = function(args)
	  luasnip.lsp_expand(args.body)
	end,
      },
      mapping = cmp.mapping.preset.insert({
	["<Tab>"] = cmp.mapping(function(fallback)
	  if cmp.visible() then
	    cmp.select_next_item()
	  elseif luasnip.expand_or_jumpable() then
	    luasnip.expand_or_jump()
	  else
	    fallback()
	  end
	end, { "i", "s" }),
	["<S-Tab>"] = cmp.mapping(function(fallback)
	  if luasnip.jumpable(-1) then
	    luasnip.jump(-1)
	  else
	    fallback()
	  end
	end, { "i", "s" }),
	["<C-e>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
	{ name = "copilot" },
	{ name = "nvim_lsp" },
	{ name = "luasnip" },
      }),
    })
  end,
}
