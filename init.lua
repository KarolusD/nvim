--stylua: ignore start
-- Initialization ===========================================================
_G.Config = {}

-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = { "git", "clone", "--filter=blob:none", "https://github.com/echasnovski/mini.nvim", mini_path }
  vim.fn.system(clone_cmd)
  vim.cmd("packadd mini.nvim | helptags ALL")
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps'
require("mini.deps").setup({ path = { package = path_package } })

-- Define helpers
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
local cmd = function(cmd) return function() vim.cmd(cmd) end end
local load = function(spec, opts)
  return function()
    opts = opts or {}
    local slash = string.find(spec, "/[^/]*$") or 0
    local name = opts.init or string.sub(spec, slash + 1)
    if slash ~= 0 then
      add(vim.tbl_deep_extend("force", { source = spec }, opts.add or {}))
    end
    require(name)
    if opts.setup then require(name).setup(opts.setup) end
  end
end

-- Settings and mappings ====================================================
now(load("settings"))
now(load("utils"))
now(load("mappings"))
now(load("autocmds"))

-- Mini.nvim ================================================================
add({ name = "mini.nvim" })
now(load("folke/tokyonight.nvim", { add = { name = "tokyonight" }, init = "plugins.tokyonight" }))
now(cmd("colorscheme tokyonight-night"))

now(load("plugins.mini.basics"))
now(load("plugins.mini.icons"))
now(load("plugins.mini.sessions"))
now(load("plugins.mini.starter"))
now(load("plugins.mini.files"))

-- Testing if these three can be loaded later
later(load("plugins.mini.notify"))
later(load("plugins.mini.statusline"))
later(load("mini.tabline", { setup = {} }))

later(load("mini.align", { setup = {} }))
later(load("mini.animate",    { setup = {} }))
later(load("mini.bracketed", { setup = {} }))
later(load("mini.bufremove", { setup = {} }))
later(load("mini.colors", { setup = {} }))
later(load("mini.comment", { setup = {} }))
later(load("mini.cursorword", { setup = {} }))
later(load("mini.extra", { setup = {} }))
later(load("mini.jump", { setup = {} }))
later(load("mini.move", { setup = {} }))
later(load("mini.operators", { setup = {} }))
later(load("mini.splitjoin", { setup = {} }))
later(load("mini.trailspace", { setup = {} }))
later(load("mini.visits", { setup = {} }))
later(load("mini.surround", { setup = {} }))
later(load("mini.pairs", { setup = {} }))

later(load("plugins.mini.ai"))
later(load("plugins.mini.clue"))
later(load("plugins.mini.diff"))
later(load("plugins.mini.git"))
later(load("plugins.mini.hipatterns"))
later(load("plugins.mini.indentscope"))
later(load("plugins.mini.jump2d"))
later(load("plugins.mini.map"))
later(load("plugins.mini.misc"))
later(load("plugins.mini.pick"))

-- Mini.completion is too laggy due to the synchronous fallback. And, it
-- later(load("plugins.mini.completion"))


-- Other plugins ============================================================

later(load("mfussenegger/nvim-lint", { init = "plugins.nvim-lint" }))
later(load("stevearc/conform.nvim", { init = "plugins.conform" }))
later(load("tummetott/reticle.nvim", { init = "plugins.reticle" }))

later(load("nvim-treesitter/nvim-treesitter", {
  init = "plugins.treesitter",
  add = { hooks = { post_checkout = cmd("TSUpdate") } },
}))
later(function() add("nvim-treesitter/nvim-treesitter-textobjects") end)

later(load("nvim-treesitter/nvim-treesitter-context", {
  init = "treesitter-context",
  setup = {},
}))

local function build_blink(params)
  vim.notify('Building blink.cmp', vim.log.levels.INFO)
  local obj = vim.system({ 'cargo', 'build', '--release' }, { cwd = params.path }):wait()
  if obj.code == 0 then
    vim.notify('Building blink.cmp done', vim.log.levels.INFO)
  else
    vim.notify('Building blink.cmp failed', vim.log.levels.ERROR)
  end
end
later(load('saghen/blink.cmp', {
  init = "plugins.blink",
  add = {
    depends = {
      "rafamadriz/friendly-snippets",
    },
    hooks = {
      post_install = build_blink,
      post_checkout = build_blink,
    },
  }
}))

later(load("neovim/nvim-lspconfig", {
  init = "plugins.lspconfig",
  add = {
    depends = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "folke/lazydev.nvim"
    },
  },
}))

--stylua: ignore end
-- vim: ts=2 sts=2 sw=2 et
