{ config, pkgs, ... }:

{
  imports = [
    ./starship.nix
    ./zsh.nix
    ./tmux.nix
  ];
}
