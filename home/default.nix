{
  inputs,
  config,
  pkgs,
  pkgs-stable,
  lib,
  ...
}: let
  nixGL = import ./nixGL.nix {inherit pkgs config;};
in {
  imports = [
    ./options.nix

    ./editors
    ./terminals
    ./shells
    ./programs
    ./hyprland
    ./multiplexers
  ];

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.chromium = {
    enable = true;
    package = nixGL pkgs.chromium;
  };
}
