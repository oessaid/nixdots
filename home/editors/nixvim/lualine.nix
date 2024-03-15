{
  config,
  pkgs,
  ...
}: {
  programs.nixvim = {
    plugins.lualine = {
      enable = true;
      iconsEnabled = true;
      sectionSeparators = {
        left = "";
        right = "";
      };
      componentSeparators = {
        left = "|";
        right = "|";
      };
      sections = {
        lualine_a = ["mode"];
        lualine_b = [
          {
            name = "filename";
            extraConfig = {
              file_status = true;
              path = 1;
            };
          }
        ];
        lualine_c = [
          {
            name = "diff";
            extraConfig = {
              symbols = {
                added = " ";
                modified = " ";
                removed = "✖ ";
              };
            };
          }
          {
            name = "diagnostics";
            extraConfig = {
              sources = ["nvim_diagnostic"];
              symbols = {
                error = " ";
                warn = " ";
                info = " ";
                hint = " ";
              };
            };
          }
        ];
        lualine_x = [
          "filetype"
        ];
      };
      inactiveSections = {
        lualine_a = [];
        lualine_b = [];
        lualine_c = [
          {
            name = "filename";
            extraConfig = {
              path = 1;
            };
          }
        ];
        lualine_x = ["location"];
        lualine_y = [];
        lualine_z = [];
      };
      tabline = {
        lualine_a = [
          {
            name.__raw =
              # lua
              ''
                function()
                  return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
                end
              '';
            icon = "";
          }
        ];
        lualine_b = [
          {
            name = "tabs";
            extraConfig = {
              mode = 0;
              separator = "nil";
              padding = 1;
            };
          }
        ];
      };
      # winbar = {
      #   lualine_b = [
      #     {
      #       name = "filename";
      #       extraConfig = {
      #         path = 2;
      #       };
      #     }
      #   ];
      # };
      extensions = ["fzf" "toggleterm" "fugitive"];
    };
    extraPlugins = with pkgs.vimPlugins; [
      lualine-lsp-progress
    ];
  };
}
