{
  imports = [
    ./waybar.nix
  ];

  wayland.windowManager.hyprland = 
  let
    go_to_workspace = x: [ "$mod, ${toString x}, workspace, ${toString x}" ];
    move_to_workspace = x: [ "$mod SHIFT, ${toString x}, movetoworkspace, ${toString x}" ];
    set_persistent = x: [ "${toString x}, persistent:true" ];
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
	"$mod, C, killactive"
	
	"$mod, H, movefocus, l"
	"$mod, L, movefocus, r"
	"$mod, K, movefocus, u"
	"$mod, J, movefocus, d"

	"$mod SHIFT, H, movewindow, l"
	"$mod SHIFT, L, movewindow, r"
	"$mod SHIFT, K, movewindow, u"
	"$mod SHIFT, J, movewindow, d"

	"$mod, TAB, workspace, +1"
	"$mod SHIFT, TAB, workspace, -1"
      ]
      ++ (loop 1 9 go_to_workspace)
      ++ (loop 1 9 move_to_workspace);

      workspace = []
      ++ (loop 1 9 set_persistent);

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
