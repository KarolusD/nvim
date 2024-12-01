return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-media-files.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    telescope.setup({
      defaults = {
        selection_caret = "→ ",
        prompt_prefix = " 🔍 ",
        log_level = "debug",
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },

        extensions = {
          media_files = {
            filetypes = { "png", "webp", "jpg", "jpeg" },
            find_cmd = "rg",
          },
        },
      },
    })

    telescope.load_extension("media_files")
  end,
}
