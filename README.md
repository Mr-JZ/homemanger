# homemanger

This is the configuration i use on other then nixos devices

## Set the experimental-features flag

You have to change the user to root to be able to write to the nix.conf file

```bash
echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf
```

## Rebuild the system

```bash
nix run nixpkgs#home-manager -- switch --flake $HOME/.config/home-manager/#$USER --impure
```

The impure flag is because ... <!-- TODO: write why the impure flag is there -->
