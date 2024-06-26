{ config, pkgs, ... }: {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      log = { enabled = false; };
      manager = {
        show_hidden = true;
        show_symlink = true;
        sort_by = "modified";
        sort_dir_first = true;
        sort_reverse = true;
      };
      opener = {
        open = [{
          run = ''
            xdg-open "$@"
          '';
          desc = "Open";
          orphan = true;
        }];
      };
    };
    theme = { };
  };

  home.packages = with pkgs;
    [
      # image display in terminal
      ueberzugpp
    ];
}
