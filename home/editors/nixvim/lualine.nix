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
      extensions = ["fzf" "toggleterm" "fugitive"];
    };
    extraPlugins = with pkgs.vimPlugins; [
      lualine-lsp-progress
    ];
  };
}
