vim.opt.number = true
vim.opt.sw = 2

vim.g.clipboard = "xclip"
vim.opt.termguicolors = true
vim.cmd([[set clipboard+=unnamedplus]])

vim.filetype.add({
  extension = {
    v = "verilog",
  }
})
