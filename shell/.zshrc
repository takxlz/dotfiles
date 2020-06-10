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

# メモリに保存されるhistoryサイズ
export HISTSIZE=1000

# 履歴ファイルに保存されるhisotryサイズ
export SAVEHIST=100000

# ll -> ll -a
# alias ll='ls -lA'
alias ll='gls -lA --group-directories-first --color=auto'

alias python='python3'
alias vim='nvim'

# /usr/local/binにパスを通す
# tmux用のコマンド
export PATH="/usr/local/bin:$PATH"

# Java
export JAVA_HOME="/Applications/Eclipse_2020-03.app/Contents/java/11/Home"

# fzf
export PATH="$HOME/.cache/plugged/fzf/bin:$PATH"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'


export PATH="$HOME/.nodebrew/current/bin:$PATH"

# linebot(django)用のダミー環境変数
# ローカルでテストするため本物のトークンを設定する
# export YOUR_CHANNEL_ACCESS_TOKEN="dummy"
# export YOUR_CHANNEL_SECRET="dummy"
export YOUR_CHANNEL_ACCESS_TOKEN="RLaQmqmamFtc3IFRZ2fKIJQ4WEyMAnRg4oKXpJ2tWzpC4fUKoRUQhmqBmC1btqbYv3F9bY+oHwXHG7jdCLWzSU52SslOJ8/LJIqg7vuBEImmX8OT7ftS7TzldgNCyEZbvT1NdcezLN4L6wYX7k+dngdB04t89/1O/w1cDnyilFU="
export YOUR_CHANNEL_SECRET="b84890fe0974a345893077c19a524ddf"
