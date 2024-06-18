_:

{
  modifications = final: prev: {
    archi = import ./archi.nix { pkgs = prev; };
  };
}
