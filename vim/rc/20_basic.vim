" 基本的な設定を記述

" --------------------------------------------------------------------------------
" basic

" 起動時に「~/」に移動
execute 'cd' expand('~/')

" 自動で開いたファイルの場所に移動
set autochdir

" カラースキームの設定
let g:onedark_termcolors=256
colorscheme onedark

" カラースキームを適用していても、背景をターミナルの背景色に合わせる
hi Normal ctermbg=NONE

" マークダウンで*や_が隠れるのを無効化する
" ※ indentlineプラグインが設定を上書きしてしまうのでindentlineの設定でマークダウン、helpを除外している
set conceallevel=0

" オープニングメッセージを非表示
set shortmess+=I

" 行番号を表示
set number

" カレント行をハイライト ※重くなる
" set cursorline

" クリップボードを共有する，マウスの有効化
if has('nvim')
    set clipboard=unnamed
    set mouse=a
else
    set clipboard=unnamed,autoselect
endif

" コマンドの補完
set wildmenu
set history=5000

" 入力中のコマンドを右下に表示
set showcmd

" 不可視文字を表示（タブを>-で表示）
set list
set listchars=tab:>-,trail:_

" キーバインドの待機時間の設定
set timeout timeoutlen=1000 ttimeoutlen=0

" vimでのプラグインなどの反映時間
set updatetime=200

" xとsではヤンクしない(_レジスタは消去用レジスタ)
nnoremap x "_x
nnoremap s "_s

" tmpファイルの作成場所を変更
if has('nvim')
    
else
    set directory=~/.cache/vim_tmpfiles/
    set backupdir=~/.cache/vim_tmpfiles/
    set viminfo+=n~/.cache/vim_tmpfiles/.viminfo
    set undodir=~/.cache/vim_tmpfiles/
endif

" フォールディング文字列を、LeafCage/foldCC.vimの文字列にする
set foldtext=FoldCCtext()

" フォールディングマーカーを以下の形式で埋め込む「◯◯//◯｛｛｛」
set commentstring=\ \ //\ %s

" フォールディングをmarkerに設定
set foldmethod=marker

" フォールディング行の色
hi Folded gui=NONE term=standout ctermbg=darkgray ctermfg=NONE guibg=gray23 guifg=NONE

" 縦分割「|」、フォールディンを「 」、diffを「-」に変更
 set fillchars=vert:\|,fold:\ ,diff:-

" マークダウンファイルを自動で折り畳まないようにする
let g:vim_markdown_folding_disabled=1

" ウィンドウ分割したときのウィンドウ境界線の色を指定
hi VertSplit gui=NONE guifg=gray30 guibg=NONE cterm=NONE ctermfg=darkgray ctermbg=NONE

" macとunixだけの設定
if has('mac') || has('unix')
    set mouse=a  " マウス・トラックパッドを有効化
    set backspace=indent,eol,start  " BSの設定(ターミナルではBSが効かないことがある)
endif

" let g:python3_host_prog=exepath('python')

