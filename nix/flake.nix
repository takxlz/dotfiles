{
  description = "takxlz home-manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    # 既存 pin より新しい nixpkgs が必要なパッケージ用（現状 herdr のみ）。
    # 全体を巻き込まずに済むよう、nixpkgs 本体とは別入力に分けている。
    nixpkgs-fresh.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-fresh, home-manager, rust-overlay, ... }:
    let
      system = "aarch64-darwin";
      pkgsFresh = import nixpkgs-fresh { inherit system; };
      # nixpkgs-fresh から取るパッケージをここに列挙する
      freshOverlay = _final: _prev: {
        inherit (pkgsFresh) herdr;
      };
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ rust-overlay.overlays.default freshOverlay ];
      };
    in {
      homeConfigurations.takxlz = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
      };
    };
}
