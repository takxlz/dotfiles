# dotfiles

各種設定ファイルを格納するリポジトリ。

## ディレクトリ構成

```
dotfiles/
├── nix/        -- Nix / Home Manager 設定（詳細は nix/README.md）
├── nvim/       -- Neovim 設定（詳細は nvim/CLAUDE.md）
├── ghostty/    -- Ghostty 設定
├── herdr/      -- herdr（ターミナルマルチプレクサ）設定
├── wezterm/    -- WezTerm 設定（撤去済み、参照用に保管）
├── tmux/       -- tmux 設定・レイアウトスクリプト（撤去済み、参照用に保管）
├── zsh/        -- starship 設定とシークレット雛形（zsh 本体は home.nix で宣言）
├── jetbrains/  -- JetBrains IDE 設定
└── packages/   -- パッケージ一覧（Brewfile, npm, pip）
```

## 方針

- ディレクトリ名はツール名ベースで統一
- クロスプラットフォーム（macOS/Windows）で使えるキーバインドを優先

## 撤去済みツール（wezterm / tmux）

- Ghostty + herdr へ移行したため、パッケージと symlink は削除済み
- `wezterm/` `tmux/` の設定ファイルは参照用に残しているが、どこからも読まれていない
- 現役の設定として扱わないこと。復活させる場合は git 履歴から手順を辿る

## Ghostty

- 設定は `ghostty/config` の1ファイル（`key = value` 形式）
- パッケージは Home Manager 管理（`nix/home.nix` の `ghostty-bin`）
- `~/.config/ghostty` は `ghostty/` への symlink なので、編集に `home-manager switch` は不要
- 配色・キーバインド等は Ghostty のデフォルトのまま
- WezTerm の設定は引き継がない（別ターミナルとして素の状態から育てる）
- 設定変更後の反映は Ghostty 上で `Cmd+Shift+,`、検証は `ghostty +validate-config`
- 値を空にすると（`font-family =`）そのキーはデフォルトに戻る

## herdr

- 設定は `herdr/config.toml` の1ファイル
- パッケージは Home Manager 管理（`nix/home.nix` の `herdr`、nixpkgs-fresh 経由）
- `~/.config/herdr` はソケット・ログ・セッション状態も置かれるため、
  symlink は `config.toml` のファイル単位で張る（ディレクトリごとにしない）
- prefix は `Ctrl+Space`（tmux / WezTerm から引き継ぎ）
- 既定値の雛形は `herdr --default-config`、検証は `herdr config check`
- 設定変更後の反映は `prefix+Shift+R` または `herdr server reload-config`

## コミットルール

- コミットメッセージに Claude によるコミットである旨（Co-Authored-By 等）を含めない

## 環境

- ターミナル: Ghostty（Home Manager 管理）
- マルチプレクサ: herdr（Home Manager 管理）
- フォント: HackGen Console NF
- シェル: zsh
