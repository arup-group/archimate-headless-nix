# script to run archimate in headless environments
# see: https://github.com/archimatetool/archi/wiki/Archi-Command-Line-Interface#running-on-linux-without-graphics-headless

{ pkgs }:

with pkgs;

writeShellApplication {
  name = pkgs.archi.pname;
  runtimeInputs = with pkgs; [ xvfb-run archi ];

  text = ''
    Xvfb :99 &
    export DISPLAY=:99
    Archi "$@"
    pkill -f 'Xvfb :99'
  '';
}
