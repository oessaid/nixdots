{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: let
  github-nvim-theme = pkgs.vimUtils.buildVimPlugin {
    name = "";
    src = pkgs.fetchFromGitHub {
      owner = "projekt0n";
      repo = "github-nvim-theme";
      rev = "d92e1143e5aaa0d7df28a26dd8ee2102df2cadd8";
      hash = "sha256-FO4mwRY2qjutjVTiW0wN5KVhuoBZmycfOwMFInaTnNo=";
    };
  };
in {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./lsp.nix
    ./lsp-servers.nix
    ./keymaps.nix
    ./lualine.nix
    ./tree.nix
    ./git.nix
    ./telescope.nix
  ];

  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";
    clipboard.providers.xclip.enable = true;
    # colorschemes = {
    #   base16 = {
    #     enable = true;
    #     colorscheme = "gruvbox-material-dark-hard";
    #   };
    # };
    options = {
      number = true;
      relativenumber = true;
    };
    plugins = {
      nix.enable = true;
      luasnip.enable = true;
      comment-nvim.enable = true;
      notify.enable = true;
      todo-comments.enable = true;
      treesitter = {
        enable = true;
        nixGrammars = true;
        folding = true;
      };
    };
    extraPlugins = [
      github-nvim-theme
    ];
    extraConfigLua =
      /*
      lua
      */
      ''
        -- vim.cmd('colorscheme github_dark_high_contrast')
        vim.cmd('colorscheme github_dark_default')
      '';
  };
}
