-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap -- for conciseness

-- keymap.del({ "n", "i" }, "<A-j>")
-- keymap.del({ "n", "i" }, "<A-k>")
-- keymap.del({ "n", "t" }, "<C-j>")
-- keymap.del({ "n", "t" }, "<C-k>")
-- keymap.del({ "n", "t" }, "<C-h>")
keymap.del({ "n" }, "<S-l>")
keymap.del({ "n" }, "<S-h>")

keymap.set({ "n", "t" }, "<A-h>", "<CMD>NavigatorLeft<CR>")
keymap.set({ "n", "t" }, "<A-l>", "<CMD>NavigatorRight<CR>")
keymap.set({ "n", "t" }, "<A-k>", "<CMD>NavigatorUp<CR>")
keymap.set({ "n", "t" }, "<A-j>", "<CMD>NavigatorDown<CR>")
keymap.set({ "n", "t" }, "<A-p>", "<CMD>NavigatorPrevious<CR>")
keymap.set({ "n", "t" }, "<C-l>", "$")
keymap.set({ "n", "t" }, "<C-h>", "^")

-- Add a specific mapping for <A-l> in insert mode to type "ł"
keymap.set("i", "<A-l>", "ł")

-- Obsidian command mappings
keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<cr>", { desc = "Open Note" })
keymap.set("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "New Note" })
keymap.set("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Quick Switch" })
keymap.set("n", "<leader>of", "<cmd>ObsidianFollowLink<cr>", { desc = "Follow Link" })
keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", { desc = "Backlinks" })
keymap.set("n", "<leader>ot", "<cmd>ObsidianTags<cr>", { desc = "Tags" })
keymap.set("n", "<leader>od", "<cmd>ObsidianToday<cr>", { desc = "Today's Note" })
keymap.set("n", "<leader>oy", "<cmd>ObsidianYesterday<cr>", { desc = "Yesterday's Note" })
keymap.set("n", "<leader>om", "<cmd>ObsidianTomorrow<cr>", { desc = "Tomorrow's Note" })
keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<cr>", { desc = "Links" })
keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<cr>", { desc = "Search" })
keymap.set("n", "<leader>op", "<cmd>ObsidianPasteImg<cr>", { desc = "Paste Image" })
keymap.set("n", "<leader>or", "<cmd>ObsidianRename<cr>", { desc = "Rename Note" })
keymap.set("n", "<leader>ox", "<cmd>ObsidianTOC<cr>", { desc = "Table of Contents" })
keymap.set({ "n", "v" }, "<leader>oe", "<cmd>ObsidianExtractNote<cr>", { desc = "Extract Note" })
keymap.set("n", "<leader>ow", "<cmd>ObsidianWorkspace<cr>", { desc = "Workspace" })
