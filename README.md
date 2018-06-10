# インストール
```sh
$ cd ~/
$ git clone https://github.com/takxlz/dotfiles.git
```

## Vim
[ vimfiles | .vim ]/(g)vimrcにして全ての設定ファイルを[ vimfiles | .vim ]に集約する。  
vimfilesと.vimのパスの違いはvimrcで自動で対応するように設定している。
※ Vimは、\~/.(g)vimrc以外にも、Windowsでは「\~/vimfiles/(g)vimrc」、Unixでは「\~/.vim/(g)vimrc」を読み込むことができる。

### Windows
```sh
# mklink {link} -> {target}
$ mklink /D %HOMEPATH%\vimfiles %HOMEPATH%\dotfiles\vim
```

### Unix
```sh
# ln -s {target} <- {link}
$ ln -sf ~/dotfiles/vim ~/.vim
```
