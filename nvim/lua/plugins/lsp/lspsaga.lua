-- plugins/lsp/lspsaga.lua
return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("lspsaga").setup({})

    vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "Lspsaga: Go to definition" })
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Lspsaga: Hover documentation" })
    vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "Lspsaga: Rename symbol" })
    vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Lspsaga: Code action" })
    vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Lspsaga: Prev diagnostic" })
    vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Lspsaga: Next diagnostic" })

    vim.keymap.set("n", "<leader>pd", "<cmd>Lspsaga peek_definition<CR>", { desc = "Lspsaga: Peek definition" })
    vim.keymap.set("n", "<leader>pt", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "Lspsaga: Peek type definition" })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}
