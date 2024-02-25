{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./lsp.nix
    ./lsp-servers.nix
    ./keymaps.nix
    ./lualine.nix
    ./tree.nix
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
      nix.enable = true;
      luasnip.enable = true;
      rust-tools.enable = true;
      telescope = {
        enable = true;
        keymapsSilent = true;
        keymaps = {
        };
        extensions = {
          file_browser.enable = true;
          fzf-native.enable = true;
          ui-select.enable = true;
        };
      };
      treesitter = {
        enable = true;
        nixGrammars = true;
        folding = true;
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
    ];
    extraConfigLua = ''
    '';
  };
}
