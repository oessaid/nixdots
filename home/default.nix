{
  inputs,
  config,
  pkgs,
  pkgs-stable,
  lib,
  ...
}: {
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
}
