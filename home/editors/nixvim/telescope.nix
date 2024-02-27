{
  config,
  pkgs,
  ...
}: {
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      keymapsSilent = true;
      keymaps = {
      };
      extensions = {
        file_browser.enable = true;
        fzf-native.enable = true;
        ui-select.enable = true;
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>/";
        action = "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({layout_strategy='bottom_pane'})<cr>";
      }
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>";
      }
      {
        mode = "n";
        key = "<leader>fq";
        action = "<cmd>lua require('telescope.builtin').quickfix()<cr>";
      }
      {
        mode = "n";
        key = "<leader>fw";
        action = "<cmd>lua require('telescope.builtin').live_grep()<cr>";
      }
      {
        mode = "n";
        key = "<leader>fc";
        action = "<cmd>lua require('telescope.builtin').git_commits()<cr>";
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = "<cmd>lua require('telescope.builtin').git_branches()<cr>";
      }
      {
        mode = "n";
        key = "<leader>fu";
        action = ":Telescope undo<cr>";
      }
    ];
  };
}
