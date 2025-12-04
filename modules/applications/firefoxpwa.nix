{
  pkgs,
  lib,
  config,
  ...
}: {
  options.myModules.firefoxpwa.enable = lib.mkEnableOption "Enables firefoxpwa";

  config = lib.mkIf config.myModules.firefoxpwa.enable {
    programs.firefox = {
      enable = true;
      package = pkgs.firefox;
      nativeMessagingHosts.packages = [pkgs.firefoxpwa];
    };

    environment.systemPackages = [
      pkgs.firefoxpwa
    ];
  };
}
