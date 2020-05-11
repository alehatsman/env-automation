#---------------------------------------------
# Plugins 
#---------------------------------------------
export NVM_LAZY_LOAD=true
source $ZPLUG_HOME/init.zsh

zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/fzf", from:oh-my-zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"

zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "atsman/runo-color-scheme", as:theme, defer:2

zplug "lukechilds/zsh-nvm"


zplug "asdf-vm/asdf", \
  use:asdf.sh

if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
