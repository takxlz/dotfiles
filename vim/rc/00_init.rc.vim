" ----------------------------------------------------------------------
" initialize(vim_starting)

" vi互換の動作を無効化する
if &compatible
    set nocompatible
endif

" エンコーディングをutf8にする(plugin.rc.vimより先に設定)
" lightlineのセパレータ文字である「\u2b82」等の「\(エン)」がutf8でないと文字化けしエラーになる
set encoding=utf-8

" 256色の使用を有効にする
set t_Co=256

" 「~/.cache/vim_tmpfiles」がない場合は作成する
if !isdirectory(expand('~/.cache/vim_tmpfiles'))
    call mkdir(expand('~/.cache/vim_tmpfiles'), 'p')
endif


" ------------------------------
" disable default plugins

let g:loaded_2html_plugin      = 1  " vimで表示している状態をhtml化するプラグイン
let g:loaded_gzip              = 1  " 圧縮されたファイルをvimで編集するプラグイン
let g:loaded_tarPlugin         = 1  " tarプラグイン
let g:loaded_zipPlugin         = 1  " zipプラグイン
let g:loaded_matchparen        = 1  " 対応する括弧の可視化するプラグイン(別プラグインを使用)
let g:loaded_netrwFileHandlers = 1  " netrw(ファイラ)プラグイン
let g:loaded_netrwPlugin       = 1  " netrw(ファイラ)プラグイン
let g:loaded_vimballPlugin     = 1  " パッケージマネージャプラグイン
let g:loaded_getscriptPlugin   = 1  " vim scriptの最新バージョンを検索するプラグイン
let g:loaded_tutor_mode_plugin = 1  " vimチュートリアルプラグイン
