return {
  "akinsho/bufferline.nvim", version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  event="ColorScheme",

  opts = {
    mode = "tabs",
    separator_style = "slant",
    diagnostics = "nvim_lsp",
    show_buffer_icons = true,
    show_close_icon = true,
    always_show_bufferline = true,

    tab_label = function(tab)

  local wins = vim.api.nvim_tabpage_list_wins(tab.id)
  local candidate = nil

  for i, win in ipairs(wins) do
    local buf = vim.api.nvim_win_get_buf(win)
    local name = vim.api.nvim_buf_get_name(buf)
    local ft = vim.api.nvim_get_option_value("filetype", { buf = buf })


    if name ~= "" and not name:match("^NvimTree") and ft ~= "NvimTree" then
      candidate = vim.fn.fnamemodify(name, ":t")
    end
  end

  return candidate or ("Tab " .. tab.id)
end

  },


  config = function(_, opts)
    vim.opt.termguicolors = true
    require("bufferline").setup({
      options = opts,
      highlights = require("rose-pine.plugins.bufferline")
      -- highlights = require("vesper").bufferline.highlights,
    })
  end,
}

