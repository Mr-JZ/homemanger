{ config, pkgs, flakeDir, ... }:
{
    programs.gh = {
      enable = true;
      package = pkgs.gh;
      extensions = [ ];
    };
    programs.gh-dash = {
      enable = true;
      package = pkgs.gh-dash;
    };
}
