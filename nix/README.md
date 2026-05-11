# Nix / Home Manager セットアップ

macOS 上で Nix と Home Manager を使い、ユーザー環境のパッケージと dotfiles を宣言的に管理する。

## 構成

```
nix/
├── flake.nix      -- 入口、依存関係（nixpkgs / home-manager）を宣言
├── flake.lock     -- 依存のコミットハッシュをロック（自動生成、git にコミットする）
├── home.nix       -- ユーザー環境の中身（パッケージ・設定）
├── README.md      -- このファイル
└── SETUP.md       -- セットアップ進捗ログ（完了後に削除可）
```

## 基本概念

### Nix / nixpkgs / Home Manager の関係

| 名前          | 役割                                                                   |
|---------------|------------------------------------------------------------------------|
| Nix           | パッケージマネージャ ＋ 設定言語                                       |
| nixpkgs       | Nix で書かれた巨大なパッケージカタログ（github.com/NixOS/nixpkgs）     |
| Home Manager  | nixpkgs を使ってユーザー環境（パッケージ ＋ dotfiles）を管理する仕組み |

### flake.nix と home.nix の役割分担

| ファイル    | 役割                                                                  |
|-------------|-----------------------------------------------------------------------|
| flake.nix   | どの nixpkgs / home-manager を使うかを宣言（依存とバージョン）        |
| home.nix    | カタログから何を入れるか・どう設定するかを宣言（中身）                |

「flake.nix が冷凍カタログの号数を決め、home.nix が商品を選ぶ」関係。

### flake.lock

`flake.nix` の inputs を**コミットハッシュ単位で固定**するファイル。これがあるおかげで別マシン・別日でも同じバージョンが手に入る（再現性）。

- 自動生成される
- git にコミットする（`.gitignore` に入れない）
- `nix flake update` でのみ更新される

### 世代（generation）

`home-manager switch` するたびに新しい「世代」が作られ、現在の世代がそこへ切り替わる。過去の世代も `/nix/var/nix/profiles/per-user/takxlz/` に残るので、ロールバック可能。

```
世代 1: eza のみ
世代 2: eza, zoxide               ← 1回目の switch
世代 3: eza, zoxide, delta        ← 2回目の switch
```

## よく使うコマンド

### 適用（パッケージ追加・設定変更後）

```bash
home-manager switch --flake '~/dev/github.com/takxlz/dotfiles/nix#takxlz'
```

`home.nix` の宣言通りに環境を作り直し、新しい世代に切り替える。

### 設定の事前ビルド（適用せず検証）

```bash
home-manager build --flake '~/dev/github.com/takxlz/dotfiles/nix#takxlz'
```

構文エラー・依存解決ミスの確認に使う。

### nixpkgs を新しい号に更新

```bash
# flake.lock を更新
nix flake update --flake ~/dev/github.com/takxlz/dotfiles/nix

# 適用
home-manager switch --flake '~/dev/github.com/takxlz/dotfiles/nix#takxlz'
```

`flake.lock` の差分が git diff に出るので、何が更新されたか確認できる。

### 世代の確認

```bash
home-manager generations
```

### ロールバック

`generations` で戻したい世代の activate スクリプトを直接実行する：

```bash
/nix/var/nix/profiles/per-user/takxlz/home-manager-2-link/activate
```

### 古い世代の掃除（ディスク節約）

```bash
home-manager expire-generations '-30 days'   # 30日より古い世代を削除
nix-collect-garbage -d                       # ストアの未参照ファイルを削除
```

### パッケージ名を探す

```bash
# CLI で検索
nix search nixpkgs ripgrep

# Web で検索（推奨、説明が見やすい）
# https://search.nixos.org/packages
```

## パッケージの追加・削除

### 追加

`home.nix` の `home.packages` に追記 → switch。

```nix
home.packages = with pkgs; [
  eza
  zoxide
  delta
  ripgrep    # 追記
];
```

```bash
home-manager switch --flake '~/dev/github.com/takxlz/dotfiles/nix#takxlz'
```

### 削除

`home.nix` から行を消して switch するだけ。命令的な uninstall コマンドは存在しない（`home.nix` が真実）。

## バージョン管理

### 全部固定したい（再現性重視）

`flake.lock` をそのまま git にコミットしておけば、誰がいつ checkout しても同じバージョンが入る。何もしなければ自動で更新されない。

### 全体を最新にしたい

```bash
nix flake update --flake ~/dev/github.com/takxlz/dotfiles/nix
home-manager switch --flake '~/dev/github.com/takxlz/dotfiles/nix#takxlz'
```

### 安定版ベース ＋ 一部だけ最新にしたい

`flake.nix` で stable と unstable を別 input として持つ。`README.md` 範囲外の高度な使い方なので必要になったら調べる。

### 特定パッケージのバージョンを固定したい

`overlay` で個別に上書きできるが、慣習的にあまりやらない。本当に必要なら nixhub.io（https://www.nixhub.io）で目当てのバージョンを含む nixpkgs コミットを検索して別 input として追加する。

## 既知の落とし穴

### `!` コマンドや一部の非対話 zsh で `nix` が見つからない

非対話シェルでは `/etc/zshrc` が読まれず Nix の PATH 設定が反映されないことがある。明示的に source する：

```bash
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
```

通常の対話シェル（新しいタブを開いた WezTerm 等）では問題ない。

### zsh で `nix#takxlz` が "no matches found"

zsh の `extendedglob` が `#` をグロブ文字として解釈する。flake URI はシングルクォートで囲む：

```bash
home-manager switch --flake '~/dev/github.com/takxlz/dotfiles/nix#takxlz'
```

## アンインストール

### パッケージを1つ消す

`home.nix` から行を削除して switch。

### Home Manager の管理ファイルをリセット

```bash
home-manager expire-generations '-0 days'    # 全世代を期限切れに
nix-collect-garbage -d                        # 物理削除
```

### Nix そのものをアンインストール

Determinate Systems 製インストーラを使ったので、ジャーナル記録済みの一発アンインストールが効く：

```bash
/nix/nix-installer uninstall
```

`/nix` ボリューム削除、`/etc/zshrc` 等の改変ロールバック、launchd サービス削除まで自動。

## 環境メモ

| 項目                | 値                                              |
|---------------------|-------------------------------------------------|
| OS                  | macOS aarch64                                   |
| Nix ディストリ      | Determinate Nix（DS 版、`determinate-nixd` 使用）|
| 自動アップデート    | デフォルト有効（DS 版の挙動）                   |
| Flakes              | デフォルト有効                                  |
| パッケージカタログ  | `nixpkgs-unstable` ブランチ                     |
| Home Manager       | master ブランチ                                 |
| Homebrew            | 併用継続（GUI アプリ・cask は brew で管理）     |

## 参考リンク

- nixpkgs パッケージ検索: https://search.nixos.org/packages
- nixhub.io（特定バージョン検索）: https://www.nixhub.io
- Home Manager マニュアル: https://nix-community.github.io/home-manager/
- Home Manager Options 一覧: https://nix-community.github.io/home-manager/options.xhtml
- Determinate Systems: https://determinate.systems/
- Nix 公式マニュアル: https://nix.dev/
