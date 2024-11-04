{
  programs.waybar = {
    enable = true;
    style = ''
      * {
        font-family: 'Fira Code';
      }
    '';
    settings = [{
      height = 30;
      layer = "top";
      position = "top";
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
    }];
  };
}
