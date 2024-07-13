-- Install Lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath, })
end
vim.opt.rtp:prepend(lazypath)

-- Load common plugins
local plugin_list = { { import = "plugins" } }

-- Load local plugins
if vim.fn.glob(vim.fn.stdpath('config') .. '/lua/local/plugins*') ~= '' then 
  table.insert(plugin_list, { import = "local.plugins" }) 
end

-- Load macOS plugins
if jit.os == "OSX" and vim.fn.glob(vim.fn.stdpath('config') .. '/lua/macos/plugins*') ~= '' then 
  table.insert(plugin_list, { import = "macos.plugins" }) 
end

-- Install Lazy plugins
require("lazy").setup({
    -- plugin_list
    import = "plugins"
  }, {
    ui = {
        -- If you are using a Nerd Font: set icons to an empty table which will use the
        -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
        icons = vim.g.have_nerd_font and {} or {
          cmd = "⌘", config = "🛠", event = "📅", ft = "📂", init = "⚙", keys = "🗝", plugin = "🔌", runtime = "💻", require = "🌙", source = "📄", start = "🚀", task = "📌", lazy = "💤 ",
        },
    },
  })

-- vim: ts=2 sts=2 sw=2 et
