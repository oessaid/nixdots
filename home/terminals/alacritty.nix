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
    };
  }; 
}
