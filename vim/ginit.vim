" ginit.vim

" --------------------------------------------------------------------------------
" gui用のrcをロードする

" nvim-qtでは_loader.vimを使用せずに直接「80_gui.vim」をロードする
execute 'source' g:vim_dir . '/rc/80_gui.vim'


" _loader.vimで、gvimとvimの設定を振り分けるのに使用
"let g:loaded_guivim = 1
" g:vim_dir/rc/_loader.vimをロードする
"execute 'source' g:vim_dir . '/rc/_loader.vim'
