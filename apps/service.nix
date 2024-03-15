
{ pkgs, config, lib, ... }:
{
    services.nextcloud-client = {
        enable = true;
        startInBackground = true;
    };
}
