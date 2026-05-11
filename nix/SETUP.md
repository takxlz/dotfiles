# Nix セットアップ進捗

セットアップ中の作業ログ。完了後は削除してよい。永続的なリファレンスは `README.md` を参照。

## 現在のフェーズ

**Phase 1: Nix と Home Manager の動作確認** ✅ 完了

次にやること: **`nix/` 配下の Git コミット → Phase 2 着手判断**

## 確定事項

- プロファイル名: `takxlz`
- Phase 1 で導入するパッケージ: `eza`, `zoxide`, `delta`（Brewfile に未収録の modern CLI）
- nixpkgs lock: `github:nixos/nixpkgs/73c703c`（2026-05-03）
- home-manager lock: `github:nix-community/home-manager/9c6f130`（2026-05-04）

## 完了済み

- [x] インストーラ方針決定（Determinate Systems installer）
- [x] Nix インストール（`/nix/nix-installer uninstall` でアンインストール可）
- [x] `nix --version` / `nix flake --help` の動作確認
- [x] Flakes 有効化の確認（DS 版はデフォルト有効）
- [x] Home Manager のプロファイル名確定: `takxlz`
- [x] Phase 1 導入パッケージ確定: `eza`, `zoxide`, `delta`
- [x] `nix/flake.nix` 作成（nixpkgs-unstable + home-manager master を input）
- [x] `nix/home.nix` 作成（最小構成、`programs.home-manager.enable = true`）
- [x] `nix/README.md` 作成（永続リファレンス）
- [x] **`home-manager switch` 初回実行成功**（2026-05-04）
- [x] **`flake.lock` 生成確認**（nixpkgs `73c703c` / home-manager `9c6f130` を pin）
- [x] **`eza` / `zoxide` / `delta` が `~/.nix-profile/bin/` に展開、PATH 解決を確認**

## Phase 1 残タスク

- [ ] `nix/flake.lock` を Git にコミット（再現性の核なので必須）
- [ ] `home-manager news` で 249 件の breaking changes を一読

## 次に実行するコマンド

`flake.lock` を含めた `nix/` 配下を Git にコミット:

```bash
git add nix/flake.nix nix/home.nix nix/flake.lock nix/README.md nix/SETUP.md
git commit -m "feat: Nix + Home Manager によるパッケージ管理を導入"
```

以降の運用コマンド（リファレンス）:

```bash
# 設定変更後の適用
nix run home-manager/master -- switch \
  --flake '/Users/takxlz/dev/github.com/takxlz/dotfiles/nix#takxlz' -b backup

# nixpkgs を最新カタログに更新
nix flake update --flake /Users/takxlz/dev/github.com/takxlz/dotfiles/nix

# 世代の確認
home-manager generations

# Home Manager のお知らせ確認
home-manager news
```

## ハマった点（解決済み）

1. **`!` 経由で `nix` コマンドが見つからない**
   - 原因: 非対話 zsh で `/etc/zshrc` が読まれない
   - 対処: `. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh` を頭に付ける

2. **zsh が `nix#takxlz` を "no matches found" で拒否**
   - 原因: `extendedglob` が `#` をグロブ文字と解釈
   - 対処: flake URI をシングルクォートで囲む

両方とも `README.md` の「既知の落とし穴」セクションに記載済み。

## Phase 2（将来）: Brewfile の段階的移行

- [ ] `packages/Brewfile` の CLI ツールを `home.nix` に書き換え
- [ ] GUI アプリ（cask: `docker-desktop`, `wezterm@nightly` 等）は Homebrew のまま継続
- [ ] VSCode 拡張・フォントの扱いを検討

## Phase 3（将来）: dotfiles 設定の統合

- [ ] `programs.zsh`, `programs.git`, `programs.neovim` で設定生成を Nix に寄せる
- [ ] nix-darwin 導入の検討（macOS システム設定の宣言化）

## 環境メモ

- OS: macOS (Darwin, aarch64)
- Nix: Determinate Nix (DS 版、`determinate-nixd` デーモン)
- 自動アップデート: デフォルト有効（DS 版の挙動）
- Flakes: デフォルト有効
- nixpkgs: `nixpkgs-unstable` ブランチ
- Home Manager: master ブランチ
- Homebrew: 併用継続

## 学んだこと（README.md に詳細）

- `flake.nix` = カタログ（nixpkgs）の号数指定 + ビルド枠組み
- `home.nix` = カタログから何をインストールするかの宣言
- `flake.lock` = カタログのコミットハッシュを固定（再現性の核）
- `home-manager switch` = 「あるべき姿」に環境を一致させる宣言的適用（kubectl apply 的）
- 世代（generation）が積まれてロールバック可能
- バージョン管理は「個別パッケージ単位」ではなく「カタログ単位」
- NixOS は Linux ディストロ、今回の Nix（パッケージマネージャ）とは別物
