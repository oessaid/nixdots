{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./starship
    ./zsh.nix
    ./direnv.nix
  ];
}
