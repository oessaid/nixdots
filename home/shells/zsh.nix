{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    historySubstringSearch = {
      enable = true;
    };
    history = {
      expireDuplicatesFirst = true;
      ignoreAllDups = true;
      share = true;
    };
    syntaxHighlighting = {
      enable = true;
      styles = {
        path = "none";
        path_prefix = "none";
      };
    };
    shellAliases = {
      vi = "nvim";
      vim = "nvim";
      ll = "exa -a --color=always --octal-permissions --git --group-directories-first --classify --long";
    };
  };
}
