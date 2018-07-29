" プラグインのオプションの設定を記述

" --------------------------------------------------------------------------------
" lightline {{{

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

function! LightLineWinform()
    return winwidth(0) > 50 ? 'w' . winwidth(0) . ':' . 'h' . winheight(0) : ''
endfunction

function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? (winwidth(0) <=120 ? expand('%:t') : expand('%:p')) : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? "⭤" : ''
endfunction

function! LightLineModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : (&modified ? '+' : (&modifiable ? '' : '-'))
endfunction

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

function! LightLineFileencoding()
    return winwidth(0) > 60 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
    return winwidth(0) > 80 ? (strlen(&filetype) ? &filetype : 'no_ft') : ''
endfunction

function! LightLineMode()
    return winwidth(0) > 30 ? lightline#mode() : ''
endfunction

function! LightLineALE()
    let l:count = ale#statusline#Count(bufnr(''))
    let l:errors = l:count.error + l:count.style_error
    let l:warnings = l:count.warning + l:count.style_warning
    return l:count.total == 0 ? '' : 'E:' . l:errors . ' W:' . l:warnings
endfunction

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"let g:ale_statusline_format = [ 'Error %d', 'Warning %d', '' ]
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'

" コードチェック後に、lightline#update()をcallし、lightlineの表示を更新する
augroup LightLineUpdate
    autocmd!
    autocmd User ALELint call lightline#update()
augroup END
" }}}



" --------------------------------------------------------------------------------
" unite

" インサートモードで開始しない
let g:unite_enable_start_insert=0

let g:unite_source_history_yank_enable =1

let g:unite_source_file_mru_limit = 200



" --------------------------------------------------------------------------------
" deoplete
if has('nvim')
    let g:deoplete#enable_at_startup = 1
endif


" --------------------------------------------------------------------------------
" vimfiler

"let g:vimfiler_enable_auto_cd = 1



" --------------------------------------------------------------------------------
" ale

"  左側に常にシンボル用のスペースを開けておく
let g:ale_sign_column_always = 1

" エラーリストを表示する
"let g:ale_open_list = 1

" シンボルを変更
"let g:ale_sign_error = 'E'
"let g:ale_sign_warning = 'W'

let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" エラー一覧リストをトグルする自作関数
function! AleListToggle()
    " ALEが起動していないときは終了する
    if !exists('g:ale_open_list')
        return
    endif
    
    " listが0(off)のときは1(on)にして、1のときは0にする
    if(g:ale_open_list == 0) 
        ALEDisableBuffer  " 一旦aleを終了(ale起動中に変数を変えても反映されないので)
        let g:ale_open_list = 1
        ALEEnableBuffer  " aleを再度起動
    else
        let g:ale_open_list = 0
        " 下のウィンドウに移動してからウィンドウを消す
        execute ":wincmd j"
        execute ":q"
    endif
endfunction



" --------------------------------------------------------------------------------
" git-gutter

if exists('&signcolumn')  " Vim 7.4.2201
    set signcolumn=yes
else
    let g:gitgutter_sign_column_always = 1
endif



" --------------------------------------------------------------------------------
" tcomment

noremap [tcomment] <Nop>
map <Space>t [tcomment]



" --------------------------------------------------------------------------------
" vim-cheatsheet

let g:cheatsheet#cheat_file = g:vim_dir . '/doc/keymap.md'

" cheatsheet opens vertical splited pane(def:0)
let g:cheatsheet#vsplit = 1



" --------------------------------------------------------------------------------
" vim-table-mode

let g:table_mode_corner = '|'



" --------------------------------------------------------------------------------
" indentLine

let g:indentLine_fileTypeExclude = ['help', 'markdown', 'md']
