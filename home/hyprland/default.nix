{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.wm.hyprland;
  nixGL = import ../nixGL.nix {inherit pkgs config;};
in {
  imports = [
    ./scripts
    ./waybar
    ./hyprpaper.nix
    ./wofi.nix
  ];

  config = mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      # Wrap with nixGL if a nixGL prefix is set
      package = nixGL pkgs.hyprland;

      enable = cfg.enable;
      xwayland.enable = true;
      settings = {
        env = [
          "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
          "LIBVA_DRIVER_NAME,nvidia"
          "GBM_BACKEND,nvidia-drm"
          "__GLX_VENDOR_LIBRARY_NAME,nvidia"
          "WLR_NO_HARDWARE_CURSORS,1"
          "__GLL_VRR_ALLOWED,1"
          "XDG_CURRENT_DESKTOP=Hyprland"
          "XDG_SESSION_TYPE=wayland"
          "XDG_SESSION_DESKTOP=Hyprland"

          # Worknix nonsense (because Ubuntu and Wayland)
          # This was required to use the discrete Nvidia GPU
          "__NV_PRIME_RENDER_OFFLOAD,1"
          "WLR_RENDERER_ALLOW_SOFTWARE,1"
          "WLR_DRM_DEVICES,/dev/dri/card1:/dev/dri/card0"
          # "WLR_DRM_DEVICES,/dev/dri/card1"
          # toolkit-specific scale
          "GDK_SCALE,2"
          "XCURSOR_SIZE,32"
        ];
        exec-once = [
          "dunst"
          "nm-applet --indicator & disown"
        ];
        exec = [
          "pkill waybar & sleep 0.5 && waybar"
          "hyprpaper"
        ];
        general = {
          gaps_in = 5;
          gaps_out = 20;
          border_size = 2;
          "col.active_border" = "rgba(c7962ee0)";
          "col.inactive_border" = "rgba(00000088)";
          layout = "dwindle";
          resize_on_border = true;
        };
        input = {
          follow_mouse = 2;
        };
        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };
        master = {
          orientation = "left";
        };
        decoration = {
          rounding = 10;
          blur = {
            enabled = true;
            size = 3;
            passes = 1;
            new_optimizations = true;
          };
          drop_shadow = true;
          shadow_range = 4;
          shadow_render_power = 3;
          "col.shadow" = "rgba(1a1a1aee)";
        };
        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
        };
        xwayland = {
          force_zero_scaling = true;
        };
        animations = {
          enabled = true;
          animation = [
            "border, 1, 2, default"
            "fade, 1, 4, default"
            "windows, 1, 3, default, popin 80%"
            "workspaces, 1, 2, default, slide"
          ];
        };
        "$mainMod" = "CTRL_ALT_SHIFT_WIN";
        "$altMod" = "SUPER";
        bind = [
          "$mainMod, SPACE, exec, wofi --show drun"
          "$mainMod, T, exec, alacritty"
          "$mainMod, F, exec, firefox"
          "$mainMod, B, exec, alacritty -e fuzzy-zathura"
          "$mainMod, Q, killactive"

          "$mainMod, h, movefocus, l"
          "$mainMod, j, movefocus, d"
          "$mainMod, k, movefocus, u"
          "$mainMod, l, movefocus, r"

          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"

          "$mainMod, I, workspace, r+1"
          "$mainMod, U, workspace, r-1"
        ];
        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];
      };
      extraConfig = ''
        # monitor setup
        # commented out - handled through nwg-displays
        # monitor=desc:LG Electronics LG TV SSCR2 0x01010101,3840x2160@60,auto,1.2,bitdepth,10,vrr,2
        source = ~/.config/hypr/monitors.conf
        source = ~/.config/hypr/workspaces.conf

        # Handle closing lid of laptop
        # trigger when the switch is turning on
        bindl=,switch:on:Lid Switch,exec,hyprctl keyword monitor "eDP-1, disable"
        # trigger when the switch is turning off
        bindl=,switch:off:Lid Switch,exec,hyprctl keyword monitor "desc:AU Optronics 0x4F9B ,2560x1600@60.039001,912x1800,2.0"

        # layout edit
        bind = $mainMod, RETURN, submap, layoutedit
        submap = layoutedit

        # toggle floating
        bind = , SPACE, togglefloating

        # resize (press and hold)
        binde = CTRL, l, resizeactive, 25 0
        binde = CTRL, h, resizeactive, -25 0
        binde = CTRL, k, resizeactive, 0 -25
        binde = CTRL, j, resizeactive, 0 25

        # move window
        bind = , h, movewindow, l
        bind = , l, movewindow, r
        bind = , k, movewindow, u
        bind = , j, movewindow, d

        # move to workspace
        bind = , 1, movetoworkspace, 1
        bind = , 2, movetoworkspace, 2
        bind = , 3, movetoworkspace, 3
        bind = , 4, movetoworkspace, 4
        bind = , 5, movetoworkspace, 5
        bind = , 6, movetoworkspace, 6
        bind = , 7, movetoworkspace, 7
        bind = , 8, movetoworkspace, 8
        bind = , 9, movetoworkspace, 9
        bind = , 0, movetoworkspace, 10

        bind = , I, movetoworkspace, r+1
        bind = , U, movetoworkspace, r-1

        # Reset submap
        bind = , escape, submap, reset
        submap = reset
      '';
    };
  };
}
