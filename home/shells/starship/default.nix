{
  config,
  pkgs,
  ...
}: {
  programs.starship = {
    enable = true;
    # settings = {
    #   add_newline = true;
    #   aws.disabled = true;
    #   gcloud.disabled = true;
    #   line_break.disabled = true;
    # };

    # settings = pkgs.lib.importTOML ./gruvbox-rainbow.toml;
    settings = pkgs.lib.importTOML ./pure.toml;
  };
}
