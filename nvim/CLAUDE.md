# Neovim 設定ファイル

## 概要
ゼロから構築中の Neovim (Lua) 設定ファイル。folke 氏の構成を参考にしたディレクトリ構造。

## ディレクトリ構成
```
nvim/
├── init.lua                 -- require("config") のみ
├── lua/
│   ├── config/
│   │   ├── init.lua         -- 各設定ファイルの読み込み
│   │   ├── options.lua      -- vim.opt 系
│   │   ├── keymaps.lua      -- キーマップ
│   │   ├── autocmds.lua     -- 自動コマンド
│   │   └── lazy.lua         -- lazy.nvim ブートストラップ
│   └── plugins/             -- 1プラグイン1ファイル
└── nvim_sample/             -- 参考用（他人の設定ファイル、編集しない）
```

## キーマップ方針
- `s` をウィンドウ・タブ操作のプレフィックスとして使用（デフォルトの s は無効化）
- `jj` でインサートモード離脱
- `<leader>` はスペースキー

## 導入済みプラグイン
- lazy.nvim（プラグインマネージャー）
- tokyonight.nvim（カラースキーム、night スタイル）
- lualine.nvim（ステータスライン、powerline セパレータ）
- bufferline.nvim（タブライン、slant スタイル）
- nvim-treesitter（TS/JS/Python/Java/Rust 等）
- nvim-autopairs（括弧自動閉じ）
- Comment.nvim（gc でコメントトグル）
- mini.surround（括弧操作 sa/sd/sr）
- which-key.nvim（キーバインド候補表示）
- hydra.nvim（ウィンドウリサイズモード、トリガーキー未確定）
- nvim-web-devicons（アイコン）

## 未設定・今後の予定
- LSP（nvim-lspconfig）
- 補完（nvim-cmp 等）
- ファイラー（oil.nvim, neo-tree 等）
- fuzzy finder（telescope, fzf-lua 等）
- Git 連携（gitsigns 等）
- hydra.nvim のトリガーキー確定（s<Space> は leader と衝突、se が候補）

## 環境
- ターミナル: WezTerm
- フォント: HackGen Nerd Font (HackGenConsoleNF)
- よく使う言語: TypeScript, JavaScript, Python, Java, Rust
