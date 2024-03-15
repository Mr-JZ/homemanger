
{ pkgs, config, ... }:

{
  # Install Packages For The User
  home.packages = with pkgs; [
    discord 
    slack
    element-desktop
    signal-desktop
    teams-for-linux
  ];
}
