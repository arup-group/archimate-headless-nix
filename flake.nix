{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs =
    { nixpkgs
    , flake-utils
    , ...
    }:

    let
      overlays = import ./overlays.nix { };
    in

    { inherit overlays; }

    //

    flake-utils.lib.eachDefaultSystem (
      system:

      let
        pkgs = import nixpkgs {
          inherit system;

          overlays = [ overlays.modifications ];
        };
      in

      {
        formatter = pkgs.nixpkgs-fmt;
        packages = pkgs;
      }
    );
}
