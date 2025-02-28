{ lib, fetchFromGitHub, openttd, zstd, ... }:

openttd.overrideAttrs (oldAttrs: rec {
  pname = "openttd-jgrpp";
  version = "0.64.2";

  src = fetchFromGitHub (lib.importJSON ./jgr.json);

  buildInputs = oldAttrs.buildInputs ++ [ zstd ];
  patches = [];
})
