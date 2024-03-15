{ config, lib, pkgs, ... }:
with lib;
let cfg = config.wm.hyprland;
in {
  config = mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      package = pkgs.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
      systemd = {
        enable = true;
        target = "graphical-session.target";
      };
      settings = {
        mainBar = {
          margin = "0px 0px -10px 0px";
          layer = "top";

          modules-left = [ "custom/wmname" "tray" "wlr/taskbar" ];
          modules-center = [ "hyprland/workspaces" ];
          modules-right = [
            "battery"
            "cpu"
            "temperature"
            "memory"
            "backlight"
            "pulseaudio"
            "clock"
          ];

          # "hyprland/workspaces" = {
          #   active-only = "false";
          #   on-scroll-up = "hyprctl dispatch workspace e+1";
          #   on-scroll-down = "hyprctl dispatch workspace e-1";
          #   disable-scroll = "false";
          #   all-outputs = "true";
          #   format = "{name}";
          #   on-click = "activate";
          # };

          "hyprland/workspaces" = {
            "active-only" = false;
            "all-outputs" = true;
            "format" = "{icon}";
            "show-special" = false;
            "on-click" = "activate";
            "on-scroll-up" = "hyprctl dispatch workspace e-1";
            "on-scroll-down" = "hyprctl dispatch workspace e+1";
            "persistent-workspaces" = {
              "1" = [ ];
              "2" = [ ];
              "3" = [ ];
              "4" = [ ];
              "5" = [ ];
            };
            "format-icons" = {
              "1" = "1";
              "2" = "2";
              "3" = "3";
              "4" = "4";
              "5" = "5";
              "6" = "6";
              "7" = "7";
              "8" = "8";
              "9" = "9";
              "10" = "10";
              "default" = "󰝥";
              "special" = "󰦥";
            };
          };

          "tray" = { spacing = 8; };

          "wlr/taskbar" = {
            "format" = " {icon} ";
            "icon-size" = 15;
            "all-outputs" = false;
            "tooltip-format" = "{title}";
            "on-click" = "activate";
            "on-click-middle" = "close";
            "ignore-list" = [ "wofi" "rofi" ];
          };

          "clock" = {
            tooltip-format = ''
              <big>{:%Y %B}</big>
              <tt><small>{calendar}</small></tt>'';
            format = " {:%H:%M}";
            format-alt = " {:%A, %B %d, %Y}";
          };

          "cpu" = {
            format = " {usage}%";
            tooltip = "false";
          };

          "temperature" = {
            format = " {temperatureC}°C";
            format-icons = [ "" "" "" ];
          };

          "memory" = { format = " {}%"; };

          "backlight" = {
            format = "{icon}{percent}%";
            format-icons = [ "󰃞 " "󰃟 " "󰃠 " ];
            on-scroll-up = "light -A 1";
            on-scroll-down = "light -U 1";
          };

          "battery" = {
            states = {
              warning = "30";
              critical = "15";
            };
            format = "{icon}{capacity}% {time}";
            tooltip-format = "{timeTo} {capacity}%";
            format-charging = "󱐋{capacity}%";
            format-plugged = " ";
            format-icons = [ "  " "  " "  " "  " "  " ];
          };

          "pulseaudio" = {
            format = "{icon}{volume}% {format_source}";
            format-bluetooth = "{icon} {volume}%";
            format-bluetooth-muted = "   {volume}%";
            format-source = "";
            format-source-muted = "";
            format-muted = " {volume}% {format_source}";
            format-icons = {
              headphone = " ";
              hands-free = " ";
              headset = " ";
              default = [ " " " " " " ];
            };
            tooltip-format = "{desc} {volume}%";
            on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
            on-click-right = "pactl set-source-mute @DEFAULT_SOURCE@ toggle";
            on-click-middle = "pavucontrol";
          };

          "custom/wmname" = {
            format = " ";
            tooltip = "false";
            on-click = "wallpaper";
            on-click-right = "screenshot";
            on-click-middle = "wallpaper-switch";
          };
        };
      };
      style = ./style.css;
    };
  };
}
