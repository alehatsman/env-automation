#---------------------------------------------
# Custom zsh prompt
#---------------------------------------------
setopt PROMPT_SUBST

RUNO_ARROW_ICON=${RUNO_ARROW_ICON:-➜ }

PROMPT="%(?:%F{{ '{' }}{{colors.positive.2}}{{ '}' }}:%F{{ '{' }}{{colors.negative.2}}{{ '}' }})"
PROMPT+='${RUNO_ARROW_ICON}'
PROMPT+="%F{{ '{' }}{{colors.brand.0}}{{ '}' }}%B%c "
PROMPT+='%f%b'

#---------------------------------------------
# Custom exa colors
#---------------------------------------------
# export EXA_COLORS="di=35"

#---------------------------------------------
# Zsh syntax highlighters
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
#---------------------------------------------
typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg={{colors.negative}}"
ZSH_HIGHLIGHT_STYLES[reserved-word]="fg={{colors.fg}}"
ZSH_HIGHLIGHT_STYLES[alias]="fg={{colors.fg}}"
ZSH_HIGHLIGHT_STYLES[suffix-alias]="fg={{colors.fg}}"
ZSH_HIGHLIGHT_STYLES[global-alias]="fg={{colors.fg}}"
ZSH_HIGHLIGHT_STYLES[builtin]="fg={{colors.fg}}"
ZSH_HIGHLIGHT_STYLES[function]="fg={{colors.fg}}"
ZSH_HIGHLIGHT_STYLES[command]="fg={{colors.fg}}"
ZSH_HIGHLIGHT_STYLES[precommand]="fg={{colors.fg}}"
# ZSH_HIGHLIGHT_STYLES[commandseparator]="fg=$(color cyan)"
ZSH_HIGHLIGHT_STYLES[hashed-command]="fg={{colors.fg}}"
ZSH_HIGHLIGHT_STYLES[path]="fg={{colors.positive}}"
ZSH_HIGHLIGHT_STYLES[path_prefix]="fg={{colors.positive}}"
ZSH_HIGHLIGHT_STYLES[globbing]="fg={{colors.fg}}"
ZSH_HIGHLIGHT_STYLES[history-expansion]="fg={{colors.fg}}"
ZSH_HIGHLIGHT_STYLES[command-substitution]="fg={{colors.fg}}"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg={{colors.positive}}"

#---------------------------------------------
# Custom fzf colors
#---------------------------------------------

export FZF_DEFAULT_OPTS='
  --color=fg:{{colors.fg.2}},bg:{{colors.bg.2}},hl:{{colors.attention.2}}
  --color=fg+:{{colors.fg.2}},bg+:{{colors.bg.1}},hl+:{{colors.attention.2}}
  --color=info:{{colors.fg.2}},border:{{colors.fg.2}},prompt:{{colors.fg.2}}
  --color=pointer:{{colors.fg.2}},marker:{{colors.fg.2}},spinner:{{colors.fg.2}}
  --color=header:{{colors.neutral.2}}
'
