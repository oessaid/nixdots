{ config, pkgs, lib, ... }:
{
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    prefix = "C-Space";
    keyMode = "vi";
    mouse = true;
    historyLimit = 100000;
    extraConfig = builtins.readFile ./tmux.conf;
  };
}
