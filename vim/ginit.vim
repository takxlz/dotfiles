" ginit.vim

" --------------------------------------------------------------------------------
" gui用のrcをロードする

" nvim-qtでは_loader.vimを使用せずに直接「80_gui.vim」をロードする
let gui_file = expand(g:vim_dir . '/rc/80_gui.vim')
if filereadable(gui_file) | execute 'source' gui_file | endif

" _loader.vimで、gvimとvimの設定を振り分けるのに使用
"let g:loaded_guivim = 1
" g:vim_dir/rc/_loader.vimをロードする
"execute 'source' g:vim_dir . '/rc/_loader.vim'
