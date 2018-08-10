" readonlyとmodifiedコンポーネントはデフォルトで使わずに、filename(LightLineFilename)で呼び出し加工して使用
" percentコンポーネントはデフォルトで使用
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ 'mode_map': {'c': 'NORMAL'},
    \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
    \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
    \ 'active': {
    \   'right': [['ale','lineinfo'], ['percent'], ['winform'], ['fileencoding','fileformat','filetype']],
    \   'left' : [['mode','paste'], ['fugitive','filename']]
    \ },
    \ 'component': {
    \   'lineinfo': '%3l[%L]:%-2v',
    \ },
    \ 'component_function': {
    \   'winform': 'LightLineWinform',
    \   'fileformat': 'LightLineFileformat',
    \   'fileencoding': 'LightLineFileencoding',
    \   'filetype': 'LightLineFiletype',
    \   'mode': 'LightLineMode',
    \   'fugitive': 'LightLineFugitive',
    \   'filename': 'LightLineFilename',
    \ },
    \ 'component_expand': {
    \   'ale': 'LightLineALE',
    \ },
    \ 'component_type': {
    \   'ale': 'error',
    \ }
\ }
" ----------------------------------------
function! LightLineWinform()
    return winwidth(0) > 50 ? 'w' . winwidth(0) . ':' . 'h' . winheight(0) : ''
endfunction
" ----------------------------------------
function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? (winwidth(0) <=120 ? expand('%:t') : expand('%:p')) : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction
" ----------------------------------------
function! LightLineReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? "⭤" : ''
endfunction
" ----------------------------------------
function! LightLineModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : (&modified ? '+' : (&modifiable ? '' : '-'))
endfunction
" ----------------------------------------
function! LightLineFugitive()
    try
        if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && winwidth(0) > 55
            let _ = fugitive#head()
            return strlen(_) ? '⭠ '._ : ''
        endif
    catch
    endtry
    return ''
endfunction
" ----------------------------------------
function! LightLineFileencoding()
    return winwidth(0) > 60 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction
" ----------------------------------------
function! LightLineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction
" ----------------------------------------
function! LightLineFiletype()
    return winwidth(0) > 80 ? (strlen(&filetype) ? &filetype : 'no_ft') : ''
endfunction
" ----------------------------------------
function! LightLineMode()
    return winwidth(0) > 30 ? lightline#mode() : ''
endfunction
" ----------------------------------------
function! LightLineALE()
    if dein#is_sourced('ale') == 0 | return '' | endif
    let l:count = ale#statusline#Count(bufnr(''))
    let l:errors = l:count.error + l:count.style_error
    let l:warnings = l:count.warning + l:count.style_warning
    return l:count.total == 0 ? '' : 'E:' . l:errors . ' W:' . l:warnings
endfunction
" ----------------------------------------
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" ----------------------------------------
" コードチェック後に、lightline#update()をcallし、lightlineの表示を更新する
augroup LightLineUpdate
    autocmd!
    autocmd User ALELintPost call lightline#update()
augroup END