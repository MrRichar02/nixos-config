{lib, config, ...}:
{
  options.myModules.shell.zsh.enable = lib.mkEnableOption "enables zsh shell";

  config = lib.mkIf config.myModules.shell.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletions = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      history.size = 10000;
    };
  };
}
