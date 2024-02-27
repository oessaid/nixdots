{
  config,
  pkgs,
  ...
}: {
  programs.nixvim.plugins = {
    fugitive.enable = true;
    git-worktree.enable = true;
    gitsigns = {
      enable = true;
      trouble = true;
    };
  };
}
