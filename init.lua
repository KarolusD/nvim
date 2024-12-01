-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("telescope").setup({
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    -- Add other default configurations here
  },
  extensions = {
    media_files = {
      filetypes = { "png", "jpg", "mp4", "webm", "pdf" },
      find_cmd = "rg",
    },
  },
})
