{ pkgs, config, lib, ... }:
let
  # nixGL = import ../nixGLNvidia.nix { inherit pkgs config; };
  nixGL = import ../nixGL.nix { inherit pkgs config; };
  font = "JetBrainsMono Nerd Font"; # size 11
  # font = "ProggyClean Nerd Font"; # size 15
in {
  programs.alacritty = {
    enable = true;
    package = nixGL pkgs.alacritty;
    settings = {
      # env.TERM = "xterm-256color";
      scrolling.history = 10000;
      shell = { program = "zsh"; };
      font = {
        # size = 15.0;
        size = 12.0;
        normal = {
          family = font;
          style = "Regular";
        };
        # bold = {
        #   family = font;
        #   style = "Regular";
        # };
        # italic = {
        #   family = font;
        #   style = "Regular";
        # };
        bold.family = font;
        italic.family = font;
      };
      window = {
        decorations = "none";
        dynamic_padding = true;
        padding = {
          x = 2;
          y = 2;
        };
      };
      #scrolling.multiplier = 5;
      #selection.save_to_clipboard = true;
      colors = {
        draw_bold_text_with_bright_colors = false;

        # gruvbox material dark hard
        # primary = {
        #   background = "0x1d2021";
        #   foreground = "0xd4be98";
        # };
        # cursor = {
        #   text = "0x1d2021";
        #   cursor = "0xd5c4a1";
        # };
        # normal = {
        #   black = "0x32302f";
        #   red = "0xea6962";
        #   green = "0xa9b665";
        #   yellow = "0xd8a657";
        #   blue = "0x7daea3";
        #   magenta = "0xd3869b";
        #   cyan = "0x89b482";
        #   white = "0xd4be98";
        # };
        # bright = {
        #   black = "0x32302f";
        #   red = "0xea6962";
        #   green = "0xa9b665";
        #   yellow = "0xd8a657";
        #   blue = "0x7daea3";
        #   magenta = "0xd3869b";
        #   cyan = "0x89b482";
        #   white = "0xd4be98";
        # };

        # gruvbox dark hard
        primary = {
          background = "0x1d2021";
          foreground = "0xd5c4a1";
        };
        cursor = {
          text = "0x1d2021";
          cursor = "0xd5c4a1";
        };
        normal = {
          black = "0x1d2021";
          red = "0xfb4934";
          green = "0xb8bb26";
          yellow = "0xfabd2f";
          blue = "0x83a598";
          magenta = "0xd3869b";
          cyan = "0x8ec07c";
          white = "0xd5c4a1";
        };
        bright = {
          black = "0x665c54";
          red = "0xfb4934";
          green = "0xb8bb26";
          yellow = "0xfabd2f";
          blue = "0x83a598";
          magenta = "0xd3869b";
          cyan = "0x8ec07c";
          white = "0xfbf1c7";
        };

        # github dark high contrast
        # primary = {
        #   background = "#0a0c10";
        #   foreground = "#f0f3f6";
        # };
        # cursor = {
        #   text = "#0a0c10";
        #   cursor = "#f0f3f6";
        # };
        # normal = {
        #   black = "#7a828e";
        #   red = "#ff9492";
        #   green = "#26cd4d";
        #   yellow = "#f0b72f";
        #   blue = "#71b7ff";
        #   magenta = "#cb9eff";
        #   cyan = "#39c5cf";
        #   white = "#d9dee3";
        # };
        # bright = {
        #   black = "#9ea7b3";
        #   red = "#ffb1af";
        #   green = "#4ae168";
        #   yellow = "#f7c843";
        #   blue = "#91cbff";
        #   magenta = "#cb9eff";
        #   cyan = "#39c5cf";
        #   white = "#d9dee3";
        # };
      };
    };
  };
}
