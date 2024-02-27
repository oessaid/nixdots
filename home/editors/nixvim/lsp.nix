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
      lsp-lines = {
        enable = true;
        currentLine = true;
      };

      lspkind.enable = true;
      lspsaga.enable = true;

      rust-tools.enable = true;
      crates-nvim.enable = true;
      clangd-extensions.enable = true;
      fidget.enable = true;
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>?";
        action = "<cmd>lua require('lsp_lines').toggle<cr>";
      }
    ];
  };
}
