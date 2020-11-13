" source：処理対象（リスト型）（1行でシェルをcall -> 'source': cat ~/dotfiles/vim/vimrc'）
" sink：sourceに対する処理（関数型）
nnoremap <;>(fzf-open-vimrc) :call fzf#run({
    \ 'source': <SID>read_my_vimrc(),
    \ 'sink': function('<SID>echo_vimrc_line'),
    \ 'down': '40%',
    \ })<CR>

function! s:read_my_vimrc() abort
    if has('win64') | return split(system('type %HOMEPATH%\dotfiles\vim\vimrc'), '\n') | endif
    return split(system('cat ~/dotfiles/vim/vimrc'), '\n')
endfunction

function! s:echo_vimrc_line(line) abort
    echomsg a:line
endfunction
