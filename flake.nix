{
  description = "bleeding edge openttd & launcher";
  inputs = {
    nixpkgs.url = "nixpkgs/9807714d6944a957c2e036f84b0ff8caf9930bc0";
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
