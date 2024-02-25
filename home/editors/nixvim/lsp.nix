{ config, pkgs, ... }: 
{
  programs.nixvim.plugins.lsp = {
    enable = true;
  };
}
