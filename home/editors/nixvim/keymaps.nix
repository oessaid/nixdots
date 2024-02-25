{
  config,
  pkgs,
  ...
}: {
  programs.nixvim.keymaps = [
    {
      key = "jk";
      mode = "i";
      action = "<ESC>";
    }
    {
      key = "st";
      mode = "n";
      action = ":tab split<CR>";
    }
    {
      key = "<leader>i";
      mode = "n";
      action = "gt";
    }
    {
      key = "<leader>u";
      mode = "n";
      action = "gT";
    }
    {
      mode = "n";
      key = "<leader>\\";
      action = "<C-W>v";
    }
    {
      mode = "n";
      key = "<leader>-";
      action = "<C-W>s";
    }
    {
      mode = "n";
      key = "<leader>=";
      action = "<C-W>=";
    }
    {
      mode = "n";
      key = "<leader><S-j>";
      action = "<C-W><S-J>";
    }
    {
      mode = "n";
      key = "<leader><S-k>";
      action = "<C-W><S-K>";
    }
    {
      mode = "n";
      key = "<leader><S-l>";
      action = "<C-W><S-L>";
    }
    {
      mode = "n";
      key = "<leader><S-h>";
      action = "<C-W><S-H>";
    }
    {
      mode = "n";
      key = "<leader>j";
      action = "<C-W><C-J>";
    }
    {
      mode = "n";
      key = "<leader>k";
      action = "<C-W><C-K>";
    }
    {
      mode = "n";
      key = "<leader>l";
      action = "<C-W><C-L>";
    }
    {
      mode = "n";
      key = "<leader>h";
      action = "<C-W><C-H>";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-d>";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-u>";
    }
    {
      mode = ["n" "v"];
      key = "<leader>y";
      action = "+y";
    }
    {
      mode = "n";
      key = "<leader>e";
      action = ":Neotree<CR>";
    }
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
}
