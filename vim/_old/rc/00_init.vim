" 最初に必要な設定を記述

" --------------------------------------------------------------------------------
" initialize

" vi互換の動作を無効化する
if &compatible
    set nocompatible
endif

syntax on
filetype plugin indent on

" エンコーディングをutf8にする(プラグインの設定より先に記述)
" lightlineのセパレータ文字である「\u2b82」等の「\(エン)」がutf8でないと文字化けしエラーになる
set encoding=utf-8

" 256色の使用を有効にする
set t_Co=256

" 「~/.cache/vim_tmpfiles」がない場合は作成する
if !isdirectory(expand('~/.cache/vim_tmpfiles'))
    call mkdir(expand('~/.cache/vim_tmpfiles'), 'p')
endif


" 使用するpythonの場所を指定
if has('mac') || has('unix')
    let g:python3_host_prog=exepath('python3')
else
    " ----------
    " winではpythonとpython3はpythonというコマンドなので3はつけなくていい
    let g:python3_host_prog=exepath('python')
    
    " kaoriya版vimはpython3.5以外だとdllが見つけられずエラーになるので，直接dllの場所を指定する
    if !has('nvim') | set pythonthreedll=~/AppData/Local/Programs/Python/Python38/python38.dll | endif
    " ----------
    " vimのpython3.7で不具合(deopleteなどで使用される構文がdeprecated)があったためpython3.5を使用する
    " 不具合が解消された場合は，上の---で囲まれた設定のコメントアウトを解除し以下をコメントアウトする
    " 2020/01/18だとpython3.5でdeniteがエラーとなったため以下をコメントアウトし、---で囲まれた設定のコメントを外す
    " let g:python3_host_prog=expand('~/AppData/Local/Programs/Python/Python35/python')
endif


" --------------------------------------------------------------------------------
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
