-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 行番号
vim.opt.number = true
vim.opt.relativenumber = true

-- インデント
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

-- 検索
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- メッセージ
vim.opt.shortmess:append("I")

-- 表示
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.wrap = false

-- ファイル
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- クリップボード
vim.opt.clipboard = "unnamedplus"

-- 分割
vim.opt.splitbelow = true
vim.opt.splitright = true