_:

{
  modifications = final: prev: {
    archi-headless = prev.callPackage ./archi-headless.nix { };
  };
}
