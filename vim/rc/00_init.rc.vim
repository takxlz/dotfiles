" ----------------------------------------------------------------------
" Initialize(vim_starting)

" vi互換の動作を無効化する
if &compatible
    set nocompatible
endif

" エンコーディングをutf8にする
set encoding=utf-8

" 256色の使用を有効にする
set t_Co=256

" 「~/.cache/vim_tmpfiles」がない場合は作成する
if !isdirectory(expand('~/.cache/vim_tmpfiles'))
    call mkdir(expand('~/.cache/vim_tmpfiles'), 'p')
endif


" ------------------------------
let g:loaded_2html_plugin      = 1

let g:loaded_logiPat           = 1

let g:loaded_getscriptPlugin   = 1

let g:loaded_gzip              = 1

let g:loaded_man               = 1

let g:loaded_matchit           = 1

" 対応する括弧の可視化を無効化(プラグインで可視化)
let g:loaded_matchparen        = 1

let g:loaded_netrwFileHandlers = 1

let g:loaded_netrwPlugin       = 1

let g:loaded_netrwSettings     = 1

let g:loaded_rrhelper          = 1

let g:loaded_shada_plugin      = 1

let g:loaded_spellfile_plugin  = 1

let g:loaded_tarPlugin         = 1

let g:loaded_tutor_mode_plugin = 1

let g:loaded_vimballPlugin     = 1

let g:loaded_zipPlugin         = 1