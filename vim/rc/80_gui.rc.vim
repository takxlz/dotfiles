" gui(gvim)の設定を記述

" --------------------------------------------------------------------------------
" gui

" gvimでのメニューの文字化け対策
"source $VIMRUNTIME/delmenu.vim
"set langmenu=ja_jp.utf-8
"source $VIMRUNTIME/menu.vim

" 一部のUCS文字の幅を自動計測して決める
if has('kaoriya')
    set ambiwidth=auto
endif

" 起動時にgvimを最大化
au GUIEnter * simalt ~x

" カラースキーマの設定
set t_Co=256
let g:onedark_termcolors=256
"colorscheme onedark

set background=dark  "hybridに必要な設定
colorscheme hybrid

" フォントの設定
set guifont=Ricty_Diminished_for_Powerline:h13

" メニューバーを非表示
set guioptions=Mc

" ツールバーを非表示
set guioptions-=T

" 左右のスクロールバーを非表示
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" 水平スクロールバーを非表示
set guioptions-=b

" 画面分割などしたときのウィンドウ境界線の色
hi VertSplit gui=NONE guifg=gray30 guibg=NONE cterm=NONE ctermfg=darkgray ctermbg=NONE

" フォールディング行の色
hi Folded gui=NONE term=standout ctermbg=lightgrey ctermfg=NONE guibg=grey23 guifg=NONE

" gvimの背景を半透明にする(0に近いほど透明)
"autocmd GUIEnter * set transparency=230

if has('multi_byte_ime') || has('xim')
    " IME ON時のカーソルの色を設定(設定例:紫)
    highlight CursorIM guibg=Purple guifg=NONE

    " imeをオフにしてnモードに戻る
    inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
    inoremap <silent> っｊ <ESC>:set iminsert=0<CR>
endif
