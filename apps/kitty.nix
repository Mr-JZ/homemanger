{ pkgs, config, ... }:

{
  # Configure Kitty
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
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
    };
  };
}
