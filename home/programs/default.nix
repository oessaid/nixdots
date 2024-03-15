{ config, pkgs, ... }: {
  imports = [
    ./utilities.nix
    ./git.nix
    ./zathura.nix
    ./firefox.nix
    ./chromium.nix
    ./dropbox.nix
    ./yazi.nix
    ./obs.nix
    ./office.nix
  ];

  home.packages = with pkgs;
    [
      # cmake
    ];
}
