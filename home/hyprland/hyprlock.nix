{ config, pkgs, ... }:
let nixGL = import ../nixGL.nix { inherit pkgs config; };
in {
  home.packages = with pkgs; [ pamtester ];

  # programs.hyprlock = {
  #   enable = true;
  #   # package = nixGL pkgs.hyprlock;
  #   backgrounds = [
  #     {
  #       path = "~/nixdots/home/wallpapers/generated-nixos.png";
  #     }
  #   ];
  #   input-fields = [
  #     {
  #       monitor = "";
  #
  #       size = {
  #         width = 300;
  #         height = 50;
  #       };
  #
  #       outline_thickness = 0;
  #       inner_color = "rgb(458588)";
  #       font_color = "rgb(282828)";
  #
  #       fade_on_empty = false;
  #       placeholder_text = ''Password:'';
  #
  #       dots_spacing = 0.3;
  #       dots_center = true;
  #
  #       position = {
  #         x = 0;
  #         y = -440;
  #       };
  #     }
  #   ];
  #
  #   labels = [
  #     {
  #       monitor = "";
  #       text = "$TIME";
  #       font_size = 50;
  #       color = "rgb(83a598)";
  #
  #       position = {
  #         x = 0;
  #         y = 440;
  #       };
  #
  #       valign = "center";
  #       halign = "center";
  #     }
  #   ];
  # };

  # programs.swaylock = {
  #   enable = true;
  #   settings = {
  #     color = "808080";
  #     font-size = 24;
  #     indicator-idle-visible = false;
  #     indicator-radius = 100;
  #     line-color = "ffffff";
  #     show-failed-attempts = true;
  #   };
  # };
}
