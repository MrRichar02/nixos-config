{lib, config, ...}:
{
  options.myModules.virt-manager.enable = lib.mkEnableOption "enables virt-manager module";

  config = lib.mkIf config.myModules.virt-manager.enable {
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;
  };
}
