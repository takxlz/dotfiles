" --------------------------------------------------------------------------------
" [vim-plug]
" ------------------------------
call plug#begin(expand(g:vim_dir . '/_plugged'))
Plug 'kana/vim-submode'
Plug 'itchyny/vim-parenmatch'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentline'
Plug 'w0rp/ale', { 'on': [] }
Plug 'itchyny/lightline.vim'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'LeafCage/foldCC.vim'
Plug 'joshdick/onedark.vim'
Plug 'w0ng/vim-hybrid'
Plug 'junegunn/vim-easy-align'
Plug 'Shougo/denite.nvim', has('nvim') ?   { 'on': 'Denite', 'do': ':UpdateRemotePlugins'} : { 'on': 'Denite' }
Plug 'Shougo/neoyank.vim',                 { 'on': 'Denite'}
Plug 'Shougo/neomru.vim',                  { 'on': 'Denite'}
Plug 'Shougo/deoplete.nvim', has('nvim') ? { 'on': [], 'do': ':UpdateRemotePlugins' } : { 'on': []}
Plug 'Shougo/vimfiler.vim',                { 'on': 'VimFilerExplorer' }
Plug 'Shougo/unite.vim',                   { 'on': 'VimFilerExplorer'}
Plug 'severin-lemaignan/vim-minimap',      { 'on': 'Minimap' }
Plug 'reireias/vim-cheatsheet',            { 'on': 'Cheat' }
Plug 'plasticboy/vim-markdown',            { 'for': ['md', 'markdown'] }
Plug 'kannokanno/previm',                  { 'for': ['md', 'markdown'] }
Plug 'tyru/open-browser.vim',              { 'for': ['md', 'markdown'] }
Plug 'dhruvasagar/vim-table-mode',         { 'for': ['md', 'markdown'] }
if !has('nvim') | Plug 'roxma/nvim-yarp' | Plug 'roxma/vim-hug-neovim-rpc' | endif
call plug#end()
" ------------------------------

" 自作コマンドで指定のプラグインを遅延ロードする
function! MyCommand(name)
    if a:name == 'deoplete' | call plug#load('deoplete.nvim') | endif
endfunction
command! -nargs=1 Start call MyCommand(<f-args>)

" イベントで遅延ロードする (load('foo', 'bar')  ※複数)
augroup load_plug_event
    autocmd!
    autocmd BufRead * call plug#load('deoplete.nvim')
augroup END


" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
" [unite]
let g:unite_enable_start_insert=0
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap [unite] <Nop>
nmap <Space>u [unite]
" カレントディレクトリのファイルとディレクトリの一覧を表示
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" 最近開いたファイルの一覧を表示(neomru.vimが必要)
nnoremap <silent> [unite]r :<C-u>Unite file_mru<CR>
" 開かれているバッファの一覧を表示
nnoremap <silent> [unite]B :<C-u>Unite buffer<CR>
" ヤンク(コピー)の履歴の一覧を表示(neoyank.vimが必要)
nnoremap <silent> [unite]y :<C-u>Unite history/yank<CR>
" レジスタの一覧を表示
nnoremap <silent> [unite]R :<C-u>Unite -buffer-name=register register<CR>
" マッピング一覧
nnoremap <silent> [unite]m :<C-u>Unite mapping<CR>
" ブックマーク一覧
nnoremap <silent> [unite]b :<C-u>Unite bookmark<CR>
" カレントディレクトリ一覧
nnoremap <silent> [unite]d :<C-u>Unite directory<CR>



" --------------------------------------------------------------------------------
" [deoplete] (重いので自作コマンドで発火してロードする)
let g:deoplete#enable_at_startup = 1



" --------------------------------------------------------------------------------
" [vimfiler]
"let g:vimfiler_enable_auto_cd = 1
nnoremap <silent> <Space>d :VimFilerExplorer<CR>



" --------------------------------------------------------------------------------
" [git-gutter]
set signcolumn=yes



" --------------------------------------------------------------------------------
" [indentLine]
let g:indentLine_fileTypeExclude = ['help', 'markdown', 'md']



" --------------------------------------------------------------------------------
" [vim-table-mode]
let g:table_mode_corner = '|'



" --------------------------------------------------------------------------------
" [vim-cheatsheet]
let g:cheatsheet#cheat_file = g:vim_dir . '/doc/keymap.md'
let g:cheatsheet#vsplit = 1



" --------------------------------------------------------------------------------
" [tcomment]
noremap [tcomment] <Nop>
map <Space>t [tcomment]
nnoremap <silent> [tcomment]t :TComment<CR>
nnoremap <silent> [tcomment]b :TCommentBlock<CR>
nnoremap <silent> [tcomment]r :TCommentRight
vnoremap <silent> [tcomment]t :TComment<CR>
vnoremap <silent> [tcomment]b :TCommentBlock<CR>
vnoremap <silent> [tcomment]r :TCommentRight<CR>



" --------------------------------------------------------------------------------
" [vim-easy-align]
vmap <Enter> <Plug>(EasyAlign)



" --------------------------------------------------------------------------------
" [previm]
nnoremap <silent> <Space>m :PrevimOpen<CR>



" --------------------------------------------------------------------------------
" [ale] {{{
let g:ale_sign_column_always = 1
"let g:ale_open_list = 1 "let g:ale_sign_error = 'E' "let g:ale_sign_warning = 'W'

let g:ale_linters = { 'javascript': ['eslint']}

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

nnoremap [ale] <Nop>
nmap <Space>a [ale]
" aleのトグル
nnoremap <silent> [ale]t :call AleListToggle()<CR>
" エラー間の移動
call submode#enter_with('alemove', 'n', 'r', '[ale]k', '<Plug>(ale_previous_wrap)')
call submode#enter_with('alemove', 'n', 'r', '[ale]j', '<Plug>(ale_next_wrap)')
call submode#map('alemove', 'n', 'r', 'k', '<Plug>(ale_previous_wrap)')
call submode#map('alemove', 'n', 'r', 'j', '<Plug>(ale_next_wrap)')
" }}}


" --------------------------------------------------------------------------------
" [lightline] {{{
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



