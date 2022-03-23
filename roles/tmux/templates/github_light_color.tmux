set -g mode-style "fg=#24292f,bg=#f6f8fa"

set -g message-style "fg=#24292f,bg=#f6f8fa"
set -g message-command-style "fg=#24292f,bg=#f6f8fa"

set -g pane-border-style "fg=#e1e4e8"
set -g pane-active-border-style "fg=#0366d6"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#0366d6,bg=#f6f8fa"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

setw -g window-status-activity-style "underscore,fg=#586069,bg=#f6f8fa"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#ffffff,bg=#f6f8fa"
setw -g window-status-format "#[fg=#f6f8fa,bg=#f6f8fa,nobold,nounderscore,noitalics]#[fg=#666666,bg=#f6f8fa,nobold,nounderscore,noitalics] #I #W #[fg=#f6f8fa,bg=#f6f8fa,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#f6f8fa,bg=#babbbd,nobold,nounderscore,noitalics]#[fg=#24292e,bg=#babbbd,bold] #I #W #[fg=#babbbd,bg=#0366d6,nobold,nounderscore,noitalics]"
