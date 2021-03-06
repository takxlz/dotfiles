" rcファイルのロード設定を記述

" --------------------------------------------------------------------------------
" load function

" vimデフォルトのロード順
" $VIM/vimrc(kaoriya) -> [g:vimrc_dir/vimrc | ~/.vimrc] -> $VIM/gvimrc(kaoriya) -> [g:vimrc_dir/gvimrc | ~/.gvimrc]

" rcファイルロード関数(引数で渡されたファイルがあったら、ロードする)
function! s:source_rc(rc_file_name)
    let rc_file = g:vimrc_dir . '/rc/' . a:rc_file_name
    if filereadable(rc_file)
        execute 'source' rc_file
    endif
endfunction


" --------------------------------------------------------------------------------
" vim用rc

if has('vim_starting') | call s:source_rc('00_init.vim') | endif
call s:source_rc('10_dein.vim')
call s:source_rc('20_basic.vim')
call s:source_rc('30_lang.vim')
call s:source_rc('40_keymap.vim')

" --------------------------------------------------------------------------------
" gvim用rc  (nvim-qtでは「ginit.vim」から直接「80_gui.vim」をロードする)

" gvimrcを使用せずにvimrcのgui_runningでGUIの設定を行う
" ※kaoriya版だとロード順的に$VIM/gvimrcに設定を上書きされるので$VIM/gvimrcを削除する
if has('gui_running')
    call s:source_rc('80_gui.vim')
endif


