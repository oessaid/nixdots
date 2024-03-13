{lib, ...}: {
  options.wm = {
    hyprland = {
      enable = lib.mkEnableOption "enable hyprland";
    };
  };
}
