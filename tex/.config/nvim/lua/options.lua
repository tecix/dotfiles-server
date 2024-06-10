vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.updatetime = 250 -- Decrease update time
vim.opt.inccommand = "split"
-- vim.opt.cursorline = true
-- vim.opt.scrolloff = 10
vim.opt.conceallevel = 1

-- Try to load local configuration files
pcall(require, "local.options")

-- if jit.os == "OSX" then require("macos.options") end
if jit.os == "OSX" then pcall(require,"macos.options") end

