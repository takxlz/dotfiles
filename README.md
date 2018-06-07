# Installation
```sh
$ cd ~/
$ git clone https://github.com/takxlz/dotfiles.git
```

## Vim
### Windows
```sh
# mklink {link} -> {target}
$ mklink /D %HOMEPATH%\.vim %HOMEPATH%\dotfiles\vim
$ mklink %HOMEPATH%\.vimrc %HOMEPATH%\dotfiles\vim\vimrc-loader
$ mklink %HOMEPATH%\.gvimrc %HOMEPATH%\dotfiles\vim\gvimrc-loader
```

### Linux
```sh
# ln -s {target} <- {link}
$ ln -sf ~/dotfiles/vim ~/.vim
$ ln -sf ~/dotfiles/vim/vimrc-loader ~/.vimrc
$ ln -sf ~/dotfiles/vim/gvimrc-loader ~/.gvimrc
```
