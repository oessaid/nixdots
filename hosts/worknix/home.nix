{
  inputs,
  config,
  pkgs,
  pkgs-stable,
  lib,
  ...
}: let
  nixGL = import ./nixGL.nix {
    inherit pkgs;
    inherit config;
  };
in {
  imports = [
    ./options.nix
    ../../home
  ];

  targets.genericLinux.enable = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
      nixGLPrefix = "${nixGL.packages.x86_64-linux.nixGLDefault}/bin/nixGLDefault";
      permittedInsecurePackages = [
        "nix-2.16.2"
      ];
    };
  };

  home = {
    stateVersion = "23.11";
    username = "oessaid";
    homeDirectory = "/home/oessaid";
  };

  programs.alacritty = {
    enable = true;
    package = nixGL pkgs.alacritty;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
