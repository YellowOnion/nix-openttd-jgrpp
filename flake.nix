{
  description = "bleeding edge openttd & launcher";
  inputs = {
    nixpkgs.url = "nixpkgs/d6c6be587af1dda37e82041f855368c8a507c0f6";
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
