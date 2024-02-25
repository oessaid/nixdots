{
  config,
  pkgs,
  ...
}: {
  programs.nixvim = {
    plugins = {
      lsp.servers.nixd.enable = true;
      lsp.servers.cssls.enable = true;
      lsp.servers.jsonls.enable = true;
      lsp.servers.lua-ls.enable = true;
      lsp.servers.pylsp.enable = true;
      lsp.servers.rust-analyzer.enable = true;
      lsp.servers.rust-analyzer.installCargo = true;
      lsp.servers.rust-analyzer.installRustc = true;
      lsp.servers.tsserver.enable = false;
      lsp.servers.yamlls.enable = true;

      none-ls = {
        enable = true;
        enableLspFormat = true;
        sources = {
          formatting = {
            stylua.enable = true;
            prettier.enable = true;
            black.enable = true;
            alejandra.enable = true;
          };
        };
      };
    };
  };
}
