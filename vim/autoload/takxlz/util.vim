" 自作関数を定義する

" 空行の空白を削除する関数
function! takxlz#util#remove_dust() abort
    let l:cursor_point = getpos('.')
    " 置換対象が見つからないとエラーになるのでtry-endtryで囲む
    try
        exec ':%s/^ *$//g'
    catch
    finally
        call setpos('.', cursor_point)
    endtry
endfunction



" ペインの最大化トグル関数
function! takxlz#util#toggle_maximize_window() abort
    if g:takxlz_is_maximize == 1
        exec "normal \<C-w>="
        let g:takxlz_is_maximize = 0
    else
        :resize
        :vertical resize
        let g:takxlz_is_maximize = 1
    endif
endfunction


" カーソル下の単語をハイライトする関数
function! takxlz#util#hilight_words() abort

    " 初回呼び出しの場合はハイライト状態を初期化する
    if exists('g:hlstate') == 0
        let g:hlstate = ''
    endif

    let g:hlstate = takxlz#util#toggle_escape(g:hlstate, 0)  " アンエスケープ化

    " zレジストリにカーソル下の単語をヤンク(yiw)
    exec 'silent normal "zyiw'

    if stridx(g:hlstate, '<' . @z . '>') != -1
        if stridx(g:hlstate, '|<' . @z . '>') != -1
            let g:hlstate = substitute(g:hlstate, '|<' . @z . '>', '', 'g')
        else
            let g:hlstate = substitute(g:hlstate, '<' . @z . '>|', '', 'g')
        endif
    else
        let g:hlstate = g:hlstate == '' ? (g:hlstate . '<' . @z . '>') : (g:hlstate . '|<' . @z . '>')
    endif

    let @/ = takxlz#util#toggle_escape(g:hlstate, 1)  " エスケープ化

endfunction



" ヘルパー関数
" -------------------------------------------------------------------------------------

" 渡された文字列から対象の文字をエスケープ/アンエスケープ化する関数
function! takxlz#util#toggle_escape(target, flg) abort
    let l:tgt = a:target
    let l:cursor_point = getpos('.')
    " エスケープ化
    if a:flg == 1
        let l:tgt = substitute(l:tgt, '<', '\\<', 'g')
        let l:tgt = substitute(l:tgt, '>', '\\>', 'g')
        let l:tgt = substitute(l:tgt, '|', '\\|', 'g')
    " アンエスケープ化
    elseif a:flg == 0
        let l:tgt = substitute(l:tgt, '\\<', '<', 'g')
        let l:tgt = substitute(l:tgt, '\\>', '>', 'g')
        let l:tgt = substitute(l:tgt, '\\|', '|', 'g')
    endif
    call setpos('.', cursor_point)
    return tgt
endfunction
