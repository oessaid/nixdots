{ config, pkgs, ... }: {
  programs.starship = {
    enable = true;
    # Fixes the `direnv` bug while 1.18.0 is not released yet.
    # Builds from the [1.18.0 MR](https://github.com/starship/starship/pull/5684/commits)
    # using `custom-starship.nix`
    # package = pkgs.callPackage ./custom-starship.nix {};
    # settings = pkgs.lib.importTOML ./gruvbox-rainbow.toml;
    settings = pkgs.lib.importTOML ./pure.toml;
  };
}
