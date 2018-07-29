" rcファイルのロード設定を記述

" --------------------------------------------------------------------------------
" load function

" vimデフォルトのロード順
" $VIM/vimrc(kaoriya) -> [g:vim_dir/vimrc | ~/.vimrc] -> $VIM/gvimrc(kaoriya) -> [g:vim_dir/gvimrc | ~/.gvimrc]

" rcファイルの場所を設定
let s:rc_dir = expand(g:vim_dir . '/rc')

" rcファイルロード関数(引数で渡されたファイルがあったら、ロードする)
function! s:source_rc(rc_file_name)
    let rc_file = expand(s:rc_dir . '/' . a:rc_file_name)
    if filereadable(rc_file)
        execute 'source' rc_file
    endif
endfunction


" --------------------------------------------------------------------------------
" vim用rc

" vim起動時のみ
if has('vim_starting')
    call s:source_rc('00_init.vim')
endif

call s:source_rc('10_plug_get.vim')

call s:source_rc('11_plug_opt.vim')

call s:source_rc('12_plug_map.vim')

call s:source_rc('20_basic.vim')

call s:source_rc('30_indent.vim')

call s:source_rc('40_keymap.vim')

" --------------------------------------------------------------------------------
" gvim用rc  (nvim-qtでは「ginit.vim」から直接「80_gui.vim」をロードする)

" gvimrcを使用せずにvimrcのgui_runningでGUIの設定を行う
" ※kaoriya版だとロード順的に$VIM/gvimrcに設定を上書きされるので$VIM/gvimrcを削除する
if has('gui_running')
    call s:source_rc('80_gui.vim')
endif


