" 自作関数を定義する

" 空行の空白を削除する関数
function! takxlz#util#remove_dust()
    let cursor_point = getpos(".")
    " 置換対象が見つからないとエラーになるのでtry-endtryで囲む
    try
        execute ":%s/^ *$//g"
    catch
    finally
        call setpos(".", cursor_point)
        unlet cursor_point
    endtry
endfunction


" ペインの最大化トグル関数
" let g:takxlz_is_maximize = 0
function! takxlz#util#toggle_maximize_window()
    if g:takxlz_is_maximize == 1
        exec "normal \<C-w>="
        let g:takxlz_is_maximize = 0
    else
        :resize
        :vertical resize
        let g:takxlz_is_maximize = 1
    endif
endfunction
