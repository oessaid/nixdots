{
  pkgs,
  config,
  ...
}: {
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;
      autoCleanAfterSessionRestore = true;
      closeIfLastWindow = true;
      window.position = "left";
      filesystem = {
        followCurrentFile.enabled = false;
        filteredItems = {
          hideHidden = false;
          hideDotfiles = false;
          forceVisibleInEmptyFolder = true;
          hideGitignored = false;
        };
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = ":Neotree<CR>";
      }
    ];
  };
}
