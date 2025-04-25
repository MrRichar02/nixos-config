{lib, config, ...}:
{
  options.myModules.wireshark.enable = lib.mkEnableOption "enables wireshark module";

  config = lib.mkIf config.myModules.wireshark.enable {
    programs.wireshark = {
      enable = true;
    };
  };
}
