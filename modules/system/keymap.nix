{lib, config, ...}:
{
  options.myModules.keymap.enable = lib.mkEnableOption "enables keymap module";

  config = lib.mkIf config.myModules.keymap.enable {
    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "latam";
      variant = "";
    };

    # Configure console keymap
    console.keyMap = "la-latin1";
  };
}
