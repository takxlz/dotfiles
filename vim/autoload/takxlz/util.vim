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


" タブのラベル文字を変更する関数（lightline依存）
function! takxlz#util#change_tab_label() abort
    let l:instr = input('INPUT NEW TAB LABEL: ')
    if l:instr == '' || l:instr == ' '
        redraw!
        echo ''
        return
    endif

    let t:name = l:instr
    " 画面の更新
    redraw!
    echo ''
endfunction


" カレント行/列を3秒間だけハイライトする関数
function! takxlz#util#hi_cursorrc_3sec(...) abort
    set cursorline
    setlocal cursorcolumn
    call timer_start(3000, function('takxlz#util#hi_nocursorrc_3sec'))
endfunction
function! takxlz#util#hi_nocursorrc_3sec(...) abort
    set nocursorline
    setlocal nocursorcolumn
endfunction


" カーソル下の単語をハイライトする関数
function! takxlz#util#hi_words() abort
    " 初回呼び出しの場合はハイライト状態を初期化する
    if exists('g:hlstate') == 0
        let g:hlstate = ''
    endif

    " アンエスケープ化
    let g:hlstate = takxlz#util#toggle_escape(g:hlstate, 0)

    " zレジストリにカーソル下の単語をヤンク(yiw)
    exec 'silent normal "zyiw'

    " カーソル下の単語が既にハイライト対象の場合は対象から削除する
    if stridx(g:hlstate, '<' . @z . '>') != -1

        " ハイライト対象の2単語目以降に登録されている場合
        if stridx(g:hlstate, '|<' . @z . '>') != -1
            let g:hlstate = substitute(g:hlstate, '|<' . @z . '>', '', 'g')

        " ハイライト対象の1単語目に登録されている場合
        else
            let g:hlstate = substitute(g:hlstate, '<' . @z . '>', '', 'g')
        endif

    " カーソル下の単語がハイライト対象でない場合は対象に追加する
    else
        let g:hlstate = g:hlstate == '' ? (g:hlstate . '<' . @z . '>') : (g:hlstate . '|<' . @z . '>')
    endif

    " エスケープ化
    let @/ = takxlz#util#toggle_escape(g:hlstate, 1)
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
        let l:tgt = substitute(l:tgt, '#', '\\#', 'g')
    " アンエスケープ化
    elseif a:flg == 0
        let l:tgt = substitute(l:tgt, '\\<', '<', 'g')
        let l:tgt = substitute(l:tgt, '\\>', '>', 'g')
        let l:tgt = substitute(l:tgt, '\\|', '|', 'g')
        let l:tgt = substitute(l:tgt, '\\#', '#', 'g')
    endif
    call setpos('.', cursor_point)
    return tgt
endfunction
