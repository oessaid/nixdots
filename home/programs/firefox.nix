{
  config,
  pkgs,
  ...
}: let
  nixGL = import ../nixGLNvidia.nix {inherit pkgs config;};
in {
  programs.firefox = {
    enable = true;
    package = nixGL pkgs.firefox;
  };
}
