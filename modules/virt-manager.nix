{lib, config, ...}:
{
  options.myModules.virt-manager.enable = lib.mkEnableOption "enables virt-manager module";

  config = lib.mkIf config.myModules.virt-manager.enable {
    #virt-manager config

    programs.virt-manager.enable = true;

    virtualisation.libvirtd.enable = true;

    virtualisation.spiceUSBRedirection.enable = true;

    networking.interfaces.virbr0.ipv4.addresses = [
      {
        address = "10.0.0.1";
        prefixLength = 24;
      }
    ];

  };
}
