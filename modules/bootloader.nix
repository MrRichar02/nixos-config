{lib, config, ...}:
{
  options.myModules.bootloader.enable = lib.mkEnableOption "enables . module";

  config = lib.mkIf config.myModules.bootloader.enable {
    # Bootloader.
    # boot.loader.systemd-boot.enable = true;
    # boot.loader.efi.canTouchEfiVariables = true;

    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
    };
  };
}
