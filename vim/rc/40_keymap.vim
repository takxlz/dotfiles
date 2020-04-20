" プラグインに依存しないキーバインドの設定を記述

" +------------------------------------+
" |        mode      |   no_re  |  re  |
" |------------------------------------|
" | normal  + visual | noremap  | map  |
" | command + insert | noremap! | map! |
" |       normal     | nnoremap | nmap |
" |       visua      | vnoremap | vmap |
" |      command     | cnoremap | cmap |
" |       insert     | inoremap | imap |
" +------------------------------------+

" <silent> コマンドラインへの表示を抑制(キーバインドからコマンド(:～)を実行する場合に指定)

" submode
" [submode#enter_with]でサブモードを作成する
"   1:作成するサブモード名、2:対象モード(n,i,ni)、3:オプション(リマップするときは[r])、4:サブモードに入るキーバインド、5:サブモードに入った際に行う処理
" [submode#map]で作成したサブモード内でのキーバインドの定義する
"   第1～3引数までは、enter_withと同じ、4:afterキーバインド、5:beforeキーバインド


" --------------------------------------------------------------------------------
" たまに使う機能（固有）
noremap [any] <Nop>
map <Space>a [any]


" --------------------------------------------------------------------------------
" たまに使う機能（プラグイン）
noremap [anyplug] <Nop>
map <Space>s [anyplug]


" --------------------------------------------------------------------------------
" 一般

" escをjjにマッピング
inoremap jj <ESC>

" カーソル移動を表示行単位にする
nnoremap j gj
nnoremap k gk
nnoremap <Down> g
nnoremap <Up> gk

" インサートモード時のカーソル移動を追加
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" カーソル移動を早くする
nnoremap J 10j
nnoremap K 10k

" カーソル下の単語をハイライト
nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>

" ヤンクレジストリからペーストC-pに設定
nnoremap <C-p> "0p

" インデントを維持したまま、カーソル下に行を挿入し、その行に移動
nnoremap <C-j> oX<C-h><ESC>

" インデントを維持しないで、カーソル下に行を挿入し、その行に移動
nnoremap <silent> <C-k> :<C-u>call append(expand('.'), '')<Cr>j

" カーソル位置に改行を挿入(カーソル右は折り返される)
nnoremap <CR> i<CR><ESC>

" 行番号の絶対行表示と相対行表示のトグル
nnoremap <silent> [any]l :<C-u>setlocal relativenumber!<CR>

" terminal-insertからterminal-normalに抜ける
tnoremap jj <C-\><C-n>

" 行を移動
nnoremap <C-Up> "zdd<Up>"zP
nnoremap <C-Down> "zdd"zp

" 複数行を移動
vnoremap <C-Up> "zx<Up>"zP`[V`]
vnoremap <C-Down> "zx"zp`[V`]

" --------------------------------------------------------------------------------
" ウィンドウ操作

nnoremap [pane] <Nop>
" nmap <Space>s [pane]
nnoremap s <Nop>
nmap s [pane]

" ウィンドウの分割
nnoremap <silent> [pane]s :<C-u>sp<CR>
nnoremap <silent> [pane]v :<C-u>vs<CR>

" ウィンドウ移動
nnoremap [pane]j <C-w>j
nnoremap [pane]k <C-w>k
nnoremap [pane]l <C-w>l
nnoremap [pane]h <C-w>h

" ウィンドウ自体を移動
nnoremap [pane]J <C-w>J
nnoremap [pane]K <C-w>K
nnoremap [pane]L <C-w>L
nnoremap [pane]H <C-w>H

" 次のタブ、前のタブに移動
nnoremap [pane]n gt
nnoremap [pane]p gT

" 大きさを揃える、縦横最大化
nnoremap [pane]= <C-w>=
nnoremap [pane]o <C-w>_<C-w>|

" 新規タブ
nnoremap <silent> [pane]t :<C-u>tabnew<CR>

" ウィンドウを閉じる、バッファを閉じる
nnoremap <silent> [pane]q :<C-u>q<CR>
nnoremap <silent> [pane]Q :<C-u>bd<CR>

" s>...でw幅を増やす、s<...でw幅を減らす
" s+...でw高さを増やす、s-...でw高さを減らす
call submode#enter_with('bufmove', 'n', '', '[pane]>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', '[pane]<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', '[pane]+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', '[pane]-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')


" --------------------------------------------------------------------------------
" フォールディングの操作

noremap [fold] <Nop>
map <Space>q [fold]

" カーソル下の折りたたみを1段階トグル
nnoremap [fold]q za

" カーソル下の折りたたみを全てトグル
nnoremap [fold]Q zA

" 全ての折りたたみを閉じる
nnoremap [fold]c zM

" 全ての折りたたみを開く
nnoremap [fold]o zR

" 選択範囲にマーカーを埋め込む(vモードで[fold]が反応しなかったので直接<Space>を書く)
"noremap <silent> <Space>fm zf
noremap [fold]m zf

" カーソル下の折りたたみマーカーを削除
nnoremap [fold]d zd

