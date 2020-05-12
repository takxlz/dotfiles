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

# 環境変数の設定
export PATH="$HOME/.nodebrew/current/bin:$PATH"
export JAVA_HOME="/Applications/Eclipse_2020-03.app/Contents/java/11/Home"


# linebot(django)用のダミー環境変数
# ローカルでテストするため本物のトークンを設定する
# export YOUR_CHANNEL_ACCESS_TOKEN="dummy"
# export YOUR_CHANNEL_SECRET="dummy"
export YOUR_CHANNEL_ACCESS_TOKEN="xxx"
export YOUR_CHANNEL_SECRET="xxx"
