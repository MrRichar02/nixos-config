{
  lib,
  config,
  ...
}: {
  options.myModules.networking.enable = lib.mkEnableOption "enables networking module";

  config = lib.mkIf config.myModules.networking.enable {
    networking.hostName = "nixos"; # Define your hostname.
    #  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
    # Enable networking
    networking.networkmanager.enable = true;

    # Disable NetworkManager's internal DNS resolution
    networking.networkmanager.dns = "none";

    # These options are unnecessary when managing DNS ourselves
    networking.useDHCP = false;
    networking.dhcpcd.enable = false;

    networking.nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "8.8.8.8"
      "8.8.4.4"
    ];

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;
    #networking.firewall.trustedInterfaces = [ "enp1s0" "virbr0" "vnet0" ];
  };
}
