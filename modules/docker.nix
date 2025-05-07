{lib, config, ...}:
{
    options.myModules.docker.enable = lib.mkEnableOption "enables docker module";

    config = lib.mkIf config.myModules.docker.enable {
        virtualisation.docker.rootless = {
            enable = true;
            setSocketVariable = true;
        };
    };
}
