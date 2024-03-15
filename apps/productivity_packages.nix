{ pkgs, config, ... }:

{
  # Install Packages For The User
  home.packages = with pkgs; [
    ticktick
  ];
}
