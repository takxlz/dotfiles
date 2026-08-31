# dotfiles

各種設定ファイルを格納するリポジトリ。

## ディレクトリ構成

```
dotfiles/
├── nix/        -- Nix / Home Manager 設定（詳細は nix/README.md）
├── nvim/       -- Neovim 設定（詳細は nvim/CLAUDE.md）
├── ghostty/    -- Ghostty 設定
├── git/        -- gitconfig（グローバル設定）
├── herdr/      -- herdr（ターミナルマルチプレクサ）設定
├── wezterm/    -- WezTerm 設定（撤去済み、参照用に保管）
├── tmux/       -- tmux 設定・レイアウトスクリプト（撤去済み、参照用に保管）
├── zsh/        -- starship 設定とシークレット雛形（zsh 本体は home.nix で宣言）
├── jetbrains/  -- JetBrains IDE 設定（撤去済み、参照用に保管）
└── packages/   -- パッケージ一覧（Brewfile, npm, pip）
```

## 方針

- ディレクトリ名はツール名ベースで統一
- クロスプラットフォーム（macOS/Windows）で使えるキーバインドを優先

## 設定ファイルの symlink

- symlink は全て `nix/home.nix` の `mkOutOfStoreSymlink` で宣言する
- 手動 `ln -s` はしない（再現手順が残らず、マシン移行時に失われる）
- リンク先は dotfiles の実体なので、設定編集に `home-manager switch` は不要
  （`switch` が要るのは symlink の宣言そのものを足し引きしたときだけ）
- `programs.git` のような Home Manager モジュールは使わない。生成物が Nix ストアの
  読み取り専用ファイルになり、`git config --global` 等での変更ができなくなるため
- 対象: `nvim/`、`ghostty/`、`herdr/config.toml`、`zsh/starship.toml`、`git/gitconfig`

## 撤去済みツール（wezterm / tmux / jetbrains）

- wezterm / tmux: Ghostty + herdr へ移行したため、パッケージと symlink は削除済み
- jetbrains: `~/.ideavimrc` が旧 dotfiles パス（`~/dotfiles`）を指したまま壊れていたため
  symlink を削除。IDE を使う場合は `home.nix` に宣言して張り直す
- いずれも設定ファイルは参照用に残しているが、どこからも読まれていない
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
- パッケージは Home Manager 管理（`nix/home.nix` の `herdr`）
- `~/.config/herdr` はソケット・ログ・セッション状態も置かれるため、
  symlink は `config.toml` のファイル単位で張る（ディレクトリごとにしない）
- prefix は `Ctrl+Space`（tmux / WezTerm から引き継ぎ）
- 既定値の雛形は `herdr --default-config`、検証は `herdr config check`
- 設定変更後の反映は `prefix+Shift+R` または `herdr server reload-config`

## パッケージ管理の役割分担

- CLI ツールは原則 `nix/home.nix` で宣言する
- Homebrew に残すのは以下だけ
  - cask（GUI アプリ）
  - nixpkgs に無いもの（`hid_bootloader_cli`, `mdloader` 等）
  - brew 側に置く理由があるもの（`docker` は Docker Desktop 付属、`mysql` はデータ互換性、`qmk` は下記参照）
- `automake` / `cmake` / `pkgconf` は他 formula のビルド依存。brew が自動管理するので触らない
- `cargo install` / `go install` は使わない。nixpkgs にあれば `home.packages` で宣言する
  （宣言に残らず、マシン移行時に失われるため）
- nvim の LSP・フォーマッタは mason.nvim が管理する。`ensure_installed` に一覧があり
  nvim 設定として git 管理されているので、nix には寄せない
- VSCode 拡張機能は Brewfile で管理しない（VSCode 側の設定同期に任せる）。
  `brew bundle dump` は `code --list-extensions` を自動で書き出すため、
  再生成したら `vscode "..."` 行を削除すること
- PATH は nix が brew より優先（`home.nix` の `initContent` で明示的に前置している）
- 追加先に迷ったら `nix search nixpkgs <名前>` で在庫を確認する

## QMK（自作キーボード）

### brew で管理する理由

- `qmk/qmk/qmk` formula が `avr-gcc@8` `arm-none-eabi-gcc@8` と各種書き込みツールを
  依存として引き込む。nix に移すとこの依存束を自前で `home.nix` に書き下すことになる
- QMK 公式が `@8` を指定している。nixpkgs に残る AVR 向け gcc は 13 以降のみで、
  8〜12 は削除済み。公式想定と同じ構成を保てるのは brew 側
- tap は `qmk/qmk` `osx-cross/avr` `osx-cross/arm` の3つ。新しい Homebrew では
  `brew trust <tap>` が必要（登録済み。取り消しは `brew untrust`）

### ビルドが "No rule to make target" で失敗する場合

QMK CLI の依存不足が原因。make の問題ではない。CLI は自身の python 環境に
ファームウェアリポジトリの `requirements.txt` を入れて動く設計で、
`brew upgrade qmk` や再インストールでこの状態が失われる。

```bash
cd <ファームウェアリポジトリ>
/opt/homebrew/Cellar/qmk/<version>/libexec/bin/python -m pip install -r requirements.txt
```

まず `qmk hello` を実行すると、不足モジュール名と実行すべきコマンドが表示される。
2026-08 時点で不足するのは `appdirs`（新しい QMK は platformdirs へ移行済みだが、
手元のファームウェアリポジトリは QMK 0.22.3 で appdirs を要求する）。

この pip 依存は宣言的に管理できていない既知の弱点。`brew upgrade qmk` の後は再実行が要る。

### ファームウェアのサイズ制約

atmega32u4 のフラッシュは 28672 バイト。コンパイラのバージョンで生成サイズが大きく変わる。

| コンパイラ         | LTO  | サイズ  | 判定       |
|--------------------|------|---------|------------|
| brew avr-gcc 8.5.0 | なし | 25808   | 収まる     |
| nix avr-gcc 13.4.0 | なし | 31046   | 超過       |
| nix avr-gcc 15.3.0 | なし | 31172   | 超過       |
| nix avr-gcc 15.3.0 | あり | 23012   | 収まる     |

`LTO_ENABLE = yes` を使えば新しい gcc でも収まる（`keyball44` は設定済み、`claw44` は未設定）。
ただし LTO はコード生成を変えるため、導入するなら実機での動作確認が必須。

### 保有キーボード

- dailycraft Claw44（`qmk_firmware_claw44`）: atmega32u4 / caterina
- Keyball44（`qmk_firmware_keyball`）: atmega32u4 / caterina。keymap のみのリポジトリで、
  ビルドには別途 qmk_firmware 本体が要る

どちらも AVR 系。ARM ツールチェインは qmk formula の依存として入っているだけで使っていない。

## コミットルール

- コミットメッセージに Claude によるコミットである旨（Co-Authored-By 等）を含めない

## 環境

- ターミナル: Ghostty（Home Manager 管理）
- マルチプレクサ: herdr（Home Manager 管理）
- フォント: HackGen Console NF
- シェル: zsh
