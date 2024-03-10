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
        window = {
          completion = {
            border = "rounded";
            scrollbar = false;
            # winhighlight = "Normal:NormalFloat,Search:None,CursorLine:Visual";
            col_offset = -3;
            side_padding = 0;
          };
          documentation = {
            border = "rounded";
            scrollbar = false;
            # winhighlight = "Normal:NormalFloat,Search:None";
          };
        };
        snippet.expand =
          /*
          lua
          */
          ''
            function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          '';
        sources = [
          {name = "nvim_lsp";}
          {name = "nvim_lsp_signature_help";}
          {name = "luasnip";}
          {name = "path";}
          {name = "buffer";}
          {name = "treesitter";}
          {name = "nvim_lua";}
          {name = "calc";}
          {name = "treesitter";}
          {name = "crates";}
          {name = "spell";}
        ];
        mapping = {
          "<Down>" = "cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { 'i', 'c' })";
          "<Up>" = "cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { 'i', 'c' })";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }), { 'i', 'c' })";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }), { 'i','c' })";
          "<C-k>" = "cmp.mapping.scroll_docs(-4)";
          "<C-j>" = "cmp.mapping.scroll_docs(4)";
          "<CR>" = "cmp.mapping(cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace,select = true,}), { 'i' })";
          "<Right>" = "cmp.mapping(cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace,select = true,}), { 'c' })";
        };
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
