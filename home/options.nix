{ lib, ... }: {
  options = {
    wm = { hyprland = { enable = lib.mkEnableOption "enable hyprland"; }; };
    utilities = { waybar = { enable = lib.mkEnableOption "enable waybar"; }; };
    nixGLPrefixIntel = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = ''
        Will be prepended to commands which require working OpenGL.

        This needs to be set to the right nixGL package on non-NixOS systems.
      '';
    };
    nixGLPrefixNvidia = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = ''
        Will be prepended to commands which require working OpenGL.

        This needs to be set to the right nixGL package on non-NixOS systems.
      '';
    };
  };
}
