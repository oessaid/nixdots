{ config, pkgs, ... }:

{
  imports = [
    ./utilities.nix
    ./git.nix
  ];
}
