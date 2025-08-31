{
  description = "My personal flake to use hackneyed with dark theming.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }: {
    overlays.default = final: prev: {
      hackneyed = prev.hackneyed.overrideAttrs (o: {
        makeFlags = o.makeFlags ++ [
          "DARK_THEME=1"
        ];
      });
    };
  };
}
