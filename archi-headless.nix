# script to run archimate in headless environments
# see: https://github.com/archimatetool/archi/wiki/Archi-Command-Line-Interface#running-on-linux-without-graphics-headless

{ pkgs }:

if pkgs.stdenv.isDarwin then
  pkgs.archi
else

  pkgs.writeShellApplication {
    name = "${pkgs.archi.name}-headless";
    runtimeInputs = with pkgs; [ xvfb-run archi ];

    text = ''
      Xvfb :99 &
      export DISPLAY=:99
      xvfb-run Archi -application com.archimatetool.commandline.app -consoleLog -nosplash "$@"
      pkill -f 'Xvfb :99'
    '';

    meta = {
      description = "xvfb wrapper around Archi";
      longDescription = ''
        This is a wrapper script that runs Archi in a headless environment using Xvfb.
        It allows you to use Archi's command line interface on systems without a graphical display.
      '';
      mainProgram = pkgs.archi.name;
      license = pkgs.archi.meta.license;
      maintainers = [{ name = "Dominic Egginton"; email = "dom.egginton@arup.com"; }];
    };
  }
