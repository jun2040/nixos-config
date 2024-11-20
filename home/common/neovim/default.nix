{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
  };

  home.packages = with pkgs; [
    gcc

    lua-language-server
    stylua
  ];

  home.file = {
    ".config/nvim" = {
      source = ./custom;
      recursive = true;
    };
  };
}
