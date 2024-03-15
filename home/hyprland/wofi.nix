{ config, pkgs, lib, ... }:
with lib;
let cfg = config.wm.hyprland;
in {
  config = mkIf cfg.enable {
    programs.wofi = {
      enable = true;
      style = ''
        * {
          font-family: "JetBrainsMono Nerd Font", "Symbols Nerd Font", monospace;
          font-size: 16px;
        }

        window {
        margin: 0px;
        border: none;
        border-radius: 10px;
        background-color: #00060A;
        }

        #input {
        margin: 5px;
        border: none;
        color: #f2f4f8;
        background-color: #00060A;
        }

        #inner-box {
        margin: 5px;
        border: none;
        background-color: #00060A;
        }

        #outer-box {
        margin: 5px;
        border: none;
        background-color: #00060A;
        }

        #scroll {
        margin: 0px;
        border: none;
        }

        #text {
        margin: 5px;
        border: none;
        color: #f2f4f8;
        }

        #entry:selected {
        background-color: #33b1ff;
        }
      '';
      settings = {
        width = 600;
        height = 500;
        location = "center";
        show = "drun";
        prompt = "Apps";
        filter_rate = 100;
        allow_markup = true;
        no_actions = true;
        halign = "fill";
        orientation = "vertical";
        content_halignr = "fill";
        insensitive = true;
        allow_images = true;
        image_size = 20;
        gtk_dark = true;
        layer = "overlay";
      };
    };
  };
}
