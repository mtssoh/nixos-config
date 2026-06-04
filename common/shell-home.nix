{ pkgs, ... }:

{
  home.shellAliases = {
    ls = "eza";
    sudohx = "sudo -E hx";
  };

  programs = {
    tmux = {
      enable = true;
      baseIndex = 1;
      mouse = true;
      historyLimit = 50000;
      terminal = "tmux-256color";
      escapeTime = 0;
      extraConfig = ''
        set-window-option -g xterm-keys on
        bind -n M-h previous-window
        bind -n M-l next-window
        bind -n M-1 select-window -t 1
        bind -n M-2 select-window -t 2
        bind -n M-3 select-window -t 3
        bind -n M-4 select-window -t 4
        bind -n M-5 select-window -t 5
        bind -n M-6 select-window -t 6
        bind -n M-7 select-window -t 7
        bind -n M-8 select-window -t 8
        bind -n M-9 select-window -t 9
      '';
    };
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      autocd = true;
      oh-my-zsh = {
        enable = true;
        theme = "clean";
      };
      history.size = 50000;
    };
  };
}
