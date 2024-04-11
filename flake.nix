{
  description = "bleeding edge openttd & launcher";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        openttd = import ./default.nix {inherit pkgs;};
      in
      {
        packages = {
          vanilla = openttd.vanilla;
          jgr = openttd.jgr;
          launcher = openttd.launcher;
          default = openttd.launcher;
        };
      });
}
