{ pkgs, ... }:
let
  font = "JetBrainsMono Nerd Font";
in
{
   programs.alacritty = {
    enable = true;
    # package = pkgs-stable.alacritty;
    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      scrolling.history = 10000;
      font = {
        size = 12.0;
	normal.family = font;
	bold.family = font;
	italic.family = font;
      };
      window = {
        dynamic_padding = true;
        padding = {
	  x = 2;
	  y = 2;
	};
      };
      #scrolling.multiplier = 5;
      #selection.save_to_clipboard = true;
      colors = { # gruvbox material dark hard
        primary = {
          background = "0x1d2021";
          foreground = "0xd4be98";
	};
        normal = {
          black =   "0x32302f";
          red =     "0xea6962";
          green =   "0xa9b665";
          yellow =  "0xd8a657";
          blue =    "0x7daea3";
          magenta = "0xd3869b";
          cyan =    "0x89b482";
          white =   "0xd4be98";
	};
        bright = {
          black =   "0x32302f";
          red =     "0xea6962";
          green =   "0xa9b665";
          yellow =  "0xd8a657";
          blue =    "0x7daea3";
          magenta = "0xd3869b";
          cyan =    "0x89b482";
          white =   "0xd4be98";
	};
      };
    };
  }; 
}
