{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
  };

  outputs = { nixpkgs, ... } @ inputs:
    {
      nixosConfigurations = { 
        "thinkpad" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          specialArgs = { inherit inputs; };

          modules = [
            ./hosts/laptop-thinkpad/configuration.nix
            ./modules
            inputs.stylix.nixosModules.stylix
          ];
        };

        "ideapad" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          specialArgs = { inherit inputs; };

          modules = [
            ./hosts/laptop-ideapad/configuration.nix
            ./modules
            inputs.stylix.nixosModules.stylix
          ];
        };
      };
    };
}
