return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    which_key = true,
    workspaces = {
      {
        name = "Second Brain",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Second Brain/",
      },
    },
    templates = {
      folder = "Templates",
    },
    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "/Daily Notes",
      -- Optional, default tags to add to each new daily note created.
      default_tags = { "daily-notes" },
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = "DailyTemplate",
    },

    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,

    note_path_func = function(spec)
      -- Use the title directly as the filename
      local path = spec.dir / spec.title
      return path:with_suffix(".md")
    end,
  },
}
