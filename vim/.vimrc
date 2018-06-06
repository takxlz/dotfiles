" .vimrcと.gvimrcを~/にコピーもしくはシンボリックリンクで配置する

" ~/.vim/rc.d/にある*.vim(設定ファイル)を読み込む
set runtimepath+=~/.vim/

runtime! rc.d/init.rc.vim
runtime! rc.d/basic.rc.vim
runtime! rc.d/plugin.rc.vim
runtime! rc.d/indent.rc.vim
runtime! rc.d/mapping.rc.vim
runtime! rc.d/final.rc.vim


