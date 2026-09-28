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
│   │   ├── lazy.lua         -- lazy.nvim ブートストラップ
│   │   └── treesitter-compat.lua
│   │                        -- nvim-treesitter master と Neovim 0.12 の互換レイヤ
│   └── plugins/             -- 1プラグイン1ファイル
└── after/
    └── lsp/                 -- 言語サーバーごとのカスタマイズ（ファイル名=サーバー名）
```

## 導入済みプラグイン

- lazy.nvim（プラグインマネージャー）
- tokyonight.nvim（カラースキーム、night スタイル）
- lualine.nvim（ステータスライン、powerline セパレータ）
- bufferline.nvim（タブライン、tabs モードでタブページのみ表示、thin セパレータ）
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
- neo-tree.nvim（ツリー型ファイラー、OS のファイル監視で外部変更を自動反映）
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

## 外部でのファイル変更への追従

- ツリー表示: neo-tree の `use_libuv_file_watcher = true`。OS のファイル監視を使うので
  nvim にフォーカスが無くても反映される。false のままだと nvim 内で保存したときしか更新されない
- バッファ内容: `autocmds.lua` で `FocusGained` / `BufEnter` / `CursorHold` / `CursorHoldI` に
  `checktime` を割り当てている。`autoread` は Neovim の既定で有効だが、検査の契機が無いと反映されない
- 読み直しが起きたときは `FileChangedShellPost` で通知する
- `CursorHold` は `updatetime`（既定 4000ms）のアイドル後に発火する

## nvim-treesitter と Neovim 0.12 の互換

- Neovim 0.12 で `vim.treesitter.query.add_directive` / `add_predicate` の `all` オプションが
  廃止され、ハンドラに渡る `match[capture_id]` が常にノードの配列になった
- nvim-treesitter は master ブランチが `{ all = false }` を渡したまま単一ノード前提なので、
  `#downcase!` `#set-lang-from-mimetype!` `#set-lang-from-info-string!` などが配列を TSNode として
  扱い `node:range()` で落ちる（例: markdown の ```` ```bash ```` フェンス内に heredoc があると発生）
- `lua/config/treesitter-compat.lua` で配列を単一ノードへ畳むラッパを挟んで登録し直す。
  `treesitter.lua` の `config` から `configs.setup()` の後に呼ぶ
- ハンドラは適用時に名前で引かれるので、登録済みのクエリにも即座に効く
- main ブランチへ移行したらこのファイルごと削除してよい

## LSP ログ

- パス: `~/.local/state/nvim/lsp.log`（`vim.lsp.get_log_path()`）
- 言語サーバーの stderr は Neovim 側で ERROR として無条件に記録される。
  `vim.lsp.set_log_level()` を下げても止まらない
- 過去に rust-analyzer のパニックループで 21GB まで膨らんだため、
  `lspconfig.lua` の冒頭で 50MB を超えていたら起動時に切り詰める
- 上限を変えるときは `lspconfig.lua` の `max_log_bytes`

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

mason で自動インストールされる。書式設定は `nvim/.stylua.toml`（2スペース、120桁）。
このファイルが無いと stylua の既定であるタブインデントが適用され、
保存時フォーマットが全ファイルを書き換えてしまう。

- stylua（Lua）
- prettier（TS/JS/JSON/HTML/CSS/YAML/Markdown）
- black（Python）
- rustfmt（Rust、rustup 経由）
- eslint_d（TS/JS リンター）
- ruff（Python リンター）

## 環境

- ターミナル: Ghostty
- フォント: HackGen Nerd Font (HackGenConsoleNF)
- よく使う言語: TypeScript, JavaScript, Python, Java, Rust

## 参照

キーマップ・コマンドの詳細は `CHEATSHEET.md` を参照。
