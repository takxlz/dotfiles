# インストール
```sh
$ cd ~/
$ git clone https://github.com/takxlz/dotfiles.git
```

## Vim
Vimは、\~/.(g)vimrc以外にも、Windowsでは「\~/vimfiles/(g)vimrc」、Unixでは「\~/.vim/(g)vimrc」を読み込むことができるため、
[vimfiles|.vim]/(g)vimrcにして全ての設定ファイルを[vimfiles|.vim]に集約するようにしている。

### Windows
Windowsでは、Vimのホームディレクトリを「vimfiles」としてシンボリックリンクを貼る。
```sh
# mklink {link} -> {target}
$ mklink /D %HOMEPATH%\vimfiles %HOMEPATH%\dotfiles\vim
```

### Unux
Unixでは、Vimのホームディレクトリを「.vim」としてシンボリックリンクを貼る。
```sh
# ln -s {target} <- {link}
$ ln -sf ~/dotfiles/vim ~/.vim
```
