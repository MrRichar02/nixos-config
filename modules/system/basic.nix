{
  lib,
  config,
  pkgs,
  ...
}: {
  options.myModules.basic.enable = lib.mkEnableOption "enables basic config for nixos";

  config = lib.mkIf config.myModules.basic.enable {
    # Bootloader.
    # boot.loader.systemd-boot.enable = true;
    # boot.loader.efi.canTouchEfiVariables = true;

    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      theme = "${pkgs.catppuccin-grub}";
    };

    # Set your time zone.
    time.timeZone = "America/Bogota";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "es_CO.UTF-8";
      LC_IDENTIFICATION = "es_CO.UTF-8";
      LC_MEASUREMENT = "es_CO.UTF-8";
      LC_MONETARY = "es_CO.UTF-8";
      LC_NAME = "es_CO.UTF-8";
      LC_NUMERIC = "es_CO.UTF-8";
      LC_PAPER = "es_CO.UTF-8";
      LC_TELEPHONE = "es_CO.UTF-8";
      LC_TIME = "es_CO.UTF-8";
    };

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "latam";
      variant = "";
    };

    # Configure console keymap
    console.keyMap = "la-latin1";
  };
}
