{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.wm.hyprland;
  nixGL = import ../nixGL.nix { inherit pkgs config; };
in {
  imports = [
    ./scripts
    ./waybar
    ./hyprpaper.nix
    ./hyprlock.nix
    ./wofi.nix
    ./dunst.nix
    ./utilities.nix
  ];

  config = mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      package = nixGL pkgs.hyprland;

      enable = cfg.enable;
      systemd = {
        enable = true;
        variables = [ "--all" ];
        extraCommands = [
          "systemctl --user stop graphical-session.target"
          "systemctl --user start hyprland-session.target"
        ];
      };
      xwayland.enable = true;
      settings = {
        env = [
          # Toolkits variables
          # GTK/GDK
          "GDK_BACKEND,wayland,x11" # GTK: Use wayland if available, fall back to x11 if not.
          "GTK_THEME,Yaru-sage-dark"
          "GDK_SCALE,2"
          "XCURSOR_SIZE,32"
          "XCURSOR_THEME,Yaru"

          # Qt
          "QT_QPA_PLATFORM,wayland;xcb" # Qt: Use wayland if available, fall back to x11 if not.
          "QT_AUTO_SCREEN_SCALE_FACTOR,1" # Auto-scaling based on monitor pixel density
          "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"

          # Other
          "SDL_VIDEODRIVER,wayland" # Run SDL2 applications on Wayland
          "CLUTTER_BACKEND,wayland" # Force Clutter applications to use Wayland

          # Electron
          "NIXOS_OZONE_WL,1"

          # Nvidia
          # "GBM_BACKEND,nvidia-drm" # remove, randomly crashes Firefox
          "__GLX_VENDOR_LIBRARY_NAME,nvidia"
          "LIBVA_DRIVER_NAME,nvidia"
          "WLR_NO_HARDWARE_CURSORS,1"
          "__GLL_VRR_ALLOWED,1"
          "__GL_GSYNC_ALLOWED,1"
          # Worknix nonsense (because Ubuntu and Wayland)
          # This was required to use the discrete Nvidia GPU
          "__NV_PRIME_RENDER_OFFLOAD,1"
          "WLR_RENDERER_ALLOW_SOFTWARE,1"
          #"WLR_DRM_DEVICES,/dev/dri/card1:/dev/dri/card0"

          # XDG specifications
          "XDG_CURRENT_DESKTOP,Hyprland"
          "XDG_SESSION_TYPE,wayland"
          "XDG_SESSION_DESKTOP,Hyprland"
        ];
        exec-once = [
          "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          "systemctl --user restart xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk"
          # "waybar"
          # "hyprpaper"
          "nm-applet --indicator & disown"
          "dunst"
          "blueman-applet"
          # "foot --server"

          "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          "dbus-update-activation-environment --systemd --all"
          "xdg-desktop-portal-init"
        ];
        exec = [ ];
        general = {
          gaps_in = 5;
          gaps_out = 20;
          border_size = 1;
          "col.active_border" = "0xff33b1ff";
          "col.inactive_border" = "rgba(00000088)";
          layout = "dwindle";
          resize_on_border = true;
          cursor_inactive_timeout = 3;
        };

        input = {
          follow_mouse = 2;
          kb_layout = "us,us";
          kb_variant = "basic,intl";
          kb_options = "caps:backspace,grp:shifts_toggle,altwin:swap_lalt_lwin";

          touchpad = { clickfinger_behavior = false; };
        };

        device = {
          name = "tpps/2-elan-trackpoint";
          sensitivity = "+0.6";
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        master = { orientation = "left"; };

        decoration = {
          active_opacity = 0.8;
          inactive_opacity = 0.8;
          rounding = 10;
          drop_shadow = true;
          shadow_range = 10;
          shadow_render_power = 4;
          "col.shadow" = "rgba(1a1a1aee)";

          # dim_inactive = true;
          # dim_strength = 0.5;

          blur = {
            enabled = true;
            size = 8;
            passes = 4;
            new_optimizations = true;
            noise = 1.0e-2;
            contrast = 0.9;
            brightness = 0.8;
          };
        };

        animations = {
          enabled = true;
          bezier = [ "myBezier, 0.05, 0.9, 0.1, 1.05" ];
          animation = [
            # "windows, 1, 3, default, popin 80%"
            # "layers, 1, 2, default, popin 80%"
            # "fade, 1, 4, default"
            # "border, 1, 2, default"
            # "workspaces, 0, 2, default, slide"

            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            "workspaces, 0, 6, default"
          ];
        };

        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
        };

        xwayland = { force_zero_scaling = true; };

        bind = [
          "SUPER, backspace, exec, swaylock"

          "SUPER, SPACE, exec, wofi --show drun"
          "SUPER, return, exec, foot"
          "SUPER, F, exec, firefox"
          "SUPER, Y, exec, foot yazi ~"
          # "SUPER, B, exec, alacritty -e fuzzy-zathura"
          "SUPER, B, exec, foot yazi ~/books"
          "SUPER, B, exec, yazi ~/books"
          "SUPER, Q, killactive"

          "SUPER, S, exec, hyprshot -m region --clipboard-only"
          "SUPER, A, exec, capture-annotate"
          "SUPER, P, exec, hyprpicker --autocopy --format=hex"

          "SUPER, h, movefocus, l"
          "SUPER, j, movefocus, d"
          "SUPER, k, movefocus, u"
          "SUPER, l, movefocus, r"

          "SUPER, 1, workspace, 1"
          "SUPER, 2, workspace, 2"
          "SUPER, 3, workspace, 3"
          "SUPER, 4, workspace, 4"
          "SUPER, 5, workspace, 5"
          "SUPER, 6, workspace, 6"
          "SUPER, 7, workspace, 7"
          "SUPER, 8, workspace, 8"
          "SUPER, 9, workspace, 9"
          "SUPER, 0, workspace, 10"

          "SUPER, I, workspace, r+1"
          "SUPER, U, workspace, r-1"

          "SUPER, semicolon, focuscurrentorlast" # semi-colon

          # toggle floating
          "SUPER_CTRL, SPACE, togglefloating"

          # move window
          "SUPER_CTRL, h, movewindow, l"
          "SUPER_CTRL, l, movewindow, r"
          "SUPER_CTRL, k, movewindow, u"
          "SUPER_CTRL, j, movewindow, d"

          # move to workspace"
          "SUPER_CTRL, 1, movetoworkspace, 1"
          "SUPER_CTRL, 2, movetoworkspace, 2"
          "SUPER_CTRL, 3, movetoworkspace, 3"
          "SUPER_CTRL, 4, movetoworkspace, 4"
          "SUPER_CTRL, 5, movetoworkspace, 5"
          "SUPER_CTRL, 6, movetoworkspace, 6"
          "SUPER_CTRL, 7, movetoworkspace, 7"
          "SUPER_CTRL, 8, movetoworkspace, 8"
          "SUPER_CTRL, 9, movetoworkspace, 9"
          "SUPER_CTRL, 0, movetoworkspace, 10"

          "SUPER_CTRL, I, movetoworkspace, r+1"
          "SUPER_CTRL, U, movetoworkspace, r-1"
        ];
        binde = [
          # resize (press and hold)
          "SUPER_SHIFT, l, resizeactive, 25 0"
          "SUPER_SHIFT, h, resizeactive, -25 0"
          "SUPER_SHIFT, k, resizeactive, 0 -25"
          "SUPER_SHIFT, j, resizeactive, 0 25"
        ];
        bindm =
          [ "SUPER, mouse:272, movewindow" "SUPER, mouse:273, resizewindow" ];
      };
      extraConfig = ''
        # monitor setup
        # commented out - handled through nwg-displays
        # monitor=desc:LG Electronics LG TV SSCR2 0x01010101,3840x2160@60,auto,1.2,bitdepth,10,vrr,2
        # source = ~/.config/hypr/monitors.conf
        # source = ~/.config/hypr/workspaces.conf

        # Special keys
        bind = , xf86monbrightnessup, exec, brightnessctl set 5%+
        bind = , xf86monbrightnessdown, exec, brightnessctl set 5%-
        bind = , xf86audioraisevolume, exec, wpctl set-volume -l 1.0 @DEFAULT_SINK@ 5%+
        bind = , xf86audiolowervolume, exec, wpctl set-volume -l 1.0 @DEFAULT_SINK@ 5%-
        bind = , xf86audiomute, exec, wpctl set-mute @DEFAULT_SINK@ toggle
      '';
    };
  };
}
