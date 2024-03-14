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
    nixGLPrefixNvidia = "/home/oessaid/.nix-profile/bin/nixGLNvidia-545.29.06";
    # nixGLPrefixNvidia = "${pkgs.nixgl.auto.nixGLNvidia}/bin/nixGLNvidia-545.29.06";
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

    # work specific packages
    home.packages = with pkgs; [
      obsidian
      slack
    ];
  };
}
