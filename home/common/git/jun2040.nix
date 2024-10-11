{}:
{
  programs.git = {
    enable = true;
    userName = "jun2040";
    userEmail = "isy.junny@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };
}
