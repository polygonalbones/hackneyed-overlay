{
  description = "My personal flake to use hackneyed with dark theming.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            (final: prev: {
              hackneyed = prev.hackneyed.overrideAttrs (oldAttrs: rec {
                makeFlags = oldAttrs.makeFlags ++ [
                  "DARK_THEME=1"
                ];
              });
            })
          ];
        };
      in {
        packages.${system}.hackneyed = pkgs.hackneyed;
      }
    );
}
