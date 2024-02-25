{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./lsp.nix
    ./lsp-servers.nix
    ./keymaps.nix
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

      neo-tree = {
        enable = true;
        autoCleanAfterSessionRestore = true;
        closeIfLastWindow = true;
        window.position = "left";
        filesystem = {
          followCurrentFile.enabled = false;
          filteredItems = {
            hideHidden = false;
            hideDotfiles = false;
            forceVisibleInEmptyFolder = true;
            hideGitignored = false;
          };
        };
      };

    };
    extraPlugins = with pkgs.vimPlugins; [
      lualine-nvim
      lualine-lsp-progress
    ];
    extraConfigLua = ''
    '';
  };
}
