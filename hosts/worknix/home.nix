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

    # installed impurely:
    # - cloned `git@github.com:cmm/nixGL.git` (https://github.com/nix-community/nixGL/pull/152)
    # - `NIXPKGS_ALLOW_UNFREE=1 nix profile install ./#nixGLNvidia --impure`
    nixGLPrefixNvidia = "/home/oessaid/.nix-profile/bin/nixGLNvidia-545.29.06";
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

      # screen sharing
      pipewire
      wireplumber

      # screenshots
      hyprshot
      # color picker
      hyprpicker

      # XDG Desktop Portal
      xdg-desktop-portal-hyprland
    ];
  };
}
