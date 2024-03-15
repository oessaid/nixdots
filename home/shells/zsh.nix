{ config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    autosuggestion = { enable = true; };
    enableCompletion = true;
    historySubstringSearch = { enable = true; };
    sessionVariables = {
      # Not reliable on Wayland
      # https://github.com/nix-community/home-manager/issues/1011#issuecomment-1454785963
    };
    history = {
      expireDuplicatesFirst = true;
      ignoreAllDups = true;
      share = false;
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
      ll =
        "exa -a --color=always --octal-permissions --git --group-directories-first --classify --long";
    };
    initExtra = ''
      export VISUAL="nvim"
      export EDITOR="nvim"
      export GIT_EDITOR="nvim"
      export NIX_SSL_CERT_FILE="/var/corpnet.crt"
      export PATH=$HOME/.local/bin:$PATH

      function yy() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          cd -- "$cwd"
        fi
        rm -f -- "$tmp"
      }

      eval "$(starship init zsh)"
      . "$HOME/.cargo/env"

      export PYENV_ROOT="$HOME/.pyenv"
      [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
      eval "$(pyenv init -)"

      export LC_CTYPE='en_US.UTF-8'
      export LC_ALL='en_US.UTF-8'
      export LANG='en_US.UTF-8'
    '';
  };
}
