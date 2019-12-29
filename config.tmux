#!/usr/bin/env bash

status_bar() {
   tmux set-option -g automatic-rename off
   tmux set-option -g pane-border-fg black
   tmux set-option -g pane-active-border-fg blue

   #------------
   # tabs
   #------------
   tmux setw -g window-status-format "#[fg=white]#[bg=blue] #I #[bg=blue]#[fg=white] #W "
   tmux setw -g window-status-current-format "#[bg=brightmagenta]#[fg=white] *#I #[fg=white,bold]#[bg=cyan] [#W] "
   tmux setw -g window-status-content-attr bold,blink,reverse

   #------------
   # status bar
   #------------
   tmux set-option -g status-position bottom
   tmux set-option -g status-fg white
   tmux set-option -g status-bg blue
   tmux set-option -g status-left ''
   tmux set-option -g status-right-length 60
   tmux set-option -g status-right '♪ #(exec amixer get Master | egrep -o "[0-9]+%" | egrep -o "[0-9]*") | ♥#(acpi | cut -d ',' -f 2) | %a %m-%d %H:%M'
}

main() {
   tmux unbind C-b
   tmux set-option -g prefix C-a

   tmux set-window-option -g mode-keys vi
   tmux set-option -g mode-keys vi
   tmux set-option -g status-keys vi

   # help escape key to be quicker in vim
   tmux set -sg escape-time 0

   # plugin setting
   tmux set-option -g @yank_with_mouse off
   tmux set-option -g @shell_mode 'vi'
   tmux set-option -g @yank_selection 'primary'
   status_bar
}
main
