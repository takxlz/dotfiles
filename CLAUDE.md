# dotfiles

各種設定ファイルを格納するリポジトリ。

## ディレクトリ構成

```
dotfiles/
├── nvim/       -- Neovim 設定（詳細は nvim/CLAUDE.md）
├── wezterm/    -- WezTerm 設定
├── tmux/       -- tmux レイアウトスクリプト
├── jetbrains/  -- JetBrains IDE 設定
└── packages/   -- パッケージ一覧（Brewfile, npm, pip）
```

## 方針

- ディレクトリ名はツール名ベースで統一
- クロスプラットフォーム（macOS/Windows）で使えるキーバインドを優先

## WezTerm

- キーマップ対応表は `wezterm/keymaps.lua` 先頭のコメントを参照
- leader キーは `Ctrl+Space`（tmux の prefix と同じ）
- 連続操作が必要なもの（ペインリサイズ等）は Alt 系のキーも併用

## コミットルール

- コミットメッセージに Claude によるコミットである旨（Co-Authored-By 等）を含めない

## 環境

- ターミナル: WezTerm
- フォント: HackGen Console NF
- シェル: zsh
