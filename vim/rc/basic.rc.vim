" ==================== basic.rc.vim ====================

" シンタックスをon ※deinの設定より後に記述する
syntax on

" エンコーディングをutf8にする
set encoding=utf-8

" ファイルタイプ検出と各種プラグインの有効
filetype plugin indent on


" エンコーディング設定より後に記述する
" ----- カラースキーマ -----
set t_Co=256
let g:onedark_termcolors=256
colorscheme onedark

" 縦分割スプリッタを「|」、フォールディングスプリッタを「 」、ディフの削除された行を「-」に変更
set fillchars=vert:\|,fold:\ ,diff:-

" ウィンドウ分割したときのウィンドウ境界線の色を指定
hi VertSplit gui=NONE guifg=gray30 guibg=NONE cterm=NONE ctermfg=darkgray ctermbg=NONE

" フォールディング行の色
hi Folded gui=NONE term=standout ctermbg=darkgray ctermfg=NONE guibg=gray23 guifg=NONE

" マークダウンファイルを自動で折り畳まないようにする
let g:vim_markdown_folding_disabled=1

" カラースキームを適用していても、背景をターミナルの背景色に合わせる
hi Normal ctermbg=NONE

" オープニングメッセージを非表示
set shortmess+=I

" 改行のときの自動コメントを無効化
autocmd FileType * setlocal formatoptions-=ro

" インサートモードからノーマルモードへ戻るスピードを早くする
set timeout timeoutlen=900 ttimeoutlen=50

" vimでのプラグインなどの反映時間を200msに設定
set updatetime=200

" 行番号を表示
set number

" カレント行をハイライト ※重くなる
" set cursorline

" 対応する括弧の可視化を消す(高速なプラグインで可視化しているので)
let g:loaded_matchparen = 1

" コマンドの補完
set wildmenu
set history=5000

" 入力中のコマンドを右下に表示
set showcmd

" 不可視文字を表示（タブを>-で表示）
set list
set listchars=tab:>-,trail:_

" tmpファイルの作成場所を変更
if (has('win32') || has('win64'))
    set directory=~/vimfiles/_tmpfiles/
    set backupdir=~/vimfiles/_tmpfiles/
    set viminfo+=n~/vimfiles/_tmpfiles/.viminfo
    set undodir=~/vimfiles/_tmpfiles/
else
    set directory=~/.vim/_tmpfiles/
    set backupdir=~/.vim/_tmpfiles/
    set viminfo+=n~/.vim/_tmpfiles/.viminfo
    set undodir=~/.vim/_tmpfiles/
endif

" クリップボードを共有する
set clipboard=unnamed,autoselect

" フォールディングをmarkerに設定
set foldmethod=marker

" macとunixだけの設定
if has('mac') || has('unix')
    " マウス、トラックパッドを有効にする(macだとitermのみ)
    set mouse=a
    " iモードでのバックスペースの設定(ターミナルのvimではBSが効かないことがあるので)
    set backspace=indent,eol,start
endif
