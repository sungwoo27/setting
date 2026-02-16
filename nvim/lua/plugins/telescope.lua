return {
  'nvim-telescope/telescope.nvim', version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  keys = {
    { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Telescope: Find files" },
    { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Telescope: Live grep" },
    { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Telescope: Buffers" },
    { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Telescope: Help tags" },
    { "<leader>fp", function() require("telescope.builtin").git_files() end, desc = "Telescope: Git-tracked files" },
  },
  config = function()
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    require("telescope").setup({
      defaults = {
	mappings = {
	  n = {
	    ["t"] = function(prompt_bufnr)
	      local entry = action_state.get_selected_entry()
	      actions.close(prompt_bufnr)
	      vim.cmd("tabnew " .. entry.path)
	    end,
	    ["s"] = function(prompt_bufnr)
	      local entry = action_state.get_selected_entry()
	      actions.close(prompt_bufnr)
	      vim.cmd("vsplit " .. entry.path)
	    end,
	  },
	},
      },
    
      extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          }
        }
      })

      require('telescope').load_extension('fzf')
  end,
}
