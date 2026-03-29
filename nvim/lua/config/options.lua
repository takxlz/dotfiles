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
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"

-- クリップボード
vim.opt.clipboard = "unnamedplus"

-- 分割
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "screen"

-- UI
vim.opt.showmode = false
vim.opt.smoothscroll = true
vim.opt.confirm = true
vim.opt.mouse = "a"

-- 編集
vim.opt.virtualedit = "block"
vim.opt.inccommand = "split"

-- 不可視文字の表示
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", trail = "·", nbsp = "␣" }

-- ウィンドウ装飾
vim.opt.fillchars = { eob = " " }