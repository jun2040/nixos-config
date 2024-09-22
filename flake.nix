{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      # NAS Configuration
      atlas = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/atlas/configuration.nix
          # inputs.home-manager.nixosModules.default
        ];
      };

      # PC Configuration
      helios = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/helios/configuration.nix
          # inputs.home-manager.nixosModules.default
        ];
      };

      # Laptop Configuration
      hermes = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/hermes/configuration.nix
          # inputs.home-manager.nixosModules.default
        ];
      };

      # Server Configuration
      hestia = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/hestia/configuration.nix
          # inputs.home-manager.nixosModules.default
        ];
      };

      # Virtual Machine Configuration
      iris = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/iris/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };

      # Raspberry PI Configuration
      pomona = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/pomona/configuration.nix
          # inputs.home-manager.nixosModules.default
        ];
      };
    };
  };
}
