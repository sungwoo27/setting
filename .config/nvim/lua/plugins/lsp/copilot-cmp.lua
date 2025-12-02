return {
  "zbirenbaum/copilot-cmp",
  event = "VeryLazy",
  dependencies = "copilot.lua",
  config = function()
    require("copilot_cmp").setup()
  end,
}
