{ config, pkgs, flakeDir, ... }:

{
  # Configure Bash
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
    echo "this for internet connection: nmcli device wifi connect <SSID> password <PASS>"
    if command -v fzf-share >/dev/null; then
      source "$(fzf-share)/key-bindings.bash"
      source "$(fzf-share)/completion.bash"
    fi

    bind '"\C-w": backward-kill-word'
    UID=$(id -u)
    GID=$(id -g)
    if [ -f "/run/secrets/openai_api_key" ]; then
      export OPENAI_API_KEY=$(cat /run/secrets/openai_api_key)
    fi
    '';
    sessionVariables = {
    };
    shellAliases = {
      sv="sudo vim";
      flake-rebuild="sudo nixos-rebuild switch --flake ${flakeDir}";
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
}
