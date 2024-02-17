# -------------- Alias -------------- #

# System
alias reloadterm="source ~/.zshrc"
alias zshconfig="code ~/.zshrc"

# Python
alias python="python3"

# Git
gcop() {
  if [ n != "" ]
  then
    git add .
    git commit -m "$1"
    git push
  else
    echo "YOU MUST PROVIDE A MESSAGE"
  fi
}

alias gstt="git status"


# -------------- Managers -------------- #

# Node
eval "$(fnm env --use-on-cd)"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"