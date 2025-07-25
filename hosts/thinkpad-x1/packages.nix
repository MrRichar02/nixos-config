{pkgs, ...}:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    minikube
    kubectl
    docker-machine-kvm2
    dbeaver-bin
    mangohud
    protonup
  ];
}
