{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.wm.hyprland;
  # nixGL = import ../nixGLNvidia.nix { inherit pkgs config; };
in {
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      # screen sharing
      pipewire
      wireplumber
      grim
      slurp

      # screenshots
      hyprshot
      satty
      # color picker
      hyprpicker

      # screen brightness
      brightnessctl

      # networking
      networkmanagerapplet

      # XDG Desktop Portal
      # (nixGL xdg-desktop-portal)
      # (nixGL xdg-desktop-portal-hyprland)
      # (nixGL xdg-desktop-portal-wlr)
      # xdg-desktop-portal
      # xdg-desktop-portal-hyprland

      # xdg-desktop-portal-wlr # installed through `apt`, otherwise screen sharing is broken
    ];

    # Monitors management
    services.kanshi = {
      enable = true;
      systemdTarget = "hyprland-session.target";
      profiles = {
        undocked = {
          outputs = [{
            criteria = "eDP-1";
            status = "enable";
            scale = 1.0;
            mode = "1920x1080@60Hz";
          }];
        };
        home_office = {
          outputs = [
            {
              criteria = "eDP-1";
              status = "disable";
              scale = 1.6;
              mode = "2560x1600@60Hz";
            }
            {
              criteria = "LG Electronics LG TV SSCR2 0x01010101";
              status = "enable";
              scale = 1.25;
              mode = "3840x2160@60Hz";
            }
          ];
        };
      };
    };
  };
}
