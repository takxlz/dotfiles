# インストール
```sh
$ cd ~/
$ git clone https://github.com/takxlz/dotfiles.git
```

## Vim
Vimはデフォルトで以下のファイルを読み込む
1. \~/.(g)vimrc
2. \~/vimfiles/(g)vimrc  (Windows)
3. \~/.vim/(g)vimrc  (Unix)

①が一般的だが,②(③)にすることで,Vimの設定ファイル・ディレクトリ(vimrc, gvimrc, .vim/ ...)を一箇所にまとめることができる.

※ OSの違いによる「\~/vimfiles/」と「\~/.vim/」のパスの違いは,vimrcにて自動で判別し「g:vim_dir」に設定している.  
プラグインの設定などで「\~/vimfiles/」「\~/.vim/」のパスを指定する場合は「g:vim_dir」を用いる.

※ gvimの設定は「gvimrc」を用いずに「vimrc」内にてgui_runningフラグを用いて設定している.

<br />

### Windows
kaoriya版のときは「$VIM/gvimrc」を削除する(vimrcでgvimの設定をしているため,ロード順的にvimrcより後に読み込まれる「$VIM/gvimrc」に設定が上書きされるのを防ぐ)
```sh
# mklink {リンク先} {リンク元(実体)}
$ mklink /D %HOMEPATH%\vimfiles %HOMEPATH%\dotfiles\vim
```

### Unix
```sh
# ln -s {リンク元(実体)} {リンク先}
$ ln -sf ~/dotfiles/vim ~/.vim
```
