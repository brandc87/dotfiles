local opt = vim.opt

opt.completeopt = "menu,menuone,noselect"
opt.cursorline = true
opt.expandtab = true
opt.hlsearch = true
opt.ignorecase = true
opt.list = true
opt.listchars = { tab = " ", trail = "·" }
opt.mouse = "a"
opt.number = true
opt.scrolloff = 4
opt.shiftwidth = 2
opt.showmode = false
opt.sidescrolloff = 8
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true
opt.undodir = vim.fn.stdpath("config") .. "/undo"
opt.undofile = true

