{ lib, fetchFromGitHub, openttd, fetchurl, ... }:

openttd.overrideAttrs (oldAttrs: rec {
  pname = "openttd";
  version = "14.0";
  src = fetchurl {
    url = "https://cdn.openttd.org/openttd-releases/${version}/${pname}-${version}-source.tar.xz";
    sha256 = "1c8qhk44ba6x91xrrw8byywm1wzbws90dpla0cq5wsl1b2w6mxwn";
  };
})
