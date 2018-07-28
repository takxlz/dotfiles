" ginit.vim

" --------------------------------------------------------------------------------
" _loaderのロードと確実に最初に必要な設定のみを記述

" _loader.vimで、gvimとvimの設定を振り分けるのに使用
let g:loaded_guivim = 1

" g:vim_dir/rc/_loader.vimをロードする
execute 'source ' g:vim_dir . '/rc/_loader.vim'
