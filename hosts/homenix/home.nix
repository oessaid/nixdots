{
  inputs,
  config,
  pkgs,
  pkgs-stable,
  ...
}: {
  imports = [
    ../../home
  ];

  config.wm.hyprland.enable = true;

  home = {
    stateVersion = "23.11";
    username = "oessaid";
    homeDirectory = "/home/oessaid";
  };
}
