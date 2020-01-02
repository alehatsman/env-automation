#---------------------------------------------
# Aliases
#---------------------------------------------

alias ag="ag --path-to-ignore ~/.ignore"
alias mkdir="mkdir -p"
alias e="$EDITOR"
alias ls="exa"
alias c="clear"
alias n="cd ~/Projects/atsman/notes; e"
alias vimdiff="nvim -d"
alias r="source ~/.zshrc"

# Docker
alias docker_clean="docker system prune --all --volumes"

#---------------------------------------------
# GIT
#---------------------------------------------

g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}
compdef g=git

alias ga="git add"
alias gaa="git add --all"
alias gai="git add --interactive"

alias gb="git branch"

alias gc="git commit -v"
alias gca="git commit -v --amend"
alias gcm="git commit -v -m"

alias gc!="git commit --no-verify -v"
alias gca!="git commit --amend --no-verify -v"
alias gcm!="git commit --no-verify -v -m"

gcb() {
  if [[ $# > 0 ]]; then
    git checkout $@
  else
    fgcb
  fi
}
alias gcbb="git checkout -b"

alias gcp="git cherry-pick"
alias gcpa="git cherry-pick --abort"
alias gcpc="git cherry-pick --continue"

alias gpr="git pull -r"
alias gl="git log"

alias gp="git push -u origin HEAD"
alias gp!="gp --no-verify"
alias gpf="gp --force-with-lease"
alias gpf!="gp! --force-with-lease"

alias gs="git show"

alias gd="git diff"
alias gds="git diff --staged"

alias gf="git fetch"
alias gfa="git fetch --all"
alias gfo="git fetch origin"

alias gra="git reset ."
alias grh="git reset --hard"

alias gmt="git mergetool"

alias gr="git rebase"
alias gri="git rebase --interactive"
alias grc="git rebase --continue"
alias gra="git rebase --abort"

gbd() { # git delete branch
  git branch -d $@
  git push origin --delete $@
}

gbd!() { # git delete branch force 
  git branch -D $@
  git push origin --delete --force $@
}

fgcb() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

fe() {
  local files
  IFS=$"\n" files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

flpass() {
  lpass login {{ EMAIL }}
  lpass show -c --password $(lpass ls  | fzf | awk "{print $(NF)}" | sed "s/\]//g")
}

fkill() {
  local pid 
  if [ "$UID" != "0" ]; then
      pid=$(ps -f -u $UID | sed 1d | fzf -m | awk "{print $2}")
  else
      pid=$(ps -ef | sed 1d | fzf -m | awk "{print $2}")
  fi  

  if [ "x$pid" != "x" ]
  then
      echo $pid | xargs kill -${1:-9}
  fi  
}

tm() {
  tmux attach || tmux new
}

alias tmks="tmux kill-server"

alias jcsm="jest --changedSince master"

format_pb_json() {
  pbpaste | jq | pbcopy
}

help() {
  curl cheat.sh/$@
}

alias k8s="kubectl"
compdef k8s=kubectl

alias my_ip="curl ifconfig.me/ip"
