" -------------------------
" load rc files

" vimデフォルトのロード順
" $VIM/vimrc(kaoriya) -> [g:vim_dir/vimrc | ~/.vimrc] -> $VIM/gvimrc(kaoriya) -> [g:vim_dir/gvimrc | ~/.gvimrc]

" rcファイルの場所を設定
let s:rc_dir = expand(g:vim_dir . '/rc')

" rcファイルロード関数(引数で渡されたファイルがあったら、ロードする)
function! s:source_rc(rc_file_name)
    let rc_file = expand(s:rc_dir . '/' . a:rc_file_name)
    if filereadable(rc_file)
        execute 'source ' rc_file
    endif
endfunction


" -------------------------
" vim用rc

" vim起動時のみ
if has('vim_starting')
    call s:source_rc('00_init.rc.vim')
endif

call s:source_rc('10_plugin.rc.vim')

call s:source_rc('20_basic.rc.vim')

call s:source_rc('30_indent.rc.vim')

call s:source_rc('40_keybind.rc.vim')


" -------------------------
" gvim用rc

" gvimrcを使用せずにvimrcのgui_runningでGUIの設定を行う
" ※kaoriya版だとロード順的に$VIM/gvimrcに設定を上書きされるので$VIM/gvimrcを削除する
if has('gui_running')
    call s:source_rc('80_gui.rc.vim')
endif
