{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jun2040";
  home.homeDirectory = "/home/jun2040";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
  ];

  # List of Programs

  # All Environment
  # ---- Basic ----
  # Git
  programs.git = {
    enable = true;
    userName = "jun2040";
    userEmail = "isy.junny@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };

  # Zsh

  # Tmux
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

  programs.alacritty = {
    enable = true;
  };

  programs.firefox = {
    enable = true;
  };

  programs.fuzzel = {
    enable = true;
  };

  programs.waybar = {
    enable = true;
    style = ''
      * {
        font-family: 'Fira Code';
      }
    '';
    settings =[{
      height = 30;
      layer = "top";
      position = "top";
      modules-right = [
        "clock"
      ];
      clock = {
        interval = 1;
        format = "  {:%H:%M:%S\n%Y\/%m\/%d}";
      };
    }];
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, M, exit"
	"$mod, RETURN, exec, alacritty"
	"$mod, F, exec, firefox"
	"$mod, SPACE, exec, fuzzel"
	
	"$mod, H, movefocus, l"
	"$mod, L, movefocus, r"
	"$mod, K, movefocus, u"
	"$mod, J, movefocus, d"

	"$mod SHIFT, H, movewindow, l"
	"$mod SHIFT, L, movewindow, r"
	"$mod SHIFT, K, movewindow, u"
	"$mod SHIFT, J, movewindow, d"
      ];
      exec-once = [
        "waybar"
      ];
    };
  };

  # GUI Environment
  # ---- Basic ----
  # Hyprland
  # -> Waybar
  # -> Brave
  # -> Alacritty
  # ---- Communication ----
  # -> Discord
  # ---- Development ----
  # -> Emacs
  # -> IntelliJ
  # ---- Gaming ----
  # -> Steam
  # -> Riot Games

  # TUI Environment
  # Cage
  # Emacs

  # CLI Environment
  # Cage
  # Foot

  # TTY Environment

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/root/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
