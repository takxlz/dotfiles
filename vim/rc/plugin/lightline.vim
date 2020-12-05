" readonlyとmodifiedコンポーネントはデフォルトで使わずに、filename(LightLineFilename)で呼び出し加工して使用
" percentコンポーネントはデフォルトで使用
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ 'mode_map': {'c': 'NORMAL'},
    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
    \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
    \ 'tabline': {
    \   'left': [['tabs']],
    \   'right': [['close']]
    \ },
    \ 'tab': {
    \   'active': ['tabnum', 'filename', 'modified'],
    \   'inactive': ['tabnum', 'filename', 'modified']
    \ },
    \ 'tab_component_function': {
    \   'filename': 'LightLineTabFilename',
    \   'modified': 'lightline#tab#modified',
    \   'readonly': 'lightline#tab#readonly',
    \   'tabnum': 'lightline#tab#tabnum'
    \ },
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

" active
" \   'left' : [['mode','paste'], ['fugitive','filename'], ['vista']]
" component_function
" \   'vista': 'NearestMethodOrFunction',


" デフォルトではlightline#tab#filenameが使用されるが、加工したいため自作する
function! LightLineTabFilename(n) abort
    "指定したタブ番号のページにt:nameが存在するときはt:nameを返し、存在しなければ""を返す
    " takxlz#util#change_tab_label()で変更可能
    let l:tabname = gettabvar(a:n, 'name', '')
    if l:tabname != ''
        return l:tabname
    endif

    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let l:bname = bufname(buflist[winnr - 1])
    " let l:bname = expand('#' . buflist[winnr - 1] . ':p')
    if l:bname == ''
        let l:bname = '[No Name]'
    elseif l:bname =~ 'FZF'
        let l:bname = '#FZF'
    elseif l:bname =~ 'defx'
        let l:bname = '#DEFX'
    elseif l:bname =~ 'fugitive'
        let l:bname = '#FUGITIVE'
    endif

    return l:bname
endfunction



function! LightLineWinform()
    return winwidth(0) > 50 ? 'w' . winwidth(0) . ':' . 'h' . winheight(0) : ''
endfunction



" ファイル名
function! LightLineFilename()
    let l:filepath = expand('%:p')

    " ファイルパスが30文字を超える場合は、末尾から50文字文切り出す
    let l:filepath_short = strlen(l:filepath) >= 30 ? l:filepath[-30:] : l:filepath


    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft =~ 'defx\|denite' ? '' :
        \  &ft == 'fzf' ? '#FZF' :
        \ '' != expand('%:t') ? (winwidth(0) <=120 ? l:filepath_short : l:filepath) : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineReadonly()
    return &ft !~? 'defx\|denite\|help\|gundo' && &readonly ? "\ue0a2" : ''
endfunction

function! LightLineModified()
    return &ft =~ 'defx\|denite\|help\|gundo' ? '' : (&modified ? '+' : (&modifiable ? '' : '-'))
endfunction



" function! NearestMethodOrFunction() abort
"     " 「b:」バッファローカルの「変数名:値」の辞書の一覧を参照できる
"     " バッファローカル変数一覧にvista_nearest...が存在すればその値を返し、なければ空を返す
"     " return get(b:, 'vista_nearest_method_or_function', '')

"     " 表示文字等を編集したいためgetは使用しない
"     if exists('b:vista_nearest_method_or_function')
"         if b:vista_nearest_method_or_function != ''
"             return ' [f] ' . b:vista_nearest_method_or_function
"         endif
"     endif
"     return ''
" endfunction



function! LightLineFugitive()
    try
        " autoloadはcallされるまでロードされていないのでexists()で判定してはいけない
        " if &ft !~? 'defx\|denite\|help\|gundo' && exists('*fugitive#head') && winwidth(0) > 35
        if &ft !~? 'defx\|denite\|help\|gundo' && winwidth(0) > 55
            let _ = fugitive#head()
            return strlen(_) ? "\ue0a0 "._ : ""
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
    return winwidth(0) > 80 ? (strlen(&filetype) ? "\ue7a3 " . &filetype : '[no_ft]') : ''
endfunction



function! LightLineMode()
    if &ft == 'defx' | return 'Defx' | endif
    " if &ft == 'denite' | return 'Denite' | endif
    " if &ft == 'denite' | return denite#get_status_mode() | endif
    return winwidth(0) > 30 ? lightline#mode() : ''
endfunction



" coc
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

function! s:lightline_coc_diagnostic(kind, sign) abort
    let info = get(b:, 'coc_diagnostic_info', 0)
    if empty(info) || get(info, a:kind, 0) == 0
        return ''
    endif
    return printf('%s:%d', a:sign, info[a:kind])
endfunction



" コードチェック後に、lightline#update()をcallし、lightlineの表示を更新する
augroup LightLineUpdate
    autocmd!
    autocmd User ALELintPost,CocStatusChange,CocDiagnosticChange call lightline#update()
augroup END



" vim起動時に実行
" augroup LightLineStartUp
"     autocmd!
"     autocmd BufReadPost * call vista#RunForNearestMethodOrFunction()
"     autocmd User  call RunForNearestMethodOrFunction lightline#update()
" augroup END



" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" function! LightLineALE()
"     if dein#is_sourced('ale') == 0 | return '' | endif
"     let l:count = ale#statusline#Count(bufnr(''))
"     let l:errors = l:count.error + l:count.style_error
"     let l:warnings = l:count.warning + l:count.style_warning
"     return l:count.total == 0 ? '' : 'E:' . l:errors . ' W:' . l:warnings
" endfunction
