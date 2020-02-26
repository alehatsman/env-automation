#---------------------------------------------
# Aliases
#---------------------------------------------

alias ag="ag --path-to-ignore ~/.ignore"
alias n="cd ~/Projects/atsman/notes; e"
alias vimdiff="nvim -d"
alias r="source ~/.zshrc"

#---------------------------------------------
# Apps
#---------------------------------------------

alias e="$EDITOR"
alias sed=gsed
alias cat=bat
alias ls=exa

alias l="ls -1"
alias c="clear"
alias md="mkdir -p"

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

alias gct="git checkout"

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

alias gsh="git show"

alias gs="git stash"
alias gsp="git stash pop"

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
  branches=$(git branch --all | rg -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux --height 40% -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

#---------------------------------------------
# Lastpass
#---------------------------------------------
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

cheat() {
  curl cheat.sh/$@
}

alias hm="man"
alias hc="cheat"

alias k8s="kubectl"
compdef k8s=kubectl

alias my_ip="curl ifconfig.me/ip"

#---------------------------------------------
# npm / yarn 
#---------------------------------------------

# fzf_npm_script - opens fzf for npm script
# selection. Prints selected script back
_fzf_npm_script() {
  local npm_script
  npm_script=$(cat ./package.json | jq -r '.scripts | keys | .[]' | fzf)
  echo "$npm_script"
}

_run_npm_script() {
  if [[ ! -f './package.json' ]]; then
    echo "no package.json file!"
    return 0
  fi 

  local npm_script
  npm_script=$(_fzf_npm_script)
  if [ -z "$npm_script" ]; then 
    return 0
  fi
  echo "$1 run $npm_script"
  "$1" run "$npm_script"
}

# nr - npm run script
# Opens fzf with list of available scripts
# runs selected script
nr() {
  _run_npm_script "npm"
}

# yr - yarn run script
# Opens fzf with list of available scripts
# runs selected script
yr() {
  _run_npm_script "yarn"
}


#---------------------------------------------
# Docker
#---------------------------------------------

alias dps="docker ps"
