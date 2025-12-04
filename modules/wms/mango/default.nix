{
  lib,
  config,
  pkgs,
  ...
}: {
  options.myModules.mango.enable = lib.mkEnableOption "enables mangowc";

  config = lib.mkIf config.myModules.mango.enable {
    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
      ];
      config.common.default = "*";
    };
  };
}
