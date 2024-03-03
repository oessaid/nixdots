{
  config,
  pkgs,
  ...
}: {
  programs.zathura = {
    enable = true;
    extraConfig = ''
      # zathurarc-dark

       set font "inconsolata 15"
       set default-bg "#000000" #00
       set default-fg "#F7F7F6" #01

       set statusbar-fg "#B0B0B0" #04
       set statusbar-bg "#202020" #01

       set inputbar-bg "#151515" #00 currently not used
       set inputbar-fg "#FFFFFF" #02

       set notification-error-bg "#AC4142" #08
       set notification-error-fg "#151515" #00

       set notification-warning-bg "#AC4142" #08
       set notification-warning-fg "#151515" #00

       set highlight-color "#F4BF75" #0A
       set highlight-active-color "#6A9FB5" #0D

       set completion-highlight-fg "#151515" #02
       set completion-highlight-bg "#90A959" #0C

       set completion-bg "#303030" #02
       set completion-fg "#E0E0E0" #0C

       set notification-bg "#90A959" #0B
       set notification-fg "#151515" #00

       set recolor "true"
       set recolor-lightcolor "#000000" #00
       set recolor-darkcolor "#E0E0E0" #06
       set recolor-reverse-video "true"
       set recolor-keephue "true"

       set render-loading "false"
       set scroll-step 50
    '';
  };
}
