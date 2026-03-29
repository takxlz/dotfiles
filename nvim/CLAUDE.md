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
└── after/
    └── lsp/                 -- 言語サーバーごとのカスタマイズ（ファイル名=サーバー名）
```

## 導入済みプラグイン

- lazy.nvim（プラグインマネージャー）
- tokyonight.nvim（カラースキーム、night スタイル）
- lualine.nvim（ステータスライン、powerline セパレータ）
- bufferline.nvim（タブライン、slant スタイル）
- nvim-treesitter（TS/JS/Python/Java/Rust 等）
- nvim-autopairs（括弧自動閉じ）
- Comment.nvim（コメントトグル）
- mini.surround（囲み操作）
- which-key.nvim（キーバインド候補表示）
- hydra.nvim（ウィンドウリサイズモード）
- nvim-web-devicons（アイコン）
- nvim-lspconfig（LSP設定）
- mason.nvim（言語サーバーのインストール管理）
- blink.cmp（補完エンジン）
- oil.nvim（バッファ型ファイラー）
- neo-tree.nvim（ツリー型ファイラー）
- fzf-lua（ファジーファインダー）
- gitsigns.nvim（git変更表示、hunk操作）
- vim-fugitive（git操作全般）
- diffview.nvim（変更ファイル一覧、ファイル履歴、コンフリクト解消）
- aerial.nvim（シンボル一覧サイドバー）
- todo-comments.nvim（TODO/FIXME等のハイライト + 検索）
- indent-blankline.nvim（インデントガイドライン表示）
- conform.nvim（保存時自動フォーマット）
- nvim-lint（リンター連携）
- nvim-treesitter-textobjects（関数・クラス単位のテキストオブジェクト）
- im-select.nvim（ノーマルモード復帰時にIMEを自動オフ、macismバックエンド）
- nvim-ts-autotag（HTML/JSXタグの自動閉じ・自動リネーム）
- nvim-treesitter-context（関数名・クラス名の画面上部固定表示）
- flash.nvim（画面内高速ジャンプ、gsキーで発動）
- inc-rename.nvim（LSPリネームのリアルタイムプレビュー）
- highlight-undo.nvim（undo/redo時の変更箇所ハイライト）

## 有効な言語サーバー

- lua_ls（Lua、after/lsp/lua_ls.lua でカスタマイズ）
- ts_ls（TypeScript/JavaScript）
- pyright（Python）
- rust_analyzer（Rust）
- jdtls（Java）
- jsonls（JSON）
- html（HTML）
- cssls（CSS）

カスタマイズが必要になったら `after/lsp/<サーバー名>.lua` を追加する。

## フォーマッター・リンター

mason で自動インストールされる。

- stylua（Lua）
- prettier（TS/JS/JSON/HTML/CSS/YAML/Markdown）
- black（Python）
- rustfmt（Rust、rustup 経由）
- eslint_d（TS/JS リンター）
- ruff（Python リンター）

## 環境

- ターミナル: WezTerm
- フォント: HackGen Nerd Font (HackGenConsoleNF)
- よく使う言語: TypeScript, JavaScript, Python, Java, Rust

## 参照

キーマップ・コマンドの詳細は `CHEATSHEET.md` を参照。
