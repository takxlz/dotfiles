" ==================== plugin_rc.vim ====================
" ----- lightline -----
set laststatus=2
let g:lightline = {
            \ 'colorscheme': 'onedark',
            \ 'mode_map': {'c': 'NORMAL'},
            \ 'active': {
            \   'right': [ [ 'lineinfo' ],
            \              [ 'percent' ],
            \              [ 'winform' ],
            \              [ 'fileformat', 'fileencoding', 'filetype' ] ],
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'fugitive', 'branch', 'filename', 'ale' ],
            \             [ 'tmp' ] ]
            \ },
            \ 'component_function': {
            \   'linetotal': 'LightLineTotal',
            \   'modified': 'LightLineModified',
            \   'readonly': 'LightLineReadonly',
            \   'fugitive': 'LightLineFugitive',
            \   'filename': 'LightLineFilename',
            \   'filepath': 'LightLineFilepath',
            \   'fileformat': 'LightLineFileformat',
            \   'filetype': 'LightLineFiletype',
            \   'fileencoding': 'LightLineFileencoding',
            \   'mode': 'LightLineMode',
            \   'winform': 'LightLineWinform'
            \ },
            \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
            \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
            \ 'component_expand': {
            \   'ale': 'ale#statusline#Count()'
            \ },
            \ 'component_type': {
            \   'ale': 'error'
            \ }
            \ }

let g:lightline.component = { 'lineinfo': '%3l[%L]:%-2v'}

let g:ale_statusline_format = [ 'Error %d', 'Warning %d', '' ]

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" コードチェック後に、lightline#update()をcallし、lightlineの表示を更新する
augroup lihtnlineUpdate
    autocmd!
    autocmd User ALELint call lightline#update()
augroup END

function! LightLineWinform()
    return winwidth(0) > 50 ? 'w' . winwidth(0) . ':' . 'h' . winheight(0) : ''
endfunction

function! LightLineModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? "⭤" : ''
endfunction

" 3項演算子（foo == bar ? trueのとき : falseのとき）
" '' != expand('%:t') ? 【winwidth(0) <=120 ? 『expand('%:t') : expand('%:p')』 : '[No Name]'】)
" ようするに，if【 true  if『 true : false 』 : false 】
" ファイル名(%:t)が空白('')でない? 【窓のサイズが120以下のとき? 『ファイル名(%:t)を表示 : フルパス(%:p)を表示』： NoNameと表示】
function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
                \  &ft == 'unite' ? unite#get_status_string() :
                \  &ft == 'vimshell' ? vimshell#get_status_string() :
                \ '' != expand('%:t') ? winwidth(0) <=120 ? expand('%:t') : expand('%:p') : '[No Name]') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFilepath()
    return winwidth(0) <=120 ? expand('%:h') : ''
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

function! LightLineFileformat()
    return winwidth(0) > 80 ? &fileformat : ''
endfunction

function! LightLineFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
    return winwidth(0) > 60 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
    return winwidth(0) > 30 ? lightline#mode() : ''
endfunction

function! s:syntastic()
    SyntasticCheck
    call lightline#update()
endfunction


" ----- ALE -----
"  左側に常にシンボル用のスペースを開けておく
let g:ale_sign_column_always = 1

" シンボルを変更
"let g:ale_sign_error = 'E'
"let g:ale_sign_warning = 'W'

let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" エラー一覧リストをトグルする自作関数
function! AleListToggle()
    " listが0(off)のときは1(on)にして、1のときは0にする
    if(g:ale_open_list == 0) 
        ALEDisable  " 一旦aleを終了(ale起動中に変数を変えても反映されないので)
        let g:ale_open_list = 1
        ALEEnable  " aleを再度起動
    else
        let g:ale_open_list = 0
        " 下のウィンドウに移動してからウィンドウを消す
        execute ":wincmd j"
        execute ":q"
    endif
endfunction


" ----- neocomplete -----
" AutoComplPopを無効化
let g:acp_enableAtStartup = 0

" neocomplcacheを有効化
let g:neocomplete#enable_at_startup = 1

" 大文字が入力されるまで、大文字小文字を区別しない
let g:neocomplcache_enable_smart_case = 1

" シンタックスをキャッシュする最小文字長
let g:neocomplcache_min_syntax_length = 4

" =右のファイル名のときは、neocomplcacheをロックする
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" ファイルタイプごとにneocomplcacheのディクショナリを設定する
let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : ''
            \ }


" ----- unite -----
" インサートモードで開始しない
let g:unite_enable_start_insert=0

let g:unite_source_history_yank_enable =1

let g:unite_source_file_mru_limit = 200


" ----- vimfiler -----
let g:vimfiler_enable_auto_cd = 1


" ----- git-gutter -----
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif


" ----- foldCC -----
" フォールディング文字列を、LeafCage/foldCC.vimの文字列にする
set foldtext=FoldCCtext()

" フォールディングマーカーを以下の形式で埋め込む「◯◯//◯｛｛｛」
set commentstring=\ \ //\ %s