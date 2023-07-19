{ lib, fetchFromGitHub, openttd, zstd, ... }:

openttd.overrideAttrs (oldAttrs: rec {
  pname = "openttd-jgrpp";
  version = "0.54.4";

  src = fetchFromGitHub (lib.importJSON ./version.json);

  buildInputs = oldAttrs.buildInputs ++ [ zstd ];
})
