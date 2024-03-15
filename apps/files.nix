{ pkgs, config, ... }:

{
  # Place Files Inside Home Directory
  home.file.".config/zaney-stinger.mov".source = ./files/media/zaney-stinger.mov;
  home.file.".emoji".source = ./files/emoji;
  home.file.".base16-themes".source = ./files/base16-themes;
  home.file.".face".source = ./files/face.jpg; # For GDM
  home.file.".face.icon".source = ./files/face.jpg; # For SDDM
  home.file.".config/rofi/rofi.jpg".source = ./files/rofi.jpg;
  home.file.".config/starship.toml".source = ./files/starship.toml;
  home.file.".gnupg/gpg-agent.conf".source = ./files/gpg-agent.conf;
  home.file.".local/share/fonts" = {
    source = ./files/fonts;
    recursive = true;
  };
  home.file.".config/tmux".source = builtins.fetchGit {
   url = "https://github.com/Mr-JZ/tmuxconfig.git";
   rev = "aaa2b19bd5a6a3eb1fb5e14491fa107afbe4bd8e";
   submodules = true;
  };
  home.file.".config/nvim".source =  builtins.fetchGit {
    url = "https://github.com/Mr-JZ/nvimconfig.git";
    rev = "f710218b40259bb601ebd50a6a9d039e00b2de16";
  };
}

