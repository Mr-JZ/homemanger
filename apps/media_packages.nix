{ pkgs, config, ... }:

{
  # Install Packages For The User
  home.packages = with pkgs; [
    spotify 
    jellyfin-media-player
    zathura
    libsForQt5.okular
    yt-dlp
    ];
}
