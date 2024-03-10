{
  pkgs,
  config,
  ...
}: let
  fuzzy-zathura = pkgs.writeShellScriptBin "fuzzy-zathura" ''
    #!/bin/sh
    book=$(fd . ~/books --type f | fzf)
    [ -n "$book" ] && zathura "$book"
  '';
in {
  home.packages = with pkgs; [
    fuzzy-zathura
  ];
}
