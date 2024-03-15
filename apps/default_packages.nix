{ pkgs, config, browser, wallpaperDir, flakeDir,
  username, wallpaperGit, ... }:

{
  # Install Packages For The User
  home.packages = with pkgs; [
    # packages that make hyprland work
    libvirt 
    swww # TODO: What does this packages do?
    grim # TODO: What does this packages do?
    slurp # TODO: What does this packages do?
    gnome.file-roller # TODO: What is gnome.file-roller
    swaynotificationcenter 
    rofi-wayland 
    imv # TODO: What does this packages do?
    transmission-gtk # TODO: What does this packages do?
    mpv
    font-awesome 
    swayidle 
    neovide 
    pavucontrol
    element-desktop 
    swaylock 
    home-manager
    playerctl
    speedtest-cli
    stow 
    lazygit
    texlive.combined.scheme-full
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    # Import Scripts
    (import ./../scripts/emopicker9000.nix { inherit pkgs; })
    (import ./../scripts/task-waybar.nix { inherit pkgs; })
    (import ./../scripts/squirtle.nix { inherit pkgs; })
    (import ./../scripts/wallsetter.nix { inherit pkgs; inherit wallpaperDir;
      inherit username; inherit wallpaperGit; })
    (import ./../scripts/themechange.nix { inherit pkgs; inherit flakeDir; })
    (import ./../scripts/theme-selector.nix { inherit pkgs; })
    (import ./../scripts/nvidia-offload.nix { inherit pkgs; })
    (import ./../scripts/play_yoga.nix { inherit pkgs; } )
    (import ./../scripts/play_meditation.nix { inherit pkgs; } )
    (import ./../scripts/backup_mainwebsite.nix { inherit pkgs; inherit username;} )
  ];
  programs.fzf.tmux.enableShellIntegration = true;
}
