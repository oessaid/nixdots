{
  pkgs,
  config,
  ...
}: let
  fuzzy-zathura = pkgs.writeShellScriptBin "fuzzy-zathura" ''
    #!/bin/sh
    file=$(fd . ~/books --type f | fzf)
    [-n "$file"] && alacritty -e "zathura '$file' &"
  '';
in {
  home.packages = with pkgs; [
    fuzzy-zathura
  ];
}
