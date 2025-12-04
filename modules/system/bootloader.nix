{
  pkgs,
  lib,
  config,
  ...
}: {
  options.myModules.bootloader.enable = lib.mkEnableOption "Enables bootloader";

  config = lib.mkIf config.myModules.bootloader.enable {
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
      theme = pkgs.fetchFromGitHub {
        # current as of 11/2022
        owner = "shvchk";
        repo = "fallout-grub-theme";
        rev = "2c51d28701c03c389309e34585ca8ff2b68c23e9";
        sha256 = "sha256-iQU1Rv7Q0BFdsIX9c7mxDhhYaWemuaNRYs+sR1DF0Rc=";
      };
    };
  };
}
