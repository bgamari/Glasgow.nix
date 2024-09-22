{
  description = "Glasgow swiss-army knife";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "github:nixos/nixpkgs";
  inputs.glasgow = { url = "github:GlasgowEmbedded/Glasgow"; flake = false; };
  inputs.libfx2 = { url = "github:whitequark/libfx2/v0.13"; flake = false; };
  inputs.migen = { url = "github:m-labs/migen"; flake = false; };

  outputs = inputs@{ self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      {
        packages = rec {
          fx2 = pkgs.python3Packages.callPackage ./fx2.nix { src = inputs.libfx2; };
          glasgow = pkgs.python3Packages.callPackage ./glasgow.nix { inherit fx2; src = inputs.glasgow; };
          default = glasgow;
        };
        apps = rec {
          glasgow = flake-utils.lib.mkApp { drv = self.packages.${system}.glasgow; };
          default = glasgow;
        };
      }
    );
}
