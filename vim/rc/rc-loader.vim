
if (has('win32') || has('win64'))
    let g:vim_home = expand('~/vimfiles')
elseif (has('mac') || has('unix'))
    let g:vim_home = expand('~/.vim)
else
    let g:vim_home = expand('~/.vim)
endif


" rcファイル読み込み関数
let s:rc_dir = expand(g:vim_home . '/rc')
function! s:source_rc(rc_file_name)
    let rc_file = expand(s:rc_dir . '/' . a:rc_file_name)
    if filereadable(rc_file)
        execute 'source' rc_file
    endif
endfunction

call s:source_rc('dein.rc.vim')
call s:source_rc('basic.rc.vim')
call s:source_rc('plugin.rc.vim')
call s:source_rc('lang.rc.vim')
call s:source_rc('mapping.rc.vim')


