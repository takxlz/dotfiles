" .vimrcと.gvimrcを~/にコピーもしくはシンボリックリンクで配置する

" ~/.vim/rc/にある*.vim(設定ファイル)を読み込む
set runtimepath+=~/.vim/

runtime! rc/00_init.rc.vim
runtime! rc/10_basic.rc.vim
runtime! rc/20_plugin.rc.vim
runtime! rc/30_editor.rc.vim
runtime! rc/99_final.rc.vim
