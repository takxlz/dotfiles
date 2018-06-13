" ==================== _rc-loader.vim ====================
" 分割したrcファイルのロードを行う

" 設定ファイルのロード順
" vimrc -> _rc-loader.vim -> (vim用の各rc) -> gvimrc -> _rc-loader.vim -> (gvim用の各rc)


" rcファイルの場所を設定
let s:rc_dir = expand(g:vim_dir . '/rc')

" rcファイルロード関数(引数で渡されたファイルがあったら、ロードする)
function! s:source_rc(rc_file_name)
    let rc_file = expand(s:rc_dir . '/' . a:rc_file_name)
    if filereadable(rc_file)
        execute 'source' rc_file
    endif
endfunction

" gvimのときだけ、以下を実行(最後にfinishし、endif以下の設定を再度読み込まないようにする)
" (※ endif以下は、vimrc -> _rc-loader.vimのときに既に読み込まれている)
if exists('g:loaded_gvimrc') && g:loaded_gvimrc
    call s:source_rc('gui.rc.vim')
    finish
endif

" vimのときだけ、以下を実行
call s:source_rc('dein.rc.vim')
call s:source_rc('basic.rc.vim')
call s:source_rc('plugin.rc.vim')
call s:source_rc('lang.rc.vim')
call s:source_rc('mapping.rc.vim')
call s:source_rc('test.rc.vim') " TEST用の設定
