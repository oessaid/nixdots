{ config, pkgs, lib, ... }:
# let nixGL = import ../../nixGLNvidia.nix { inherit pkgs config; };
let nixGL = import ../../nixGL.nix { inherit pkgs config; };
in {
  programs.wezterm = {
    enable = true;
    package = nixGL pkgs.wezterm;
    enableZshIntegration = true;
    extraConfig = builtins.readFile ./config.lua;
  };
}
