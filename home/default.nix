{
  inputs,
  config,
  pkgs,
  pkgs-stable,
  lib,
  nixGL,
  ...
}: {
  imports = [
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
