{
  config,
  pkgs,
  ...
}: {
  programs.nixvim = {
    plugins.lualine = {
      enable = true;
      iconsEnabled = true;
    };
    extraPlugins = with pkgs.vimPlugins; [
      lualine-lsp-progress
    ];
  };
}
