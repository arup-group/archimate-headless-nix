# Archimate Headless Nix

A wrapper around [Archimate](https://www.archimatetool.com/) to run in headless environments.

## Usage

```sh
nix run github:arup-group/archimate-headless-nix#archi
```

### Flakes

```nix
{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.archimate-headless-nix.url = "github:arup-group/archimate-headless-nix";

  # optionaly: set archimate-headless-nix to follow nixpkgs
  inputs.archimate-headless-nix.inputs.nixpkgs.follows = "nixpkgs";

  outputs = { self, nixpkgs, archimate-headless-nix }:

  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;

      # add archimate-headless-nix to overlays
      overlays = [ archimate-headless-nix.overlays.modifications ];
    };
  in

  {
    packages.x86_64-linux.archi = pkgs.archi;
  };
}
```
