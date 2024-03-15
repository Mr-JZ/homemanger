{ pkgs, config, ... }:
{
    programs.go = {
      enable = true;
      package = pkgs.go;
      version = "1.16";
    };
}
