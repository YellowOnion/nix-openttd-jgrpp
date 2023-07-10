{ lib, fetchFromGitHub, openttd, zstd, ... }:

openttd.overrideAttrs (oldAttrs: rec {
  pname = "openttd-jgrpp";
  version = "0.54.2";

  src = fetchFromGitHub rec {
    owner = "JGRennison";
    repo = "OpenTTD-patches";
    rev = "jgrpp-${version}";
    hash =  "sha256-L6/n3DlywD7i7a2PcG9OVOH9+yAuplPUHrbCv+AyAcI=";
  };

  buildInputs = oldAttrs.buildInputs ++ [ zstd ];
})
