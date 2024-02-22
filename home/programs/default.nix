{ config, pkgs, ... }:

{
  imports = [
    ./utilities.nix
    ./git.nix
    ./nixvim.nix
  ];
}
