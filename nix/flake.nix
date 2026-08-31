{
  description = "takxlz nix-darwin / home-manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nix-darwin, home-manager, rust-overlay, ... }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ rust-overlay.overlays.default ];
      };
    in {
      # 適用は darwin-rebuild switch --flake '<このディレクトリ>#takxlz'
      # macOS のシステム設定は darwin.nix、ユーザー環境は home.nix が持つ
      darwinConfigurations.takxlz = nix-darwin.lib.darwinSystem {
        modules = [
          { nixpkgs.pkgs = pkgs; }
          ./darwin.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            # useUserPackages = true にすると ~/.nix-profile ではなく
            # /etc/profiles/per-user/<user> へ配置しようとする。users.users を
            # 完全に宣言していないとその配置先が作られず、パッケージが消える。
            home-manager.useUserPackages = false;
            home-manager.users.takxlz = import ./home.nix;
          }
        ];
      };
    };
}
