{ config, pkgs, ... }: {
  programs.nixvim = {
    plugins = {
      lsp = { enable = true; };
      lsp-format = {
        enable = true;
        lspServersToEnable = "all";
      };

      lspkind.enable = true;
      lspsaga = {
        enable = true;
        lightbulb.virtualText = false;
        ui = { codeAction = ""; };
        definition = {
          keys = {
            edit = "<CR>";
            vsplit = "v";
            split = "h";
            tabe = "t";
            quit = "q";
            # close = "k";
          };
        };
      };

      trouble = {
        enable = true;
        settings = {
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
        key = "<leader><leader>";
        # action = "<cmd>lua vim.lsp.buf.hover()<CR>";
        action = ":Lspsaga hover_doc<CR>";
      }
      {
        mode = "n";
        key = "<leader>ss";
        action = ":Lspsaga outline<cr>";
      }
      {
        mode = "n";
        key = "<leader>s?";
        action = ":TroubleToggle document_diagnostics<CR>";
      }
      {
        mode = "n";
        key = "<leader>?";
        action =
          "<cmd> lua vim.diagnostic.open_float(nil, {focusable=false, source='always', border='rounded'})<cr>";
      }
      {
        mode = "n";
        key = "<leader>sj";
        action = "<cmd>lua vim.diagnostic.goto_next()<cr>";
      }
      {
        mode = "n";
        key = "<leader>sk";
        action = "<cmd>lua vim.diagnostic.goto_prev()<cr>";
      }
      # buf_set_keymap('n', '<leader>ss', ':SymbolsOutline<cr>', opts)
      # buf_set_keymap('n', '<leader>sh', ':ClangdSwitchSourceHeader<cr>', opts)
      {
        mode = "n";
        key = "<leader>sa";
        # action = "<cmd> lua vim.lsp.buf.code_action()<cr>";
        action = ":Lspsaga code_action<cr>";
      }
      {
        mode = "n";
        key = "<leader>sd";
        # action = "<cmd>lua require('telescope.builtin').lsp_definitions(require('telescope.themes').get_cursor({}))<cr>";
        action = ":Lspsaga goto_definition<cr>";
        # action = ":Lspsaga peek_definition<cr>";
      }
      {
        mode = "n";
        key = "<leader>si";
        # action = "<cmd>lua require('telescope.builtin').lsp_implementations(require('telescope.themes').get_cursor({}))<cr>";
        action = ":Lspsaga finder imp<cr>";
      }
      {
        mode = "n";
        key = "<leader>st";
        # action = "<cmd>lua require('telescope.builtin').lsp_type_definitions(require('telescope.themes').get_cursor({}))<cr>";
        # action = ":Lspsaga goto_type_definition<cr>";
        action = ":Lspsaga peek_type_definition<cr>";
      }
      {
        mode = "n";
        key = "<leader>sr";
        action =
          "<cmd>lua require('telescope.builtin').lsp_references(require('telescope.themes').get_cursor({}))<cr>";
      }
      {
        mode = "n";
        key = "<leader>se";
        action =
          "<cmd>lua require('telescope.builtin').diagnostics(require('telescope.themes').get_ivy({}))<cr>";
      }
      {
        mode = "n";
        key = "<leader>so";
        # action = "<cmd>lua require('telescope.builtin').lsp_outgoing_calls(require('telescope.themes').get_cursor({}))<cr>";
        action = ":Lspsaga outgoing_calls<cr>";
      }
      {
        mode = "n";
        key = "<leader>si";
        # action = "<cmd>lua require('telescope.builtin').lsp_incoming_calls(require('telescope.themes').get_cursor({}))<cr>";
        action = ":Lspsaga incoming_calls<cr>";
      }
      {
        mode = "n";
        key = "<leader>sn";
        action = "<cmd>lua vim.lsp.buf.rename()<cr>";
      }
      {
        mode = "n";
        key = "<leader>sj";
        action = "<cmd>lua vim.diagnostic.goto_next()<cr>";
      }
      {
        mode = "n";
        key = "<leader>sk";
        action = "<cmd>lua vim.diagnostic.goto_prev()<cr>";
      }
    ];
  };
}
