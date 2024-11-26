{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, lanzaboote, ... }@inputs: {
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
          inputs.home-manager.nixosModules.default
        ];
      };

      # Laptop Configuration
      hermes = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/hermes/configuration.nix
          inputs.home-manager.nixosModules.default
      	  lanzaboote.nixosModules.lanzaboote({ pkgs, lib, ... }: {
            environment.systemPackages = [
              pkgs.sbctl
            ];

            # Lanzaboote currently replaces the systemd-boot module.
            # This setting is usually set to true in configuration.nix
            # generated at installation time. So we force it to false
            # for now.
            boot.loader.systemd-boot.enable = lib.mkForce false;

            boot.lanzaboote = {
              enable = true;
              pkiBundle = "/etc/secureboot";
            };
          })
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

    devShells = ({ pkgs }: {
      c = pkgs.mkShell.override
        {
          # Override stdenv in order to change compiler:
          # stdenv = pkgs.clangStdenv;
        }
        {
          packages = with pkgs; [
            clang-tools
            cmake
            codespell
            conan
            cppcheck
            doxygen
            gtest
            lcov
            vcpkg
            vcpkg-tool
          ] ++ (if system == "aarch64-darwin" then [ ] else [ gdb ]);
        };
    });
  };
}
