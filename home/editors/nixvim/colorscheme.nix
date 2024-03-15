{ config, pkgs, lib, ... }:
let
  github-nvim-theme = pkgs.vimUtils.buildVimPlugin {
    name = "github-nvim-theme";
    src = pkgs.fetchFromGitHub {
      owner = "projekt0n";
      repo = "github-nvim-theme";
      rev = "d92e1143e5aaa0d7df28a26dd8ee2102df2cadd8";
      hash = "sha256-FO4mwRY2qjutjVTiW0wN5KVhuoBZmycfOwMFInaTnNo=";
    };
  };
  nightfox-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "nightfox-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "EdenEast";
      repo = "nightfox.nvim";
      rev = "v3.9.3";
      hash = "sha256-Nkobz9wA2wgWFHqRu5RdEcA5YldjGO1/pR675bZyTUQ=";
    };
  };
in {
  programs.nixvim = {
    colorschemes = {
      ayu = { enable = false; };
      onedark = {
        enable = false;
        settings = {
          style = "darker";
          cmp_itemkind_reverse = true;
          code_style = {
            comments = "italic";
            keywords = "bold,italic";
            functions = "bold";
            strings = "none";
            variables = "none";
          };
        };
      };
      vscode = {
        enable = false;
        settings = {
          italic_comments = true;
          group_overrides = { Normal = { bg = "#0E1011"; }; };
        };
      };
      poimandres = {
        enable = false;
        settings = {
          bold_vert_split = true;
          dim_nc_background = true;
          disable_background = false;
          disable_float_background = false;
          disable_italics = true;
        };
      };
      oxocarbon = { enable = false; };
      base16 = {
        enable = false;
        # colorscheme = "gruvbox-material-dark-hard";
        colorscheme = "gruvbox-dark-hard";
      };
      gruvbox = {
        enable = false;
        settings = {
          contrast = "hard";
          dim_inactive = false;
          invert_selection = true;
          invert_signs = false;
          invert_tabline = false;
          invert_intend_guides = false;
          inverse =
            false; # invert background for search, diffs, statuslines and errors
          italic = {
            strings = false;
            emphasis = false;
            comments = true;
            operators = false;
            folds = true;
          };
          overrides = {
            Normal = { bg = "#000000"; };
            # Normal = { bg = "#0E1011"; };
            SignColumn = { link = "LineNr"; };
          };
        };
      };
      catppuccin = {
        enable = false;
        settings = {
          flavour = "mocha";
          color_overrides = {
            mocha = {
              base = "#000000";
              mantle = "#000000";
              crust = "#000000";
            };
          };
        };
      };
    };
    extraPlugins = [
      github-nvim-theme
      # nightfox-nvim
    ];
    extraConfigLuaPost =
      # lua
      ''
        require('github-theme').setup({
          options = {
            transparent = true;
            dim_inactive = false;
            inverse = { 
              match_paren = false,
              visual = true,
              search = false,
            },
            darken = {
              floats = true,
            },
            styles = {
              comments = 'italic',
              keywords = 'bold',
              types = 'italic,bold',
            },
          }
        })
        -- vim.cmd('colorscheme github_dark_dimmed')
        -- vim.cmd('colorscheme github_dark_high_contrast')
        -- vim.cmd('colorscheme github_dark')
        vim.cmd('colorscheme github_dark_default')

        -- We're explicitly calling this here because it needs to be set
        -- after setup of the plugin. Otherwise config is ignored.
        -- vim.cmd('colorscheme gruvbox')
        -- vim.cmd('colorscheme poimandres')

        -- For oxocarbon
        -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        -- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        -- vim.api.nvim_set_hl(0, "SignColumn", { link = "LineNr" })

        -- Nightfox
        -- require('nightfox').setup({
        --  options = {
        --    transparent = true;
        --    styles = {
        --      comments = "italic",
        --      keywords = "bold",
        --      types = "italic,bold",
        --      functions = "bold",
        --    },
        --    inverse = {
        --      match_paren = false,
        --      visual = true,
        --      search = false,
        --    },
        --  }
        -- })
        -- vim.cmd("colorscheme carbonfox")
      '';
  };
}
