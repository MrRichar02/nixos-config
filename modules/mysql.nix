{pkgs, lib, config, ...}:
{
  options.myModules.mysql.enable = lib.mkEnableOption "enables mysql";

  config = lib.mkIf config.myModules.mysql.enable {
    services.mysql = {
      enable = true;
      package = pkgs.mariadb;
    };
  };
}
