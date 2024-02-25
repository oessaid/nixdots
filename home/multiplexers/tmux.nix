{ config, pkgs, lib, ... }:
let tmux-status-theme = pkgs.tmuxPlugins.mkTmuxPlugin
  {
    pluginName = "tmux-status-theme";
    version = "unstable-2024-02-25";
    src = pkgs.fetchFromGitHub {
      owner = "niksingh710";
      repo = "minimal-tmux-status";
      rev = "5183698f30c521fdf890d287e3ba2f81ea4e0d1c";
      sha256 = "sha256-BrlMV4w1AsjLTjwKQXuOGRPy8QFsS4JtFtGFRUluQ50=";
    };
  };
in
{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    prefix = "C-Space";
    keyMode = "vi";
    mouse = true;
    historyLimit = 100000;
    escapeTime = 0;
    baseIndex = 1;
    disableConfirmationPrompt = true;
    plugins = with pkgs; [
      {
        plugin = tmux-status-theme;
	extraConfig = ''
	'';
      }
      {
        plugin = tmuxPlugins.resurrect;
	extraConfig = ''
    	  set -g @resurrect-strategy-vim 'session'
    	  set -g @resurrect-strategy-nvim 'session'
    	  set -g @resurrect-capture-pane-contents 'on'
	'';
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-boot 'on'
          set -g @continuum-save-interval '5'
        '';
      }
    ];
    extraConfig = ''
      set -g set-clipboard external
      set -g focus-events on
      set-option -g renumber-windows on
      
      # split panes using | and - (and stay in the current directory)
      bind \\ split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      unbind '"'
      unbind %
      
      # Create a new window in the current directory
      bind c new-window -c "#{pane_current_path}"
      
      # Vim style pane selection
      bind h select-pane -L
      bind j select-pane -D 
      bind k select-pane -U
      bind l select-pane -R
      
      # Easier pane resizing
      bind-key J resize-pane -D 10
      bind-key K resize-pane -U 10
      bind-key H resize-pane -L 10
      bind-key L resize-pane -R 10
      
      # Moving between windows
      bind i next-window
      bind u previous-window
      
      # Renumber all windows
      bind R move-window -r
    '';
  };
}
