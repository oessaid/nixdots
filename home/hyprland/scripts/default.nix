{ pkgs, config, ... }:
let
  fuzzy-zathura = pkgs.writeShellScriptBin "fuzzy-zathura" ''
    #!/bin/sh
    book=$(fd . ~/books --type f | fzf)
    [ -n "$book" ] && zathura --fork "$book"
  '';
  capture-annotate = pkgs.writeShellScriptBin "capture-annotate" ''
    #!/bin/sh
    grim -g "$(slurp -o -c '#ff0000ff')" - | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/satty-$(date '+%Y%m%d-%H:%M:%S').png
  '';
  xdg-desktop-portal-init =
    pkgs.writeShellScriptBin "xdg-desktop-portal-init" ''
      #!/usr/bin/env bash

      if command -v dbus-update-activation-environment >/dev/null; then
        dbus-update-activation-environment XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE
      fi
      systemctl --user import-environment XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE

      sleep 1
      killall -e xdg-desktop-portal-hyprland
      killall -e xdg-desktop-portal-wlr
      killall xdg-desktop-portal
      # /usr/lib/xdg-desktop-portal-hyprland &
      /home/oessaid/.nix-profile/libexec/xdg-desktop-portal-hyprland &
      sleep 2
      # /usr/lib/xdg-desktop-portal &
      /usr/libexec/xdg-desktop-portal &

      # sleep 1
      # killall -e xdg-desktop-portal-hyprland
      # killall -e xdg-desktop-portal-wlr
      # killall -e xdg-desktop-portal-gnome
      # killall xdg-desktop-portal
      # # /home/oessaid/.nix-profile/libexec/xdg-desktop-portal-hyprland &
      # # systemctl --user start xdg-desktop-portal-hyprland
      # sleep 2
      # # systemctl --user start xdg-desktop-portal
      # /usr/libexec/xdg-desktop-portal &
    '';
  wrappedhl = pkgs.writeShellScriptBin "wrappedhl" ''
    #!/bin/sh
    cd ~

    export _JAVA_AWT_WM_NONREPARENTING=1
    export XCURSOR_SIZE=24
    export LIBVA_DRIVER_NAME=nvidia
    export XDG_SESSION_TYPE=wayland
    # export GBM_BACKEND=nvidia-drm # crashes Firefox
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export WLR_NO_HARDWARE_CURSORS=1

    exec Hyprland
  '';
in {
  imports = [ ./blocks.nix ];
  home.packages = with pkgs; [
    fuzzy-zathura
    capture-annotate
    xdg-desktop-portal-init
    wrappedhl
  ];
}
