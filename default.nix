{ pkgs ? import <nixpkgs> {}, ... }:
{
  jgr = pkgs.callPackage ./jgr.nix {};
  vanilla = pkgs.callPackage ./vanilla.nix {};
}
