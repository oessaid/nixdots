{
  config,
  pkgs,
  ...
}: {
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        completion = {
          completeopt = "menu,menuone,noinsert";
        };
        sources = [
          {
            name = "nvim_lsp";
          }
          {
            name = "nvim_lsp_signature_help";
          }
          {
            name = "luasnip";
          }
          {
            name = "path";
          }
          {
            name = "buffer";
          }
          {
            name = "treesitter";
          }
        ];
      };
    };
    # cmp-buffer.enable = true;
    # cmp-fuzzy-buffer.enable = true;
    # cmp-fuzzy-path.enable = true;
    # cmp-cmdline.enable = true;
    # cmp-cmdline-history.enable = true;
    # cmp-git.enable = true;
    # cmp-greek.enable = true;
    # cmp-nvim-lsp.enable = true;
    # cmp-nvim-lsp-document-symbol.enable = true;
    # cmp-nvim-lsp-signature-help.enable = true;
    # cmp-nvim-lua.enable = true;
    # cmp-treesitter.enable = true;
    # cmp_luasnip.enable = true;
  };
}
