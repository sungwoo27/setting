-- plugins/lsp/copilot.lua
return {
  "zbirenbaum/copilot.lua",
  event = "VeryLazy",
  cmd = "Copilot",
  build = ":Copilot auth",
  config = function()
    require("copilot").setup({
      suggestion = { enabled = true },
      panel = { enabled = false },
    })
  end,
}
