{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./utilities.nix
    ./git.nix
    ./zathura.nix
    ./firefox.nix
  ];
}
