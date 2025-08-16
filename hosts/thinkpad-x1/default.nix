# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ config, pkgs, inputs, ... }: 
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./packages.nix
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.docair = {
    isNormalUser = true;
    description = "docair";
    extraGroups = ["networkmanager" "wheel" ];
    shell = pkgs.bash;
  };

  myModules = {
    bootloader.enable = true;
    audio.enable = true;
    networking.enable = true;
    hyprland.enable = true;
    timezone.enable = true;
    keymap.enable = true;
    nix.enable = true;
    stylix.enable = true;
    wireshark.enable = false;
    virt-manager.enable = false;
    shell.zsh.enable = false;
    docker.enable = false;
    podman.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
    ];
  };

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  programs.gamemode.enable = true;

  environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
