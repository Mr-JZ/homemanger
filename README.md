# homemanger

This is the configuration i use on other then nixos devices

## Rebuild the system

```bash
nix run nixpkgs#home-manager -- switch --flake $HOME/.config/home-manager/#$USER --impure
```

The impure flag is because ... <!-- TODO: write why the impure flag is there -->
