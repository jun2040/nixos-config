{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    plugins = [
	pkgs.tmuxPlugins.catppuccin
    ];
    extraConfig = ''
      # Change prefix
      unbind C-b
      set -g prefix C-Space
      bind C-space send-prefix

      # Vim style navigation
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
    '';
  };
}
