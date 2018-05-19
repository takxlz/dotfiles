" .vimrcと.gvimrcを~/にコピーもしくはシンボリックリンクで配置する

" ~/.vim/rc/にある*.vim(設定ファイル)を読み込む
set runtimepath+=~/.vim/

runtime! rc/0_init.rc.vim
runtime! rc/1_basic.rc.vim
runtime! rc/2_plugin.rc.vim
runtime! rc/3_editor.rc.vim
runtime! rc/4_final.rc.vim
