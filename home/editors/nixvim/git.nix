{ config, pkgs, ... }: {
  programs.nixvim = {
    plugins = {
      fugitive.enable = true;
      git-worktree.enable = true;
      gitsigns = {
        enable = true;
        settings = { trouble = true; };
      };
      diffview = {
        enable = true;
        enhancedDiffHl = true;
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>gs";
        action = ":Git<cr>";
        # desc = "Git";
      }
      {
        mode = "n";
        key = "<leader>gc";
        action = ":Gdiffsplit!<cr>";
        # desc = "Git diff";
      }
      {
        mode = "n";
        key = "<leader>ggw";
        action = ":Gwrite<cr>";
        # desc = "Git write";
      }
      {
        mode = "n";
        key = "<leader>gj";
        action = "<cmd>lua require'gitsigns.actions'.next_hunk()<CR>";
        # desc = "Next hunk";
      }
      {
        mode = "n";
        key = "<leader>gk";
        action = "<cmd>lua require'gitsigns.actions'.prev_hunk()<CR>";
        # desc = "Previous hunk";
      }
      {
        mode = "n";
        key = "<leader>ghp";
        action = "<cmd>lua require'gitsigns'.preview_hunk()<cr>";
        # desc = "Preview hunk";
      }
      {
        mode = "n";
        key = "<leader>ghb";
        action = "<cmd>lua require'gitsigns'.blame_line{full=true}<CR>";
        # desc = "Blame line";
      }
      {
        mode = "n";
        key = "<leader>ghs";
        action = "<cmd>lua require'gitsigns'.stage_hunk()<CR>";
        # desc = "Stage";
      }
      {
        mode = "n";
        key = "<leader>ghr";
        action = "<cmd>lua require'gitsigns'.reset_hunk()<CR>";
        # desc = "Reset";
      }
      {
        mode = "n";
        key = "<leader>ghu";
        action = "<cmd>lua require'gitsigns'.undo_stage_hunk()<CR>";
        # desc = "Undo Stage";
      }
      {
        mode = "n";
        key = "<leader>ghS";
        action = "<cmd>lua require'gitsigns'.stage_buffer()<CR>";
        # desc = "Stage buffer";
      }
      {
        mode = "n";
        key = "<leader>ghU";
        action = "<cmd>lua require'gitsigns'.reset_buffer_index()<CR>";
        # desc = "Reset buffer index";
      }
      {
        mode = "n";
        key = "<leader>ghR";
        action = "<cmd>lua require'gitsigns'.reset_buffer()<CR>";
        # desc = "Reset buffer";
      }
    ];
  };
}
