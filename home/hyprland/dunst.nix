{ config, pkgs, lib, ... }:
with lib;
let cfg = config.wm.hyprland;
in {
  config = mkIf cfg.enable {
    # home.packages = with pkgs; [ dunst ];
    # home.file.".config/dunst/dunstrc".text = ''
    #   [global]
    #   format = "<b>%s</b>\n%b"
    #
    #   icon_path = "~/.local/share/icons/"
    #   icon_theme = Gruvbox-Plus-Dark
    #   max_icon_size = 64
    #   enable_recursive_icon_lookup = true
    #
    #   origin = top-right
    #   offset = 22x22
    #   frame_width = 2
    #   frame_color = "#b4befe"
    #   separator_color= frame
    #   font = "JetBrainsMono NerdFont 12";
    #   corner_radius = 7
    #   background = "#11111B"
    #   foreground = "#ffffff"
    # '';

    services.dunst = {
      enable = true;
      settings = {
        global = {
          font = "JetBrainsMono NerdFont 12";
          # font = "ProggyClean Nerd Font Propo 15";
          allow_markup = "yes";
          format = ''
            <b>%s</b>
            %b'';

          icon_path = "~/.local/share/icons/";
          icon_theme = "Gruvbox-Plus-Dark";
          max_icon_size = 64;
          enable_recursive_icon_lookup = true;
          corner_radius = 7;

          sort = "yes";
          indicate_hidden = "yes";
          alignment = "left";
          bounce_freq = 0;
          show_age_threshold = 60;
          word_wrap = "yes";
          ignore_newline = "no";
          geometry = "200x5-6+30";
          transparency = 5;
          idle_threshold = 120;
          monitor = 0;
          follow = "mouse";
          sticky_history = "no";
          line_height = 0;
          separator_height = 2;
          padding = 8;
          horizontal_padding = 8;
          separator_color = "#585858";
          frame_color = "#0E1011";
          frame_width = 1;
          startup_notification = "false";
        };
        # frame = {
        #   width = 1;
        #   color = "#0E1011";
        # };
        shortcuts = {
          # Only on X11
          # close = "ctrl+space";
          # close_all = "ctrl+shift+space";
          # history = "ctrl+grave";
          # context = "ctrl+shift+period";
        };
        urgency_low = {
          background = "#161616cc";
          foreground = "#dde1e6";
          timeout = 5;
        };
        urgency_normal = {
          background = "#161616cc";
          foreground = "#dde1e6";
          timeout = 20;
        };
        urgency_critical = {
          background = "#161616cc";
          foreground = "#dde1e6";
          timeout = 0;
        };
      };
    };
  };
}
