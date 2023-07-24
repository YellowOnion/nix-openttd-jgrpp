{ lib, fetchFromGitHub, openttd, zstd, ... }:

openttd.overrideAttrs (oldAttrs: rec {
  pname = "openttd";
  version = "13.3";

  src = fetchFromGitHub (lib.importJSON ./vanilla.json);
})
