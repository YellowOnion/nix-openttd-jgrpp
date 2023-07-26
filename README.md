# Basic openttd launcher.
<img src="launcher.png?raw=true" />

## Run without installing

``` shellsession
 nix run "github:YellowOnion/nix-openttd-jgrpp" \
     --extra-substituters "https://yo-nur.cachix.org" \
     --extra-trusted-public-keys  "yo-nur.cachix.org-1:E/RHfQMAZ90mPhvsaqo/GrQ3M1xzXf5Ztt0o+1X3+Bs="
```

## To install:

### Prebuilt binaries are avaliable on cachix:

[https://app.cachix.org/cache/yo-nur#pull](https://app.cachix.org/cache/yo-nur#pull)

### home manager / flakes:

``` nix
# flake.nix
{
  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    openttd.url = {
      url = "github:YellowOnion/nix-openttd-jgrpp";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = {nixpkgs, home-manager, openttd, ... }:
   let 
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; }; 
      mkHomeConf = file: home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {openttd = import openttd {pkgs = pkgs;};};
      };
      in { 
          homeConfigurations."user@host" = mkHomeConf ./home.nix;
      };
}

# 

# home.nix 
{ config, pkgs, openttd, ... }:
{
  home.packages = with pkgs; [
    openttd.launcher
  ]
}
```

## To run:

<img src="steamsetup2.png?raw=true" />
