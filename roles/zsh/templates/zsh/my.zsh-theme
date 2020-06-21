#---------------------------------------------
# Custom zsh prompt
#---------------------------------------------
setopt PROMPT_SUBST

RUNO_ARROW_ICON=${RUNO_ARROW_ICON:-➜ }

PROMPT="%(?:%F{green}:%F{red})"
PROMPT+='${RUNO_ARROW_ICON}'
PROMPT+="%F{blue}%B%c "
PROMPT+='%f%b'

#---------------------------------------------
# Custom exa colors
#---------------------------------------------
# export EXA_COLORS="di=35"

#---------------------------------------------
# Zsh syntax highlighters
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
#---------------------------------------------
#typeset -gA ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[unknown-token]="fg={{colors.red}}"
#ZSH_HIGHLIGHT_STYLES[reserved-word]="fg={{colors.black}}"
#ZSH_HIGHLIGHT_STYLES[alias]="fg={{colors.black}}"
#ZSH_HIGHLIGHT_STYLES[suffix-alias]="fg={{colors.black}}"
#ZSH_HIGHLIGHT_STYLES[global-alias]="fg={{colors.black}}"
#ZSH_HIGHLIGHT_STYLES[builtin]="fg={{colors.black}}"
#ZSH_HIGHLIGHT_STYLES[function]="fg={{colors.black}}"
#ZSH_HIGHLIGHT_STYLES[command]="fg={{colors.black}}"
#ZSH_HIGHLIGHT_STYLES[precommand]="fg={{colors.black}}"
#ZSH_HIGHLIGHT_STYLES[commandseparator]="fg=$(color cyan)"
#ZSH_HIGHLIGHT_STYLES[hashed-command]="fg={{colors.black}}"
#ZSH_HIGHLIGHT_STYLES[path]="fg={{colors.green}}"
#ZSH_HIGHLIGHT_STYLES[path_prefix]="fg={{colors.green}}"
#ZSH_HIGHLIGHT_STYLES[globbing]="fg={{colors.black}}"
#ZSH_HIGHLIGHT_STYLES[history-expansion]="fg={{colors.black}}"
#ZSH_HIGHLIGHT_STYLES[command-substitution]="fg={{colors.black}}"
#ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg={{colors.green}}"

#---------------------------------------------
# Custom fzf colors
#---------------------------------------------

export FZF_DEFAULT_OPTS='
  --color=fg:{{colors.black.2}},bg:{{colors.gray.2}},hl:{{colors.yellow.0}}
  --color=fg+:{{colors.black.2}},bg+:{{colors.gray.1}},hl+:{{colors.yellow.0}}
  --color=info:{{colors.black.2}},border:{{colors.black.2}},prompt:{{colors.black.2}}
  --color=pointer:{{colors.black.2}},marker:{{colors.black.2}},spinner:{{colors.black.2}}
  --color=header:{{colors.yellow.2}}
'

export FZF_PREVIEW_COMMAND='bat --color=never {}'
