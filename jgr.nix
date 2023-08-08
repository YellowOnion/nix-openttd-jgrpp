{ lib, fetchFromGitHub, openttd, zstd, ... }:

openttd.overrideAttrs (oldAttrs: rec {
  pname = "openttd-jgrpp";
  version = "0.54.5";

  src = fetchFromGitHub (lib.importJSON ./jgr.json);

  buildInputs = oldAttrs.buildInputs ++ [ zstd ];
})
