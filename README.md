# インストール
```sh
$ cd ~/
$ git clone https://github.com/takxlz/dotfiles.git
```

## Vim
「**\~/.vimrc**」以外にも「win: **\~/vimfiles/vimrc**」「unix: **\~/.vim/vimrc**」に配置することができる.(※ .vimrcではなくvimrc)  
「**\~/ [vimfiles | .vim] /vimrc**」の場合、Vimの設定ファイルなどを1つのディレクトリにまとめることができ管理が楽になる.

※ gvimの設定はgvimrcではなくvimrc内にてgui_runningフラグを用いて設定している.


### Windows
***
```sh
# mklink {リンク先} {リンク元(実体)}
$ mklink /D %HOMEPATH%\vimfiles %HOMEPATH%\dotfiles\vim
```
- **$VIM/gvimrcを削除（kaoriya版）**
<br />
<br />


### Unix or Mac
***
```sh
# ln -s {リンク元(実体)} {リンク先}
$ ln -sf ~/dotfiles/vim ~/.vim
```
- luaを追加
- vimprocを追加
<br />
<br />


#### 共通
***
- Lightline.vim
    - RictyDiminished-for-Powerline-masterをインストールしてvim-powerline-fontpatchedをOSのフォントに追加

- ALE.vim
    - OSにnode.jsをインストール
    - npmで各言語のLinterをインストール

