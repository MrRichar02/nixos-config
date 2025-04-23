{inputs, lib, config, ...}:
{
  options.myModules.nix.enable = lib.mkEnableOption "enables nix module";

  config = lib.mkIf config.myModules.nix.enable {
    nix.settings.experimental-features = ["nix-command" "flakes"];

    #nixd path
    nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  };
}
