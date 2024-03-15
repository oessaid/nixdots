{
  config,
  pkgs,
  ...
}: let
  nixGL = import ../nixGL.nix {inherit pkgs config;};
in {
  home.packages = with pkgs; [
    maestral
    (nixGL maestral-gui)
  ];
}
