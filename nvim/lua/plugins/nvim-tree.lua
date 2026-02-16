return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup ({
      on_attach = function(bufnr)
	local api = require("nvim-tree.api")

	local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set("n", "s", api.node.open.vertical, opts)
	vim.keymap.set("n", "i", api.node.open.horizontal, opts)
	vim.keymap.set("n", "t", api.node.open.tab, opts)
	vim.keymap.set("n", "C", api.tree.change_root_to_node, opts)
	vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts)

      end,
      git = {
	enable = true,
	timeout = 1000,  -- default 400, increase to 1000ms or more
      },
    })
  end,
  keys = {
    { "<F4>", "<cmd>NvimTreeToggle<cr>", desc = "Nvimtree toggle" },
  }
}
