{ config, pkgs, lib, ... }:

{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = builtins.readFile ./config.lua;
  };
}
