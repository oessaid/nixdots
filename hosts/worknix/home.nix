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

    # Manually installed on Ubuntu 22.04
    wm.hyprland.enable = false;

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
