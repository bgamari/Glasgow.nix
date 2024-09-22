let
  nixpkgs =
  let
      tarball = fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/f6d6daa82beb5058644ca74db7d075d2e9d48b04.tar.gz";
        sha256 = "0ydhg0cwgb8ipky8722g3z14ibp3rr6dyamamdz1ff267csvn33z";
      };
  in import tarball {};
in with nixpkgs;
let
  migen = python3Packages.callPackage ./migen.nix { inherit sphinx-rtd-theme; };
  sphinx-rtd-theme = python3Packages.callPackage ./sphinx-rtd-theme.nix {};
  fx2 = python3Packages.callPackage ./fx2.nix {};
  glasgow = python3Packages.callPackage ./glasgow.nix { inherit migen fx2; };
in glasgow
