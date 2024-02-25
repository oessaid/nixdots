{ config, pkgs, lib, ... }:
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
      tmuxPlugins.gruvbox
      tmuxPlugins.prefix-highlight
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
