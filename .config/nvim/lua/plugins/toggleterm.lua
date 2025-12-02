-- plugins/toggleterm.lua
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return math.floor(vim.o.columns * 0.4)
        end
      end,
      open_mapping = [[<C-\>]],
      direction = "float",
      shade_terminals = true,
      shading_factor = -10,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      persist_mode = true,
      close_on_exit = true,
      shell = vim.o.shell,
      auto_scroll = true,
      float_opts = {
        border = "curved",
        winblend = 3,
        title_pos = "center",
      },
    })

    local Terminal = require("toggleterm.terminal").Terminal

    local function open_term(direction)
      return function()
        local term = Terminal:new({
          direction = direction,
          hidden = true,
        })
        term:toggle()
      end
    end

    vim.keymap.set("n", "<leader>ts", open_term("vertical"), { desc = "Terminal Split Right" })
    vim.keymap.set("n", "<leader>ti", open_term("horizontal"), { desc = "Terminal Split Below" })
    vim.keymap.set("n", "<leader>tt", open_term("tab"), { desc = "Terminal New Tab" })
    vim.keymap.set("n", "<leader>tf", open_term("float"), { desc = "Terminal Floating" })
  end,
}
