{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./alacritty.nix
    ./wezterm
  ];
}
