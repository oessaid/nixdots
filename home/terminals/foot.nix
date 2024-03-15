{ pkgs, config, lib, ... }:
with lib;
let
  cfg = config.wm.hyprland;
  # font = "ProggyClean Nerd Font"; # size 15
  font = "JetBrainsMono Nerd Font:size=12";
in {
  config = mkIf cfg.enable {
    programs.foot = {
      enable = true;
      server.enable = false;
      settings = {
        main = {
          shell = "zsh";
          term = "xterm-256color";
          font = font;
          # dpi-aware = "yes";
        };

        mouse = { hide-when-typing = "yes"; };
        csd = { preferred = "none"; };

        # Gruvbox
        # colors = {
        #   background = "000000"; # pure black
        #   # background = "282828"; # dark
        #   # background = "1d2021"; # dark hard
        #   # background = "0E1011"; # custom
        #   foreground = "ebdbb2";
        #   regular0 = "282828";
        #   regular1 = "cc241d";
        #   regular2 = "98971a";
        #   regular3 = "d79921";
        #   regular4 = "458588";
        #   regular5 = "b16286";
        #   regular6 = "689d6a";
        #   regular7 = "a89984";
        #   bright0 = "928374";
        #   bright1 = "fb4934";
        #   bright2 = "b8bb26";
        #   bright3 = "fabd2f";
        #   bright4 = "83a598";
        #   bright5 = "d3869b";
        #   bright6 = "8ec07c";
        #   bright7 = "ebdbb2";
        # };

        # vscode
        # colors = {
        #   alpha = 1.0;
        #   foreground = "d4d4d4";
        #   background = "1e1e1e";
        #
        #   ## Normal/regular colors (color palette 0-7);
        #   regular0 = "1e1e1e"; # black;
        #   regular1 = "f44747"; # red;
        #   regular2 = "607b4e"; # green;
        #   regular3 = "dcdcaa"; # yellow;
        #   regular4 = "569cd6"; # blue;
        #   regular5 = "c678dd"; # magenta;
        #   regular6 = "56b6c2"; # cyan;
        #   regular7 = "d4d4d4"; # white;
        #
        #   ## Bright colors (color palette 8-15);
        #   bright0 = "808080"; # bright black;
        #   bright1 = "f44747"; # bright red;
        #   bright2 = "607b4e"; # bright green;
        #   bright3 = "dcdcaa"; # bright yellow;
        #   bright4 = "569cd6"; # bright blue;
        #   bright5 = "c678dd"; # bright magenta;
        #   bright6 = "56b6c2"; # bright cyan;
        #   bright7 = "d4d4d4"; # bright white;
        # };

        # Github dark high contrast
        colors = {
          background = "000000"; # pure black
          # background = "0a0c10";
          foreground = "f0f3f6";
          regular0 = "7a828e";
          regular1 = "ff9492";
          regular2 = "26cd4d";
          regular3 = "f0b72f";
          regular4 = "71b7ff";
          regular5 = "cb9eff";
          regular6 = "39c5cf";
          regular7 = "d9dee3";
          bright0 = "9ea7b3";
          bright1 = "ffb1af";
          bright2 = "4ae168";
          bright3 = "f7c843";
          bright4 = "91cbff";
          bright5 = "dbb7ff";
          bright6 = "56d4dd";
          bright7 = "ffffff";
        };

        # Oxocarbon
        # colors = {
        #   background = "000000"; # pure black
        #   # background="161616";
        #   foreground = "f2f4f8";
        #   regular0 = "161616"; # black
        #   regular1 = "3ddbd9"; # red
        #   regular2 = "33b1ff"; # green
        #   regular3 = "ee5396"; # yellow
        #   regular4 = "42be65"; # blue
        #   regular5 = "be95ff"; # magenta
        #   regular6 = "ff7eb6"; # cyan
        #   regular7 = "f2f4f8"; # white
        #   bright0 = "525252"; # bright black
        #   bright1 = "3ddbd9"; # bright red
        #   bright2 = "33b1ff"; # bright green
        #   bright3 = "ee5396"; # bright yellow
        #   bright4 = "42be65"; # bright blue
        #   bright5 = "be95ff"; # bright magenta
        #   bright6 = "ff7eb6"; # bright cyan
        #   bright7 = "08bdba"; # bright white
        # };
      };
    };
  };
}
