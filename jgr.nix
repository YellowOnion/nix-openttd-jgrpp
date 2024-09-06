{ lib, fetchFromGitHub, openttd, zstd, ... }:

openttd.overrideAttrs (oldAttrs: rec {
  pname = "openttd-jgrpp";
  version = "0.61.0";

  src = fetchFromGitHub (lib.importJSON ./jgr.json);

  buildInputs = oldAttrs.buildInputs ++ [ zstd ];
})
