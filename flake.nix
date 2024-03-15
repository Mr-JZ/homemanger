{
  description = "Home Manager configuration of mr-jz";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      hostname = "jz-laptop";
      username = "mr-jz";
      gitUsername = "Jan Zisenis";
      gitEmail = "j.zisenis@netrocks.de";
      theLocale = "en_US.UTF-8";
      theKBDLayout = "us";
      theLCVariables = "en_US.UTF-8";
      theTimezone = "Europe/Berlin";
      flakeDir = "/home/${username}/.config/home-manager";
    in {
      homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
      home-manager.extraSpecialArgs = {
            inherit username; inherit pkgs; inherit flakeDir;
      };
    };
}
