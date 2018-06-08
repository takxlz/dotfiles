


let g:vim_home = fnamemodify(expand('<sfile>'), ':h')

" rcファイル読み込み関数
let s:rc_dir = expand(g:vim_home . '/rc')
function! s:source_rc(rc_file_name)
    let rc_file = expand(s:rc_dir . '/' . a:rc_file_name)
    if filereadable(rc_file)
        execute 'source' rc_file
    endif
endfunction

if exists('g:loaded_gvimrc') && g:loaded_gvimrc
    call s:source_rc('gui.rc.vim')
    finish
endif

call s:source_rc('dein.rc.vim')
call s:source_rc('basic.rc.vim')
call s:source_rc('plugin.rc.vim')
call s:source_rc('lang.rc.vim')
call s:source_rc('mapping.rc.vim')


