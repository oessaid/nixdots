{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Omar Essaid";
    userEmail = "omar.essaid@gmail.com";
  };
}
