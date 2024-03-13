{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
with lib; let
  cfg = config.wm.hyprland;
in {
  config = mkIf cfg.enable {
    xdg.configFile."hypr/hyprpaper.conf".text = ''
      # preload = ~/nixdots/home/wallpapers/mountain-3840x2160.jpeg
      # wallpaper = ,~/nixdots/home/wallpapers/mountain-3840x2160.jpeg
      # preload = ~/nixdots/home/wallpapers/nixos-everforest.jpg
      # wallpaper = ,~/nixdots/home/wallpapers/nixos-everforest.jpg
      preload = ~/nixdots/home/wallpapers/generated-nixos.png
      wallpaper = ,~/nixdots/home/wallpapers/generated-nixos.png
    '';

    systemd.user.services.hyprpaper = {
      Unit = {
        Description = "Hyprland wallpaper daemon";
        PartOf = ["graphical-session.target"];
      };
      Service = {
        ExecStart = "${lib.getExe inputs.hyprpaper.packages.${pkgs.system}.default}";
        Restart = "on-failure";
      };
      Install.WantedBy = ["graphical-session.target"];
    };
  };
}
