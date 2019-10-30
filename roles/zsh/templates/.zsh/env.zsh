#---------------------------------------------
# Exports
#---------------------------------------------

export GPG_TTY=$(tty)
export LANG=en_US.UTF-8

export NODE_MODULES_BIN=./node_modules/.bin
export GOPATH={{ GOPATH }}
export GCPATH={{ GCP_PATH }}
export JAVA_HOME={{ JAVA_HOME }}
export CARGO_HOME=~/.cargo
export ZPLUG_HOME={{ ZPLUG_HOME }}
export PATH=$HOME/bin:/usr/local/bin:$PATH:"$(yarn global bin)":$JAVA_HOME/bin:$GCPATH/bin:$GOPATH/bin:$NODE_MODULES_BIN:$CARGO_HOME/bin

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="nvim"
fi

export SSH_KEY_PATH=~/.ssh/rsa_id

export FZF_BASE={{ FZF_BASE }}
export FZF_DEFAULT_COMMAND="rg --files --hidden"
