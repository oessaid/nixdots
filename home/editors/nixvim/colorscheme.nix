{
  config,
  pkgs,
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
  programs.nixvim = {
    colorschemes = {
      base16 = {
        enable = true;
        # colorscheme = "gruvbox-material-dark-hard";
        colorscheme = "gruvbox-dark-hard";
      };
      # gruvbox = {
      #   enable = true;
      #   settings = {
      #     contrast = "hard";
      #     dim_inactive = false;
      #     invert_selection = false;
      #     invert_signs = false;
      #     invert_tabline = false;
      #     invert_intend_guides = false;
      #     inverse = false; # invert background for search, diffs, statuslines and errors
      #     italic = {
      #       strings = false;
      #       emphasis = false;
      #       comments = true;
      #       operators = false;
      #       folds = true;
      #     };
      #   };
      # };
    };
    extraPlugins = [
      # github-nvim-theme
    ];
    extraConfigLuaPost =
      /*
      lua
      */
      ''
        -- vim.cmd('colorscheme github_dark_high_contrast')
        -- vim.cmd('colorscheme github_dark_default')

        -- We're explicitly calling this here because it needs to be set
        -- after setup of the plugin. Otherwise config is ignored.
        -- vim.cmd('colorscheme gruvbox')
      '';
  };
}
