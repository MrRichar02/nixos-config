{inputs, ...}:
{
  nix.settings.experimental-features = ["nix-command" "flakes"];

  #nixd path
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
