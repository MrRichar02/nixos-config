{pkgs, ...}:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.docair = {
    isNormalUser = true;
    description = "docair";
    extraGroups = ["networkmanager" "wheel" ];
    shell = pkgs.bash;
  };
}
