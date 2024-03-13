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

  config = {
    # Manually installed on Ubuntu 22.04
    wm.hyprland.enable = true;

    home = {
      stateVersion = "23.11";
      username = "oessaid";
      homeDirectory = "/home/oessaid";
    };
  };
}
