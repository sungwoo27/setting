vim.opt.number = true
vim.opt.sw = 2

vim.opt.termguicolors = true
vim.cmd([[set clipboard+=unnamedplus]])

vim.filetype.add({
  extension = {
    v = "verilog",
  }
})
