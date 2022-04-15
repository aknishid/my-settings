#--------
# PATH
#--------

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init -)"

#---------
# plugins
#---------

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/Projects/github.com/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#--------
# view
#--------
export PS1="%K{240}% %F{230}%  %. $ %K "

#---------
# peco
#---------
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src
