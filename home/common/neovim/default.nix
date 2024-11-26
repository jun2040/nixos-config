{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
  };

  home.packages = with pkgs; [
    gcc

    lua-language-server
    stylua

    java-language-server
    google-java-format

    zathura
    texlive.combined.scheme-full
  ];

  home.file = {
    ".config/nvim" = {
      source = ./custom;
      recursive = true;
    };
  };
}
