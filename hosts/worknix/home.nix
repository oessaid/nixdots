{
  inputs,
  config,
  pkgs,
  pkgs-stable,
  lib,
  ...
}: {
  imports = [
    ../../home
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    stateVersion = "23.11";
    username = "oessaid";
    homeDirectory = "/home/oessaid";
  };

  home.packages = [
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
