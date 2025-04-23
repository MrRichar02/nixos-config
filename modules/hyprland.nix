{lib, config, ...}:
{
  options.myModules.hyprland.enable = lib.mkEnableOption "enables hyprland module";

  config = lib.mkIf config.myModules.hyprland.enable {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
    };
  };
}
