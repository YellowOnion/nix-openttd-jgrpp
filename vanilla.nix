{ lib, fetchFromGitHub, openttd, fetchurl, ... }:

openttd.overrideAttrs (oldAttrs: rec {
  pname = "openttd";
  version = "14.1";
  src = fetchurl {
    url = "https://cdn.openttd.org/openttd-releases/${version}/${pname}-${version}-source.tar.xz";
    sha256 = "151l05msgfknvfd2pa98n4p01nxw1ainkhc85i7qq5243zqch51c";
  };
})
