{ pkgs, ... }:

{
  # User config
  users.users.jun2040 = {
    initialPassword = "1234";
    isNormalUser = true;
    extraGroups = [ "wheel" "nixconfig" "networkmanager" ];
    packages = with pkgs; [];
  };
}
