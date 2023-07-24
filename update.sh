#!/usr/bin/env nix-shell
#!nix-shell -i bash -p jq
#

JGR_DEV=JGRennison
JGR_REPO=OpenTTD-patches
VANILLA_DEV=OpenTTD
VANILLA_REPO=OpenTTD

get_tag () {
 curl \
  -H "Accept: application/vnd.github+json" \
  https://api.github.com/repos/$1/releases/latest | jq -r '.tag_name'
}

VANILLA_VERSION=$(get_tag $VANILLA_DEV/$VANILLA_REPO)
JGR_VERSION=$(get_tag $JGR_DEV/$JGR_REPO)

echo $VANILLA_VERSION
echo $JGR_VERSION

sed -i -E 's/version = "[0-9.]+"/version = "'"${JGR_VERSION#jgrpp-}"'"/' jgr.nix
sed -i -E 's/version = "[0-9.]+"/version = "'"${VANILLA_VERSION}"'"/' vanilla.nix

nix-prefetch-github-latest-release $JGR_DEV $JGR_REPO > jgr.json
nix-prefetch-github-latest-release $VANILLA_DEV $VANILLA_REPO > vanilla.json
