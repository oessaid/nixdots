{ config, pkgs, ... }:

{
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
  };
}
