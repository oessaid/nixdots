{
  config,
  pkgs,
  ...
}: {
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
    };
    lsp-format = {
      enable = true;
      lspServersToEnable = "all";
    };
    lsp-lines = {
      enable = true;
      currentLine = false;
    };
    lspsaga = {
      enable = true;
    };
  };
}
