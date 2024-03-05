{
  config,
  pkgs,
  ...
}: {
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
      };
      lsp-format = {
        enable = true;
        lspServersToEnable = "all";
      };

      lspkind.enable = true;
      lspsaga.enable = true;

      trouble = {
        enable = true;
        extraOptions = {
          signs = {
            error = "";
            warning = "";
            hint = "";
            information = "";
            other = "";
          };
        };
      };

      rust-tools.enable = true;
      crates-nvim.enable = true;
      clangd-extensions.enable = true;
      fidget.enable = true;
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>s?";
        action = ":TroubleToggle document_diagnostics<CR>";
      }
    ];
  };
}
