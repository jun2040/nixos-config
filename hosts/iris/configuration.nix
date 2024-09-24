# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      # Import hardware configuration
      ./hardware-configuration.nix

      # Import home manager module
      inputs.home-manager.nixosModules.default

      # Import user modules
      ../common/users/jun2040
    ];
  
  # Enable experimental Nix features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Boot loader config (Grub EFI)
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
    };
  };

  # Home Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "jun2040" = import ../../home/jun2040/home.nix;
    };
  };

  # Set hostname
  networking.hostName = "iris";

  # Set time zone.
  time.timeZone = "Europe/Zurich";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable VMware Tools
  virtualisation.vmware.guest.enable = true;

  # Install font
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  # Install system packages
  environment.systemPackages = with pkgs; [
    neovim
    git
  ];

  # Default user shell config
  users.defaultUserShell = pkgs.zsh;

  # Create user groups
  users.groups = {
    nixconfig = {
      gid = 5000;
      name = "nixconfig";
    };
  };

  # Enable polkit
  security.polkit.enable = true;

  # Enable graphics
  hardware.graphics.enable = true;

  # Set folder permission
  systemd.tmpfiles.settings = {
    "10-mypackage" = {
      "/etc/nixos" = {
        Z = {
	  mode = "0775";
	  user = "root";
	  group = "nixconfig";
	};
      };
    };
  };

  # Programs
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "FiraCode Nerd Font:size=16";
      };
    };
  };

  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };

  # Services

  # OpenSSH
  services.openssh = {
    enable = true;
  };

  # Initial system version
  # DO NOT MODIFY
  system.stateVersion = "24.11";

}

