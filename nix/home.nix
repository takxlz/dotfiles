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
    (python313.withPackages (ps: with ps; [
      pillow
    ]))
  ];

  programs.home-manager.enable = true;

  # cd 時に flake.nix/.envrc でプロジェクト別環境を切り替える
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
