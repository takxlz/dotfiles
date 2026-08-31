{ config, pkgs, ... }:
let
  # stable Rust + クロスコンパイル target + IDE 用 component
  # nightly や古い stable はプロジェクトの flake.nix の devShell 側で対応する
  rust-stable = pkgs.rust-bin.stable.latest.default.override {
    extensions = [ "rust-src" "rust-analyzer" ];
    targets = [
      "aarch64-apple-darwin"
      "x86_64-pc-windows-gnu"
      "x86_64-pc-windows-msvc"
      "x86_64-unknown-linux-gnu"
    ];
  };
in
{
  home.username = "takxlz";
  home.homeDirectory = "/Users/takxlz";

  # 初回設定時の Home Manager リリース番号で固定する。後から変更しない。
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    eza
    zoxide
    delta
    neovim
    bat
    fd
    ripgrep
    gh
    ghq
    tree
    # コーディングエージェント（Claude Code 等）を常駐させるマルチプレクサ
    herdr
    uv
    jdk17
    (python313.withPackages (ps: with ps; [
      pillow
    ]))
    nodejs_24
    rust-stable
    deno

    # Rust 関連の補助ツール（従来 cargo install で入れていたもの）
    cargo-expand
    rustlings

    # 図の生成（dot コマンド）
    graphviz
    # 入力ソース切り替え。nvim の im-select.nvim が呼ぶ
    macism

    # ターミナル。macOS では pkgs.ghostty がビルド対象外のため公式バイナリ版を使う。
    # .app は targets.darwin.linkApps により ~/Applications/Home Manager Apps/ に張られる。
    ghostty-bin
  ];

  # ~/.config/starship.toml を dotfiles/zsh/starship.toml への symlink にする
  home.file.".config/starship.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dev/github.com/takxlz/dotfiles/zsh/starship.toml";

  # ~/.config/nvim を dotfiles/nvim への symlink にする
  home.file.".config/nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dev/github.com/takxlz/dotfiles/nvim";

  # ~/.config/ghostty を dotfiles/ghostty への symlink にする（nvim と同じ流儀）
  home.file.".config/ghostty".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dev/github.com/takxlz/dotfiles/ghostty";

  # ~/.config/herdr/config.toml を dotfiles/herdr への symlink にする。
  # ~/.config/herdr にはソケット・ログ・セッション状態も置かれるため、ディレクトリごとではなくファイル単位で張る。
  home.file.".config/herdr/config.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dev/github.com/takxlz/dotfiles/herdr/config.toml";

  home.sessionVariables = {
    LANG = "ja_JP.UTF-8";
    EDITOR = "nvim";
    VPS_SSH_PORT = "2222";
  };

  # PATH 追加（順序：先頭が優先）
  # JDK は jdk17 を home.packages で入れているので brew の openjdk は参照しない
  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    "/Users/takxlz/Library/Application Support/JetBrains/Toolbox/scripts"
  ];

  programs.home-manager.enable = true;

  # cd 時に flake.nix/.envrc でプロジェクト別環境を切り替える
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;

    history = {
      size = 1000;
      save = 100000;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      expireDuplicatesFirst = true;
      share = true;
      extended = true;
    };

    shellAliases = {
      vim = "nvim";
      python = "python3";
      tree = "tree --dirsfirst";
      slpnow = "pmset sleepnow";

      # ls 系（eza ベース、prezto utility モジュールの代替）
      ls = "eza --group-directories-first";
      ll = "eza -lh --git --group-directories-first";
      la = "eza -lah --git --group-directories-first";
      lt = "eza --tree";
      l  = "eza -1A";

      # directory stack（prezto directory モジュールの代替）
      d = "dirs -v";
    };

    initContent = ''
      # Homebrew の環境変数セットアップ（HOMEBREW_PREFIX, PATH 等）
      eval "$(/opt/homebrew/bin/brew shellenv)"

      # brew shellenv は PATH の先頭に /opt/homebrew/bin を挿すため、
      # そのままだと Nix で宣言したパッケージが brew 版に負ける。Nix を優先に戻す。
      export PATH="$HOME/.nix-profile/bin:$PATH"

      # ローカル/プライベートな環境変数（シークレット）
      [ -f ~/.zsh.local ] && source ~/.zsh.local

      # ディレクトリ移動関連（prezto directory モジュールの代替）
      setopt AUTO_CD            # ディレクトリ名だけで cd
      setopt AUTO_PUSHD         # cd 時に自動 pushd
      setopt PUSHD_IGNORE_DUPS  # pushd 重複排除

      # 全履歴を表示
      function history-all { history -E 1 }
    '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = ''rg --files --hidden --follow --glob "!.git/*"'';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
}
