{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./lsp.nix
    ./lsp-servers.nix
    ./keymaps.nix
    ./lualine.nix
    ./tree.nix
    ./git.nix
    ./telescope.nix
    ./colorscheme.nix
    ./completion.nix
  ];

  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";
    clipboard = {
      providers.wl-copy.enable = true;
      register = "unnamedplus";
    };
    options = {
      termguicolors = true;
      showmatch = false;
      mouse = "a";
      incsearch = true;
      backup = false; # creates a backup file
      cmdheight = 1; # space in the neovim command line for displaying messages
      colorcolumn = "99999"; # fixes indentline for now
      conceallevel = 0; # so that `` is visible in markdown files
      fileencoding = "utf-8"; # the encoding written to a file
      foldlevel = 99;
      foldmethod = "expr"; # folding set to "expr" for treesitter based folding
      foldexpr = "nvim_treesitter#foldexpr()"; # set to "nvim_treesitter#foldexpr()" for treesitter based folding
      hidden = true; # required to keep multiple buffers and open multiple buffers
      hlsearch = false; # highlight all matches on previous search pattern
      ignorecase = false; # ignore case in search patterns
      pumheight = 10; # pop up menu height
      showmode = false; # we don't need to see things like # INSERT # anymore
      showtabline = 1; # only show tabs if there's more than one
      smartcase = true; # smart case
      smartindent = true; # make indenting smarter again
      splitbelow = true; # force all horizontal splits to go below current window
      splitright = true; # force all vertical splits to go to the right of current window
      swapfile = false; # creates a swapfile
      timeoutlen = 300; # time to wait for a mapped sequence to complete (in milliseconds)
      title = true; # set the title of window to the value of the titlestring
      titlestring = "%<%F%=%l/%L - nvim"; # what the title of the window will be set to
      undofile = true; # enable persistent undo
      updatetime = 100; # faster completion
      writebackup = false; # if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
      expandtab = true; # convert tabs to spaces
      shiftwidth = 2; # the number of spaces inserted for each indentation
      tabstop = 2; # insert 2 spaces for a tab
      cursorline = true; # highlight the current line
      number = true; # set numbered lines
      relativenumber = true; # set relative numbered lines
      numberwidth = 4; # set number column width to 2 {default 4}
      signcolumn = "yes"; # always show the sign column otherwise it would shift the text each time
      wrap = true; # display lines as one long line
      spell = false;
      spelllang = "en";
      scrolloff = 8; # is one of my fav
      sidescrolloff = 8;
      inccommand = "nosplit";
    };
    plugins = {
      nix.enable = true;
      luasnip.enable = true;
      comment-nvim.enable = true;
      notify.enable = true;
      todo-comments.enable = true;
      treesitter = {
        enable = true;
        nixGrammars = true;
        folding = true;
      };
    };
    extraPlugins = [
    ];
    extraConfigLua =
      /*
      lua
      */
      ''
        vim.fn.sign_define("DiagnosticSignError", {
          texthl = "DiagnosticSignError",
          text = "",
          numhl = "DiagnosticSignError",
        })
        vim.fn.sign_define("DiagnosticSignWarn", {
          texthl = "DiagnosticSignWarn",
          text = "",
          numhl = "DiagnosticSignWarn",
        })
        vim.fn.sign_define("DiagnosticSignInfo", {
          texthl = "DiagnosticSignInfo",
          text = "",
          numhl = "DiagnosticSignInfo",
        })
        vim.fn.sign_define("DiagnosticSignHint", {
          texthl = "DiagnosticSignHint",
          text = "",
          numhl = "DiagnosticSignHint",
        })

        vim.diagnostic.config({
          underline = true,
          virtual_text = {
            prefix = "",
            spacing = 2,
            source = "always", -- always | if_many
          },
          signs = true,
          update_in_insert = false,
          severity_sort = true,
        })
      '';
  };
}
