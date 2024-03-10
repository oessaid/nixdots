{
  config,
  pkgs,
  ...
}: let
  nvim-colorizer = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-colorizer";
    src = pkgs.fetchFromGitHub {
      owner = "NvChad";
      repo = "nvim-colorizer.lua";
      rev = "85855b38011114929f4058efc97af1059ab3e41d";
      hash = "sha256-oKvFN2K+ASlPNwj2rhptR/ErYgo6XKBPhXSZotDdCP0=";
    };
  };
in {
  programs.nixvim = {
    extraPlugins = [
      nvim-colorizer
    ];
    extraConfigLuaPost =
      /*
      lua
      */
      ''
        require 'colorizer'.setup()
      '';
  };
}
