{pkgs, ...}:
{
  #MySQL
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };
}
