{
  programs.waybar = {
    enable = true;
    style = ''
      * {
        font-family: 'Fira Code';
      }

      window#waybar {
        padding: 3px;
      }

      #workspaces button.active {
        background: #ff0000;
      }

      #workspaces button:hover {
	box-shadow: inherit;
	text-shadow: inherit;
      }

      #workspaces button.focused {
	background: #e88939;
	background: #00afd7;
	color: #1b1d1e;
      }

      #workspaces button.urgent {
	background: #af005f;
	color: #1b1d1e;
      }
    '';
    settings = [{
      height = 30;
      layer = "top";
      position = "top";
      modules-center = [
        "hyprland/workspaces"
      ];
      modules-right = [
        "battery"
        "clock"
      ];
      clock = {
        interval = 1;
        format = "  {:%H:%M:%S\n%Y\/%m\/%d}";
      };
      battery = {
        states = {
	  warning = 30;
	  critical = 15;
	};
	format = "{capacity}% {icon}";
	format-full = "{capacity}% {icon}";
        format-charging = "{capacity}% ";
        format-plugged = "{capacity}% ";
        format-alt = "{time} {icon}";
	format-icons = [ " " " " " " " " " " ];
      };
      "hyprland/workspaces" = {
        disable-scroll = true;
	all-outputs = true;
	on-click = "activate";
      };
    }];
  };
}
