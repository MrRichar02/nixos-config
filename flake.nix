{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix/release-25.11";
		mango = {
			url = "github:DreamMaoMao/mangowc";
			inputs.nixpkgs.follows = "nixpkgs";
		};
  };

  outputs = { nixpkgs, ... } @ inputs:
    {
      nixosConfigurations = { 
        "thinkpad" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          specialArgs = { inherit inputs; };

          modules = [
            ./hosts/thinkpad-x1
            ./modules
            inputs.stylix.nixosModules.stylix
						inputs.mango.nixosModules.mango
          ];
        };

        "ideapad" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          specialArgs = { inherit inputs; };

          modules = [
            ./hosts/ideapad
            ./modules
            inputs.stylix.nixosModules.stylix
						inputs.mango.nixosModules.mango
          ];
        };

      };
    };
}
