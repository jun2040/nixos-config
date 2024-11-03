{
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
}
