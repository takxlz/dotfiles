# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
customize_agnoster() {
    prompt_segment 'red' '' prompt_dir
}

# メモリに保存されるhistoryサイズ
export HISTSIZE=1000

# 履歴ファイルに保存されるhisotryサイズ
export SAVEHIST=100000

# ll -> ll -a
# alias ll='ls -lA'
alias ll='gls -lA --group-directories-first --color=auto'

# alias python='python3.8.6'
# alias python3='python3.8.6'
alias vim='nvim'

alias tree='tree --dirsfirst'

# ts-node
alias tsn='npx ts-node'

# tmux
export PATH="/usr/local/bin:$PATH"

# fzf
export PATH="$HOME/.cache/plugged/fzf/bin:$PATH"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'  # fzf

# nodebrew
export PATH="$HOME/.nodebrew/current/bin:$PATH"

# export FLASK_APP='run.py flask db init'
# export PIPENV_VENV_IN_PROJECT=true

# java
export PATH="/Library/Java/JavaVirtualMachines/jdk-14.0.1.jdk/Contents/Home/bin:$PATH"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-14.0.1.jdk/Contents/Home"
# export JAVA_HOME="/Applications/Eclipse_2020-03.app/Contents/java/11/Home"
# export PATH="/usr/local/opt/openjdk/bin:$PATH"
# export JAVA_HOME="/usr/local/opt/openjdk"

# go
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# history
function history-all { history -E 1 }

# export NODE_PATH="/Users/takxlz/.nodebrew/node/v12.16.2/lib/node_modules"

# linebot用のダミー環境変数
# ローカルでテストするため本物のトークンを設定する
export LINEBOT_ACCESS_TOKEN="************"

# jwtのシークレットキー
export JWT_SECRET_KEY="************"

# toybox(node)用のダミー環境変数
# Dockerのコンテナのほうの環境変数が使われるので、こっちは関係ない
export DB_HOST="************"
export DB_USER="************"
export DB_PASS="************"
export DB_NAME="************"

# alias heroku_db='mysql -h durvbryvdw2sjcm5.cbetxkdyhwsb.us-east-1.rds.amazonaws.com -u no22p9tfovumqoy4 --password=m6x3wlgzg0g71o8f ffzf35gx36kr35og'
alias heroku_db='mysql -h ************ -u ********* --password=*********** ************'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
