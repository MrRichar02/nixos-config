{lib, config, ...}:
{
  options.myModules.shell.zsh.enable = lib.mkEnableOption "enables zsh shell";

  config = lib.mkIf config.myModules.shell.zsh.enable {
    programs.zsh = {
      enable = true;
      enableBashCompletion = true;
      autosuggestions.async = true;
    };
  };
}
