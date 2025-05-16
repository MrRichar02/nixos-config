{lib, config, ...}:
{
  options.myModules.podman.enable = lib.mkEnableOption "enables podman";

  config = lib.mkIf config.myModules.podman.enable {
    # Enable common container config files in /etc/containers
    virtualisation.containers.enable = true;
    virtualisation = {
      podman = {
        enable = true;
        # Required for containers under podman-compose to be able to talk to each other.
        defaultNetwork.settings.dns_enabled = true;
      };
    };
  };
}
