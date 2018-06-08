" ==================== mapping.rc.vim ====================
" 「submode#enter_with」でサブモードを作成する
" 1:作成するサブモード名、2:対象モード(n,i,ni)、3:マップのオプション(nmapのようにリマップするときは、「r」)、4:サブモードに入るキーマップ、5:サブモードに入った際に行う処理

" 「submode#map」で作成したサブモード内でのキーマップの定義する
" 第1～3引数までは、enter_withと同じ、4:afterキーマップ、5:beforeキーマップ

" escをjjにマッピング
inoremap <silent> jj <ESC>
"imap <C-j> <ESC>
"noremap! <C-j> <ESC>
"vnoremap <C-j> <ESC>

" インサートモード時のカーソル移動を追加(ESC->C-jにするときは、ここのC-jをコメントアウト)
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" ヤンクレジストリからペーストC-pに設定
nnoremap <silent> <C-p> "0p

" インデントを維持したまま、カーソル下に行を挿入し、その行に移動
nnoremap <silent> <C-j> oX<C-h><ESC>

" インデントを維持しないで、カーソル下に行を挿入し、その行に移動
nnoremap <silent> <C-k> :<C-u>call append(expand('.'), '')<Cr>j

" カーソル位置に改行を挿入(カーソル右は折り返される)
nnoremap <CR> i<CR><ESC>

" 行番号の絶対行表示と相対行表示のトグル
nnoremap <silent><Space>l :<C-u>setlocal relativenumber!<CR>


" ----- フォールディングの操作 -----
nnoremap [fold] <Nop>
nmap <Space>f [fold]

" カーソル下の折りたたみを1段階トグル
nnoremap <silent>[fold]f za

" カーソル下の折りたたみを全てトグル
nnoremap <silent>[fold]F zA

" 全ての折りたたみを閉じる
nnoremap <silent>[fold]c zM

" 全ての折りたたみを開く
nnoremap <silent>[fold]o zR

" 選択範囲にマーカーを埋め込む(vモードで[fold]が反応しなかったので直接<Space>を書く)
noremap <silent><Space>fm zf

" カーソル下の折りたたみマーカーを削除
nnoremap <silent>[fold]d zd


" ----- ウィンドウ操作 -----
nnoremap [pane] <Nop>
nmap <Space>s [pane]
"nnoremap s <Nop>

" ウィンドウの分割
nnoremap <silent>[pane]s :<C-u>sp<CR>
nnoremap <silent>[pane]v :<C-u>vs<CR>

" ウィンドウ移動
nnoremap <silent>[pane]j <C-w>j
nnoremap <silent>[pane]k <C-w>k
nnoremap <silent>[pane]l <C-w>l
nnoremap <silent>[pane]h <C-w>h

" ウィンドウ自体を移動
nnoremap <silent>[pane]J <C-w>J
nnoremap <silent>[pane]K <C-w>K
nnoremap <silent>[pane]L <C-w>L
nnoremap <silent>[pane]H <C-w>H

" 次のタブ、前のタブに移動
nnoremap <silent>[pane]n gt
nnoremap <silent>[pane]p gT

" 大きさを揃える、縦横最大化
nnoremap <silent>[pane]= <C-w>=
nnoremap <silent>[pane]o <C-w>_<C-w>|

" 新規タブ
nnoremap <silent>[pane]t :<C-u>tabnew<CR>

" ウィンドウを閉じる、バッファを閉じる
nnoremap <silent>[pane]q :<C-u>q<CR>
nnoremap <silent>[pane]Q :<C-u>bd<CR>

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


" ----- ale -----
nnoremap [ale] <Nop>
nmap <Space>a [ale]

" aleのトグル
nnoremap <silent>[ale]t :call AleListToggle()<CR>

" エラー間の移動
call submode#enter_with('alemove', 'n', 'r', '[ale]k', '<Plug>(ale_previous_wrap)')
call submode#enter_with('alemove', 'n', 'r', '[ale]j', '<Plug>(ale_next_wrap)')
call submode#map('alemove', 'n', 'r', 'k', '<Plug>(ale_previous_wrap)')
call submode#map('alemove', 'n', 'r', 'j', '<Plug>(ale_next_wrap)')


" ----- neocomplete -----

" 前回行われた保管をキャンセルする
inoremap <expr><C-g> neocomplete#undo_completion()

" TABで補完候補を進める
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" C-fでポップアップを消す
inoremap <expr><C-f> pumvisible() ? "\<C-y>" : "\<C-f>"

" BSでポップアップを消して、一文字消す
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"


" ----- unite -----
nnoremap [unite] <Nop>
nmap <Space>u [unite]

" カレントディレクトリのファイルとディレクトリの一覧を表示
nnoremap <silent>[unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>

" 最近開いたファイルの一覧を表示(neomru.vimが必要)
nnoremap <silent>[unite]r :<C-u>Unite file_mru<CR>

" 開かれているバッファの一覧を表示
nnoremap <silent>[unite]B :<C-u>Unite buffer<CR>

" ヤンク(コピー)の履歴の一覧を表示(neoyank.vimが必要)
nnoremap <silent>[unite]y :<C-u>Unite history/yank<CR>

" レジスタの一覧を表示
nnoremap <silent>[unite]R :<C-u>Unite -buffer-name=register register<CR>

" マッピング一覧
nnoremap <silent>[unite]m :<C-u>Unite mapping<CR>

" ブックマーク一覧
nnoremap <silent>[unite]b :<C-u>Unite bookmark<CR>

" カレントディレクトリ一覧
nnoremap <silent>[unite]d :<C-u>Unite directory<CR>


" ----- tcomment -----
noremap [tcomment] <Nop>
map <Space>t [tcomment]

nnoremap <silent>[tcomment]t :TComment<CR>
nnoremap <silent>[tcomment]b :TCommentBlock<CR>
nnoremap <silent>[tcomment]r :TCommentRight
vnoremap <silent>[tcomment]t :TComment<CR>
vnoremap <silent>[tcomment]b :TCommentBlock<CR>
vnoremap <silent>[tcomment]r :TCommentRight<CR>


" ----- vimfiler -----
nnoremap <silent><Space>d :VimFilerExplorer<CR>


" ----- previm -----
nnoremap <silent><Space>m :PrevimOpen<CR>


" ----- various -----
