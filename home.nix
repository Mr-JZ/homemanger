{ pkgs, ... }:

let
  username = "mr-jz";
  flakeDir = "/home/${username}/.config/home-manager";
in {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  fonts.fontconfig.enable = true;
  home.packages = with pkgs;[
    nerdfonts
    #neovim
    tokei
    fzf
    zathura
    zotero
    tailscale
    tmux
    playerctl
    speedtest-cli
    stow 
    lazygit
    dbeaver
    glab
    gh
    fd
    ripgrep
    lsd
    git
    zoxide
    starship
    python313
    julia
    go
    texliveFull
    nodejs
    nodePackages.npm
    php
    php83Packages.composer
    luajitPackages.luarocks
    clang
    cargo
    zulu17
    gnumake
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
  ];
  home.file = {
    ".config/zaney-stinger.mov".source = ./apps/files/media/zaney-stinger.mov;
    ".emoji".source = ./apps/files/emoji;
    ".base16-themes".source = ./apps/files/base16-themes;
    ".face".source = ./apps/files/face.jpg; # For GDM
    ".face.icon".source = ./apps/files/face.jpg; # For SDDM
    ".config/starship.toml".source = ./apps/files/starship.toml;
    ".config/kitty/kitty.conf".source = ./apps/files/kitty.conf;
    ".local/share/fonts" = {
      source = ./apps/files/fonts;
      recursive = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    enableCompletion = true;
    profileExtra = ''
      #if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
      #  exec Hyprland
      #fi
    '';
    initExtra = ''

    stty -ixon

    # the command that initializes zoxide. And make that zoxide works with bash
    eval "$(zoxide init bash)" 
    # include path to PATH
    export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
    export PATH=$PATH:$HOME/go/bin

    if [ -f $HOME/.bashrc-personal ]; then
        source $HOME/.bashrc-personal
    fi
    if command -v fzf-share >/dev/null; then
      source "$(fzf-share)/key-bindings.bash"
      source "$(fzf-share)/completion.bash"
    fi

    eval "$(starship init bash)"

    if ! tmux has-session >/dev/null 2>&1; then
      s
    fi
    '';
    sessionVariables = {
    };
    shellAliases = {
      sv="sudo vim";
      flake-rebuild="nix run nixpkgs#home-manager -- switch --flake ${flakeDir}#$USE --impure";
      flake-update="sudo nix flake update ${flakeDir}";
      gcCleanup="nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
      ghd="gh-dash";
      ghc="gh repo clone $(gh repo list | fzf | awk '{print $1}')";
      git-hash-copy="printf %s \"$(git rev-parse HEAD)\" | wl-copy";
      mullr="mullvad relay set location $(mullvad relay list | fzf | awk '{print $1}')";
      z="zoxide";
      v="nvim";
      ls="lsd";
      ll="lsd -l";
      la="lsd -a";
      lal="lsd -al";
      wifi="nmcli device wifi";
      cgh="git rev-parse main | wl-copy";
      ".."="cd ..";
      s = "sesh connect $(sesh list | fzf --height 24)";
    };
  };

  programs.kitty = {
    enable = false;
    font.name = "JetBrainsMono Nerd Font";
    font.size = 16;
    settings = {
      scrollback_lines = 2000;
      wheel_scroll_min_lines = 1;
      window_padding_width = 6;
      confirm_os_window_close = 0;
      background_opacity = "0.85";
    };
    keybindings = {
      "alt+g" = "send_key ctrl+b g";
      "alt+c" = "send_key ctrl+b c";
      "alt+x" = "send_key ctrl+b x";
      "alt+n" = "send_key ctrl+b n";
      "alt+p" = "send_key ctrl+b p";
      "alt+e" = "send_key ctrl+b e";
      "alt+z" = "send_key ctrl+b z";
      "alt+f" = "send_key ctrl+b m";
      "alt+'" = "send_key ctrl+b \"";
      "alt+%" = "send_key ctrl+b %";
      "alt+u" = "send_key ctrl+b u";
      "alt+v" = "send_key v enter";
    };
  };
}
