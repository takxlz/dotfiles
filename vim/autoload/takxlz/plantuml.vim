
" TODO: 適当に作ったので綺麗にする
" plantumlのリレーションを左右で入れ替える関数
function! takxlz#plantuml#swap_current_line_relation() abort
    " 現在行を取得して空白で分割する
    let l:line = getline('.')
    let l:line_elm = split(l:line, ' ')

    " 真ん中の要素の文字列を逆順にする
    let l:i = strlen(l:line_elm[1])
    let l:tmp_list = []
    while i > 0
        let i = i - 1
        let l:tmp_list = add(tmp_list, strpart(l:line_elm[1], i, 1))
    endwhile
    let reverse_elm1 = join(l:tmp_list, '')

    " 真ん中の要素を加工する
    let l:edit_elm1 = substitute(l:reverse_elm1, '{', '###', 'g')
    let l:edit_elm1 = substitute(l:edit_elm1, '}', '{', 'g')
    let l:edit_elm1 = substitute(l:edit_elm1, '###', '}', 'g')

    let l:swap_elm = line_elm[2] . ' ' . l:edit_elm1 . ' ' . line_elm[0]
    call setline('.', l:swap_elm)
endfunction

