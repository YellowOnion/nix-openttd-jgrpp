{ lib, fetchFromGitHub, openttd, fetchurl, ... }:

openttd.overrideAttrs (oldAttrs: rec {
  pname = "openttd";
  version = "13.3";
  src = fetchurl {
    url = "https://cdn.openttd.org/openttd-releases/${version}/${pname}-${version}-source.tar.xz";
    sha256 = "14kiksw9qb37ryg6xkq4gahpvvd5yxwqz21sqws525k7zg91dyma";
  };
})
