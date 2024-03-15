{
  config,
  pkgs,
  ...
}: let
  nixGL = import ../nixGL.nix {inherit config pkgs;};
in {
  programs.obs-studio = {
    enable = true;
    package = nixGL pkgs.obs-studio;
    plugins = with pkgs; [
      obs-studio-plugins.wlrobs
      obs-studio-plugins.obs-pipewire-audio-capture
    ];
  };
}
