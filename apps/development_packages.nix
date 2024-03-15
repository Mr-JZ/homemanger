{ pkgs, config, browser, wallpaperDir, flakeDir,
  username, wallpaperGit, ... }:

{
  # Install Packages For The User
  home.packages = with pkgs; [
    dbeaver
    via
    etcher
    glab
    quickemu
    fd
    vscodium
    ollama
  ];
}
