{lib, config, ...}:
{
  options.myModules.virt-manager.enable = lib.mkEnableOption "enables virt-manager module";

  config = lib.mkIf config.myModules.virt-manager.enable {
    #virt-manager config

    programs.virt-manager.enable = true;

    virtualisation.libvirtd.enable = true;

    virtualisation.spiceUSBRedirection.enable = true;

  };
}
