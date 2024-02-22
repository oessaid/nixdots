{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";
    clipboard.providers.xclip.enable = true;
    colorschemes = {
      base16 = {
        enable = true;
        colorscheme = "gruvbox-material-dark-hard";
      };
    };
    options = {
      number = true;
      relativenumber = true;
    };
    plugins = {
    };
    extraPlugins = with pkgs.vimPlugins; [
    ];
    extraConfigLua = ''
    '';
  };
}
