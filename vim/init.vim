" vimrc

" --------------------------------------------------------------------------------
" _loaderのロードと確実に最初に必要な設定のみを記述

" windowsでのディレクトリ区切り文字を「/」にする
set shellslash

" このファイル(vimrc)の場所を「g:vim_dir」に設定し、以後パスを設定するときはこの環境変数を使用する
" winでは「~/vimfiles」、unixでは「~/.vim」を使用している場合でもこの違いを吸収する
let g:vim_dir = expand('<sfile>:p:h')

" g:vim_dir/rc/_loader.vimをロードする
execute 'source ' g:vim_dir . '/rc/_loader.vim'
