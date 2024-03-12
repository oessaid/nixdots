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

  home = {
    stateVersion = "23.11";
    username = "oessaid";
    homeDirectory = "/home/oessaid";
  };
}
