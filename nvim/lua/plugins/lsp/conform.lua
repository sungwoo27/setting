-- plugins/lsp/conform.lua
return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
	c = { "clang_format" },
	cpp = { "clang_format" },
      },
      formatters = {
	clang_format = {
	  command = "/usr/lib/llvm-10/bin/clang-format",
	  args = { "--assume-filename", "$FILENAME", "--style=file" },
	}
      },
    })

    vim.keymap.set("n", "<F3>", function()
      require("conform").format({ async = true, debug = true })
    end, { desc = "Format current buffer" })
  end,
}
