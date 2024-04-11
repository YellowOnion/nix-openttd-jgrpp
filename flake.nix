{
  description = "bleeding edge openttd & launcher";
  inputs = {
    nixpkgs.url = "nixpkgs";
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
