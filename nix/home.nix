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
  ];

  programs.home-manager.enable = true;
}
