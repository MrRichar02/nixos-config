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
      # theme = "${pkgs.catppuccin-grub}";
			theme = pkgs.fetchFromGitHub { # current as of 11/2022
				owner = "shvchk";
				repo = "fallout-grub-theme";
				rev = "2c51d28701c03c389309e34585ca8ff2b68c23e9";
				sha256 = "sha256-iQU1Rv7Q0BFdsIX9c7mxDhhYaWemuaNRYs+sR1DF0Rc=";
			};
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
