{ config, pkgs, ... }: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    neofetch
    (nerdfonts.override {
      fonts = [ "JetBrainsMono" "NerdFontsSymbolsOnly" "ProggyClean" ];
    })

    # dev
    cmakeWithGui

    # utils
    ripgrep # recursively searches directories for a regex pattern
    fd # a faster alternative to find
    jq # A lightweight and flexible command-line JSON processor
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder
    bottom # replacement of htop/nmon

    # misc
    cowsay
    file
    which
    tree
    curl

    # keyboard debug
    xorg.xmodmap
    wev

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    glow # markdown previewer in terminal

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    wl-clipboard
    hwinfo
    pciutils
    # glxinfo

    pavucontrol

    # display management
    nwg-displays
    wlr-randr
  ];
}
