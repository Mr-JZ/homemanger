{ pkgs, config, browser, wallpaperDir, flakeDir,
  username, wallpaperGit, ... }:

{
  # Install Packages For The User
  home.packages = with pkgs; [
    obsidian
    libreoffice-qt
    projectlibre
    inkscape
    gimp 
    obs-studio  
    kdenlive 
    davinci-resolve
    audacity
    blender-hip # TODO: What is the blender-hip packages and what is the difference to the original
  ];
}
