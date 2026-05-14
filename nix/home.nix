{ pkgs, ... }:
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
    fzf
    ripgrep
    gh
    ghq
    tree
    tmux
    uv
    go
    jdk17
  ];

  programs.home-manager.enable = true;
}
