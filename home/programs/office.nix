{ config, pkgs, lib, ... }:
let nixGL = import ../nixGL.nix { inherit pkgs config; };
in {
  home.packages = with pkgs; [
    (slack.overrideAttrs (default: {
      installPhase = default.installPhase + ''
        wrapProgram "$out/bin/slack" \
          --add-flags "--no-sandbox"
      '';
    }))
    (teams-for-linux.overrideAttrs (default: {
      installPhase = default.installPhase + ''
        wrapProgram "$out/bin/teams-for-linux" \
          --add-flags "--no-sandbox"
      '';
    }))
    spotify
  ];
}
