" gvimでのメニューの文字化け対策
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

" カラースキーマの設定
set t_Co=256
set termguicolors
let g:onedark_termcolors=256
"colorscheme onedark

" set background=dark  "hybridに必要な設定
" colorscheme hybrid

" メニューバーを非表示
"set guioptions=Mc

" ツールバーを非表示
set guioptions-=T

" 左右のスクロールバーを非表示
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" 水平スクロールバーを非表示
set guioptions-=b

" テキストベースのタブラインにする
set guioptions-=e

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

" nvimとvimの設定の違いは以下に記述
if has('nvim')
    call GuiWindowMaximized(1)
    Guifont! Ricty Diminished for Powerline:h13
else
    au GUIEnter * simalt ~x
    set guifont=Ricty_Diminished_for_Powerline:h13
endif

" 一部のUCS文字の幅を自動計測して決める(font設定の後に記述)
if has('kaoriya') || has('nvim')
    set ambiwidth=double
endif
