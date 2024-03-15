{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./alacritty.nix
    ./wezterm
    ./foot.nix
  ];
}
