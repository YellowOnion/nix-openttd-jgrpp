{ lib, fetchFromGitHub, openttd, fetchurl, ... }:

openttd.overrideAttrs (oldAttrs: rec {
  pname = "openttd";
  version = "13.4";
  src = fetchurl {
    url = "https://cdn.openttd.org/openttd-releases/${version}/${pname}-${version}-source.tar.xz";
    sha256 = "0vql1l25ym36vm4g76xl38kijf2gzb1m1x3ri0cf4n7y3fhfn79a";
  };
})
