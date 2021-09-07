""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :init config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" このファイルの場所を定義（以降、この変数を使用する）
let g:vimrc_dir = expand('<sfile>:p:h')


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :plug config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.cache/plugged-vscode')

" EXTEND-VISUAL
Plug 'google/vim-searchindex'

" EXTEND-ACTION
Plug 'tpope/vim-repeat'
Plug 'kana/vim-submode'
Plug 'rhysd/clever-f.vim'

" TEXTOBJ/OPERATOR
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'              " kana/vim-textobj-userに依存 (i)
Plug 'kana/vim-textobj-entire'              " kana/vim-textobj-userに依存 (e)
Plug 'thinca/vim-textobj-between'           " kana/vim-textobj-userに依存 (f)
Plug 'Julian/vim-textobj-variable-segment'  " kana/vim-textobj-userに依存 (v)
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'            " kana/vim-operator-userに依存 (_)
Plug 'tpope/vim-surround'                   " (s)
Plug 'tpope/vim-commentary'                 " (gc)

" FORMAT
Plug 'junegunn/vim-easy-align',    { 'on': '<Plug>(EasyAlign)' }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :basic config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shortmess+=I
set updatetime=200

" 「~/.cache/vim_tmpfiles」がない場合は作成する
if !isdirectory(expand('~/.cache/vim_tmpfiles/')) | call mkdir(expand('~/.cache/vim_tmpfiles'), 'p') | endif

" nvimとvimの設定の違いは以下に記述
if !has('nvim')
    set directory=~/.cache/vim_tmpfiles/
    set backupdir=~/.cache/vim_tmpfiles/
    set viminfo+=n~/.cache/vim_tmpfiles/.viminfo
    set undodir=~/.cache/vim_tmpfiles/
endif

" 改行のときの自動コメントを無効化
autocmd FileType * setlocal formatoptions-=ro


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :keymap config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [s]:     ウィンドウ、タブ操作用のプレフィックス
" [;]:     自作関数用のプレフィックス（;;のみファイラを開く）
" [,]:     コンテキスト
" [space]: プラグイン用のプレフィックス

" xとsではヤンクしない(_レジスタは消去用レジスタ)
nnoremap x "_x
nnoremap s "_s

" ペイン(vscode)
nnoremap <silent> ss <Cmd>call VSCodeNotify('workbench.action.splitEditorDown')<CR>
nnoremap <silent> sv <Cmd>call VSCodeNotify('workbench.action.splitEditorRight')<CR>
nnoremap sj <Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
nnoremap sk <Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
nnoremap sl <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>
nnoremap sh <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
nnoremap s> <Cmd>call VSCodeNotify('workbench.action.increaseViewWidth')<CR>
nnoremap s< <Cmd>call VSCodeNotify('workbench.action.decreaseViewWidth')<CR>
nnoremap s+ <Cmd>call VSCodeNotify('workbench.action.increaseViewHeight')<CR>
nnoremap s- <Cmd>call VSCodeNotify('workbench.action.decreaseViewHeight')<CR>

" フォーカス(vscode)
nnoremap <silent> ,ee <Cmd>call VSCodeNotify('workbench.files.action.focusFilesExplorer')<CR>
nnoremap <silent> ,ss <Cmd>call VSCodeNotify('workbench.view.search.focus')<CR>
nnoremap <silent> ,gg <Cmd>call VSCodeNotify('workbench.scm.focus')<CR>
nnoremap <silent> ,dd <Cmd>call VSCodeNotify('workbench.debug.welcome.focus')<CR>

" nnoremap <C-j> <Cmd>call VSCodeNotify('selectNextSuggestion')<CR>
" nnoremap <C-k> <Cmd>call VSCodeNotify('selectPrevSuggestion')<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :plugin config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-operator-replace
if isdirectory(expand("~/.cache/plugged-vscode/vim-operator-replace/"))
    map _ <Plug>(operator-replace)
endif

" vim-commentary
xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

" vim-easy-align
if isdirectory(expand("~/.cache/plugged-vscode/vim-easy-align/"))
    vmap <Enter> <Plug>(EasyAlign)
endif

" vim-table-mode
if isdirectory(expand("~/.cache/plugged-vscode/vim-table-mode/"))
    let g:table_mode_corner = '|'
    noremap <silent> <space>t :TableModeToggle<CR>
    noremap <silent> <space>T :Tableize<CR>
endif
