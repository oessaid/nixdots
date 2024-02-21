{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    prefix = "C-Space";
    keyMode = "vi";
    mouse = true;
    historyLimit = 5000;
  };
}
