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

  config = {
    targets.genericLinux.enable = true;

    nixGLPrefix = "${pkgs.nixgl.nixGLIntel}/bin/nixGLIntel";

    wm.hyprland.enable = true;

    nixpkgs = {
      config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
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
  };
}
