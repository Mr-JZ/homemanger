{ pkgs, config, ... }:

{
  imports = [
    # Enable &/ Configure Programs
    ./style1-waybar.nix
    ./style2-waybar.nix
    ./swaync.nix
    ./swaylock.nix
    ./starship.nix
    ./neofetch.nix
    ./hyprland.nix
    ./kitty.nix
    ./rofi.nix
    ./bash.nix
    ./gtk-qt.nix
    ./gh.nix

    # Install Programs & Scripts For User
    ./default_packages.nix
    ./media_packages.nix
    ./media-editor_packages.nix
    ./productivity_packages.nix
    ./browser_packages.nix
    ./messaging_packages.nix
    ./development_packages.nix

    ./service.nix

    # Place Home Files Like Pictures
    ./files.nix
  ];
}
