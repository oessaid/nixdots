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
        followCurrentFile.enabled = true;
        filteredItems = {
          hideHidden = false;
          hideDotfiles = false;
          forceVisibleInEmptyFolder = true;
          hideGitignored = false;
        };
      };
      defaultComponentConfigs = {
        diagnostics = {
          symbols = {
            hint = "";
            info = "";
            warn = "";
            error = "";
          };
          highlights = {
            hint = "DiagnosticSignHint";
            info = "DiagnosticSignInfo";
            warn = "DiagnosticSignWarn";
            error = "DiagnosticSignError";
          };
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
