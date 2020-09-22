" readonlyとmodifiedコンポーネントはデフォルトで使わずに、filename(LightLineFilename)で呼び出し加工して使用
" percentコンポーネントはデフォルトで使用
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ 'mode_map': {'c': 'NORMAL'},
    \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
    \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
    \ 'active': {
    \   'right': [['lineinfo'], ['percent'], ['winform'], ['fileencoding','fileformat','filetype'], ['coc_error','coc_warn','coc_hint','coc_info']],
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
    \   'coc_error': 'LightLineCocErrors',
    \   'coc_warn': 'LightLineCocWarns',
    \   'coc_hint': 'LightLineCocHint',
    \   'coc_info': 'LightLineCocInfo',
    \ },
    \ 'component_type': {
    \   'coc_error': 'error',
    \   'coc_warn': 'warning',
    \   'coc_hint': 'middle',
    \   'coc_info': 'tabsel',
    \ },
\ }

function! LightLineWinform()
    return winwidth(0) > 50 ? 'w' . winwidth(0) . ':' . 'h' . winheight(0) : ''
endfunction

function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'defx' ? '' :
        \  &ft == 'denite' ? '' :
        \ '' != expand('%:t') ? (winwidth(0) <=200 ? expand('%:t') : expand('%:p')) : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineReadonly()
    return &ft !~? 'defx\|denite\|help\|gundo' && &readonly ? "⭤" : ''
endfunction

function! LightLineModified()
    return &ft =~ 'defx\|denite\|help\|gundo' ? '' : (&modified ? '+' : (&modifiable ? '' : '-'))
endfunction

function! LightLineFugitive()
    try
        " autoloadはcallされるまでロードされていないのでexists()で判定してはいけない
        " if &ft !~? 'defx\|denite\|help\|gundo' && exists('*fugitive#head') && winwidth(0) > 35
        if &ft !~? 'defx\|denite\|help\|gundo' && winwidth(0) > 55
            let _ = fugitive#head()
            return strlen(_) ? '⭠ '._ : ''
        endif
    catch
        echo "[fugitive] is not loaded"
    endtry
    return ''
endfunction

function! LightLineFileencoding()
    return winwidth(0) > 60 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
    return winwidth(0) > 80 ? (strlen(&filetype) ? '@' . &filetype : '[no_ft]') : ''
endfunction

function! LightLineMode()
    if &ft == 'defx' | return 'Defx' | endif
    " if &ft == 'denite' | return 'Denite' | endif
    " if &ft == 'denite' | return denite#get_status_mode() | endif
    return winwidth(0) > 30 ? lightline#mode() : ''
endfunction

function! LightLineALE()
    if dein#is_sourced('ale') == 0 | return '' | endif
    let l:count = ale#statusline#Count(bufnr(''))
    let l:errors = l:count.error + l:count.style_error
    let l:warnings = l:count.warning + l:count.style_warning
    return l:count.total == 0 ? '' : 'E:' . l:errors . ' W:' . l:warnings
endfunction

function! s:lightline_coc_diagnostic(kind, sign) abort
    let info = get(b:, 'coc_diagnostic_info', 0)
    if empty(info) || get(info, a:kind, 0) == 0
        return ''
    endif
    return printf('%s:%d', a:sign, info[a:kind])
endfunction

function! LightLineCocErrors()
    return s:lightline_coc_diagnostic('error', 'E')
endfunction

function! LightLineCocWarns()
    return s:lightline_coc_diagnostic('warning', 'W')
endfunction

function! LightLineCocHints()
    return s:lightline_coc_diagnostic('hints', 'H')
endfunction

function! LightLineCocInfos()
    return s:lightline_coc_diagnostic('information', 'I')
endfunction

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" コードチェック後に、lightline#update()をcallし、lightlineの表示を更新する
augroup LightLineUpdate
    autocmd!
    autocmd User ALELintPost,CocStatusChange,CocDiagnosticChange call lightline#update()
augroup END
