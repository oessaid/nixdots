{ config, pkgs, ... }: {
  programs.zathura = {
    enable = true;
    extraConfig = ''
      set adjust-open "best-fit"

      map j feedkeys "<C-Down>"
      map k feedkeys "<C-Up>"

      set selection-clipboard clipboard

      # # zathura-gruvbox-dark-hard
      # set notification-error-bg       "#1d2021" # bg
      # set notification-error-fg       "#fb4934" # bright:red
      # set notification-warning-bg     "#1d2021" # bg
      # set notification-warning-fg     "#fabd2f" # bright:yellow
      # set notification-bg             "#1d2021" # bg
      # set notification-fg             "#b8bb26" # bright:green
      #
      # set completion-bg               "#504945" # bg2
      # set completion-fg               "#ebdbb2" # fg
      # set completion-group-bg         "#3c3836" # bg1
      # set completion-group-fg         "#928374" # gray
      # set completion-highlight-bg     "#83a598" # bright:blue
      # set completion-highlight-fg     "#504945" # bg2
      #
      # # Define the color in index mode
      # set index-bg                    "#504945" # bg2
      # set index-fg                    "#ebdbb2" # fg
      # set index-active-bg             "#83a598" # bright:blue
      # set index-active-fg             "#504945" # bg2
      #
      # set inputbar-bg                 "#1d2021" # bg
      # set inputbar-fg                 "#ebdbb2" # fg
      #
      # set statusbar-bg                "#504945" # bg2
      # set statusbar-fg                "#ebdbb2" # fg
      #
      # set highlight-color             "#fabd2f" # bright:yellow
      # set highlight-active-color      "#fe8019" # bright:orange
      #
      # set default-bg                  "#1d2021" # bg
      # set default-fg                  "#ebdbb2" # fg
      # set render-loading              true
      # set render-loading-bg           "#1d2021" # bg
      # set render-loading-fg           "#ebdbb2" # fg
      #
      # # Recolor book content's color
      # set recolor-lightcolor          "#1d2021" # bg
      # set recolor-darkcolor           "#ebdbb2" # fg
      # set recolor                     "true"
      # set recolor-keephue             true      # keep original color

      # Zathura oxocarbon
      set notification-error-bg       "#161616"
      set notification-error-fg       "#ee5396"
      set notification-warning-bg     "#161616"
      set notification-warning-fg     "#ffe97b"
      set notification-bg             "#161616"
      set notification-fg             "#dde1e6"

      set completion-bg               "#161616"
      set completion-fg               "#dde1e6"
      set completion-group-bg         "#262626"
      set completion-group-fg         "#dde1e6"
      set completion-highlight-bg     "#33b1ff"
      set completion-highlight-fg     "#262626"

      set index-bg                    "#161616"
      set index-fg                    "#3ddbd9"
      set index-active-bg             "#3ddbd9"
      set index-active-fg             "#161616"

      set inputbar-bg                 "#161616"
      set inputbar-fg                 "#ffffff"

      set statusbar-bg                "#161616"
      set statusbar-fg                "#ffffff"

      set highlight-color             "#ffe97b"
      set highlight-active-color      "#ee5396"

      set default-bg                  "#161616"
      set default-fg                  "#dde1e6"
      set render-loading              "true"
      set render-loading-bg           "#161616"
      set render-loading-fg           "#393939"

      set recolor-lightcolor          "#161616"
      set recolor-darkcolor           "#ffffff"
      set recolor                     "true"
      set recolor-keephue             "true"
    '';
  };
}
