#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# vim->nvim
alias vim='nvim'

# ll -> ll -a
# alias ll='ls -lA'
alias ll='gls -lA --group-directories-first --color=auto'

# tmux用のコマンド
export PATH="/usr/local/bin:$PATH"

