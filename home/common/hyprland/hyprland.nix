{
  imports = [
    ./waybar.nix
  ];

  wayland.windowManager.hyprland = 
  let
    go_to_workspace = x: [ "$mod, ${toString x}, workspace, ${toString x}" ];
    move_to_workspace = x: [ "$mod SHIFT, ${toString x}, movetoworkspace, ${toString x}" ];
    loop = i: n: template:
      if i < n
      then (template i) ++ (loop (i + 1) n template)
      else (template i);
  in {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, M, exit"
	"$mod, RETURN, exec, alacritty"
	"$mod, SPACE, exec, fuzzel"
	
	"$mod, H, movefocus, l"
	"$mod, L, movefocus, r"
	"$mod, K, movefocus, u"
	"$mod, J, movefocus, d"

	"$mod SHIFT, H, movewindow, l"
	"$mod SHIFT, L, movewindow, r"
	"$mod SHIFT, K, movewindow, u"
	"$mod SHIFT, J, movewindow, d"
      ]
      ++ (loop 1 9 go_to_workspace)
      ++ (loop 1 9 move_to_workspace);
      misc = {
        force_default_wallpaper = 0;
	disable_hyprland_logo = true;
      };
      exec-once = [
        "waybar"
      ];
    };
  };
}
