{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
  };

  home.packages = with pkgs; [
    gcc
  ];

  home.file = {
    ".config/nvim" = {
      source = ./custom;
      recursive = true;
    };
  };
}
