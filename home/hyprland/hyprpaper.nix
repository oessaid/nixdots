{ config, pkgs, lib, inputs, ... }:
with lib;
let cfg = config.wm.hyprland;
in {
  config = mkIf cfg.enable {
    xdg.configFile."hypr/hyprpaper.conf".text = ''
      # preload = ~/nixdots/home/wallpapers/mountain-3840x2160.jpeg
      # wallpaper = ,~/nixdots/home/wallpapers/mountain-3840x2160.jpeg

      # preload = ~/nixdots/home/wallpapers/nixos-everforest.jpg
      # wallpaper = ,~/nixdots/home/wallpapers/nixos-everforest.jpg

      # preload = ~/nixdots/home/wallpapers/generated-nixos.png
      # wallpaper = ,~/nixdots/home/wallpapers/generated-nixos.png

      # preload = ~/nixdots/home/wallpapers/akira-in-city-4k_1664120750.jpg
      # wallpaper = ,~/nixdots/home/wallpapers/akira-in-city-4k_1664120750.jpg

      preload = ~/nixdots/home/wallpapers/cozy-cartoon-wallpaper.png
      wallpaper = ,~/nixdots/home/wallpapers/cozy-cartoon-wallpaper.png

      # preload = ~/nixdots/home/wallpapers/circuit-board.png
      # wallpaper = ,~/nixdots/home/wallpapers/circuit-board.png

      # preload = ~/nixdots/home/wallpapers/not-so-gruv-city.jpg
      # wallpaper = ,~/nixdots/home/wallpapers/not-so-gruv-city.jpg

      # preload = ~/nixdots/home/wallpapers/sushi.jpg
      # wallpaper = ,~/nixdots/home/wallpapers/sushi.jpg

      # preload = ~/nixdots/home/wallpapers/moving-castle.jpg
      # wallpaper = ,~/nixdots/home/wallpapers/moving-castle.jpg

      # preload = ~/nixdots/home/wallpapers/spirited-away.png
      # wallpaper = ,~/nixdots/home/wallpapers/spirited-away.png

      # preload = ~/nixdots/home/wallpapers/ponyo-on-the-cliff-by-the-sea-25.jpg
      # wallpaper = ,~/nixdots/home/wallpapers/ponyo-on-the-cliff-by-the-sea-25.jpg

      # preload = ~/nixdots/home/wallpapers/howls-moving-castle-49.jpg
      # wallpaper = ,~/nixdots/home/wallpapers/howls-moving-castle-49.jpg

      # preload = ~/nixdots/home/wallpapers/the-wind-rises-19.jpg
      # wallpaper = ,~/nixdots/home/wallpapers/the-wind-rises-19.jpg
    '';

    systemd.user.services.hyprpaper = {
      Unit = {
        Description = "Hyprland wallpaper daemon";
        PartOf = [ "graphical-session.target" ];
      };
      Service = {
        ExecStart =
          "${lib.getExe inputs.hyprpaper.packages.${pkgs.system}.default}";
        Restart = "on-failure";
      };
      Install.WantedBy = [ "graphical-session.target" ];
    };
  };
}
