""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" :init config  {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" このファイルの場所を定義（以降、この変数を使用する）
let g:vimrc_dir = expand('<sfile>:p:h')
" }}}



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :plug config  {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.cache/plugged')

" EXTEND-ACTION
Plug 'tpope/vim-repeat'
Plug 'kana/vim-submode'
Plug 'itchyny/vim-parenmatch'
Plug 'sharat87/roast.vim'

" TEXTOBJ_OPERATOR
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

" GIT
Plug 'tpope/vim-fugitive'

" MOTION_SEARCH
Plug 'easymotion/vim-easymotion'

call plug#end()
" }}}



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :basic config  {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :filetype config  {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 下記の違いに気をつける
" autocmd FileType html ~
" autocmd BufRead *.html ~
" }}}




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :keymap config  {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" submode
" ★ 第1引数は8文字以内にしないとエラーになる
" [submode#enter_with]でサブモードを作成する
"   1:作成するサブモード名、2:対象モード(n,i,ni)、3:オプション(リマップするときは[r])、4:サブモードに入るキーバインド、5:サブモードに入った際に行う処理
" [submode#map]で作成したサブモード内でのキーバインドの定義する
"   第1～3引数までは、enter_withと同じ、4:afterキーバインド、5:beforeキーバインド

" vim固有の機能を割り当てるプレフィックス
nnoremap [core] <Nop>
nnoremap s <Nop>
nmap s [core]


" 自作関数を割り当てるプレフィックス
nnoremap [util] <Nop>
nmap [core]s [util]


" escape
augroup keymap__escape
    autocmd!
    " escをjjにマッピング
    inoremap jj <ESC>

    " terminal-insertからterminal-normalに抜ける
    tnoremap jj <C-\><C-n>
augroup END


" カーソル移動
augroup keymap__move_cursor
    autocmd!
    " カーソル移動を表示行単位にする
    nnoremap j gj
    nnoremap k gk
    nnoremap gj j
    nnoremap gk k

    " インサートモード時のカーソル移動を追加
    if exists('g:vscode')
        " inoremap <C-j> <Cmd>call VSCodeNotify('cursorDown')<CR>
        " inoremap <C-k> <Cmd>call VSCodeNotify('cursorUp')<CR>
        " inoremap <C-h> <Cmd>call VSCodeNotify('cursorLeft')<CR>
        " inoremap <C-l> <Cmd>call VSCodeNotify('cursorRight')<CR>
    else
        inoremap <C-j> <Down>
        inoremap <C-k> <Up>
        inoremap <C-h> <Left>
        inoremap <C-l> <Right>
    endif

    " カーソル移動を早くする
    nnoremap J 10j
    nnoremap K 10k
augroup END


" ペースト
augroup keymap__paste
    autocmd!
    " ヤンクレジストリからペーストC-pに設定
    nnoremap <C-p> "0p

    " virtualeditの際のpがカーソル末尾からペーストされるようにする
    if has('virtualedit') && &virtualedit =~# '\<all\>'
        nnoremap <expr> p (col('.') >= col('$') ? '$' : '') . 'p'
    endif
augroup END


" レジストリ
augroup keymap__registry
    autocmd!
    " xとsではヤンクしない(_レジスタは消去用レジスタ)
    nnoremap x "_x
    " nnoremap s "_s
augroup END


" 行移動
augroup keymap__move_line
    autocmd!
    " 行を移動
    nnoremap <C-Up> "zdd<Up>"zP
    nnoremap <C-Down> "zdd"zp

    " 複数行を移動
    vnoremap <C-Up> "zx<Up>"zP`[V`]
    vnoremap <C-Down> "zx"zp`[V`]
augroup END


" トグル
augroup keymap__toggle
    autocmd!
    nnoremap <silent> <;>(toggle_relative_num) :<C-u>setlocal relativenumber!<CR>
    nnoremap <silent> <;>(toggle_cursor_line) :<C-u>setlocal cursorline!<CR>
    nnoremap <silent> <;>(toggle_cursor_column) :<C-u>setlocal cursorcolumn!<CR>
augroup END


" ハイライト
augroup keymap__highlight
    autocmd!
    " もともとタブ移動のキーマップだが、sキーに割り当てているので不要
    nnoremap gt <Nop>
    nnoremap gT <Nop>

    " カーソル下の単語をハイライト
    " nnoremap <silent> [util]w "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
    nnoremap <silent> [util]s :call takxlz#util#hi_words()<CR>:set hlsearch<CR>
    nnoremap <silent> [util]S :let g:hlstate = ''<CR>:let @/ = ''<CR>

    " カレント行/列を3秒間だけハイライト
    nnoremap <silent> [util]f :call takxlz#util#hi_cursorrc_3sec()<CR>
augroup END


" ペイン
augroup keymap__pane
    autocmd!

    if exists('g:vscode')
        nnoremap <silent> [core]V <Cmd>call VSCodeNotify('workbench.action.splitEditorDown')<CR>
        nnoremap <silent> [core]v <Cmd>call VSCodeNotify('workbench.action.splitEditorRight')<CR>
        nnoremap [core]j <Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
        nnoremap [core]k <Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
        nnoremap [core]l <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>
        nnoremap [core]h <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
        nnoremap [core]> <Cmd>call VSCodeNotify('workbench.action.increaseViewWidth')<CR>
        nnoremap [core]< <Cmd>call VSCodeNotify('workbench.action.decreaseViewWidth')<CR>
        nnoremap [core]+ <Cmd>call VSCodeNotify('workbench.action.increaseViewHeight')<CR>
        nnoremap [core]- <Cmd>call VSCodeNotify('workbench.action.decreaseViewHeight')<CR>
    else
        " ペイン分割
        nnoremap <silent> [core]V :<C-u>sp<CR>
        nnoremap <silent> [core]v :<C-u>vs<CR>

        " ペイン移動
        " nnoremap [core]j <C-w>j
        " nnoremap [core]k <C-w>k
        " nnoremap [core]l <C-w>l
        " nnoremap [core]h <C-w>h
        call submode#enter_with('p_move', 'n', '', '[core]j', '<C-w>j')
        call submode#enter_with('p_move', 'n', '', '[core]k', '<C-w>k')
        call submode#enter_with('p_move', 'n', '', '[core]l', '<C-w>l')
        call submode#enter_with('p_move', 'n', '', '[core]h', '<C-w>h')
        call submode#map('p_move', 'n', '', 'J', '<C-w>j')
        call submode#map('p_move', 'n', '', 'K', '<C-w>k')
        call submode#map('p_move', 'n', '', 'L', '<C-w>l')
        call submode#map('p_move', 'n', '', 'H', '<C-w>h')

        " ペイン自体を移動
        nnoremap [core]J <C-w>J
        nnoremap [core]K <C-w>K
        nnoremap [core]L <C-w>L
        nnoremap [core]H <C-w>H

        " 大きさを揃える
        nnoremap [core]= <C-w>=

        " ペインの最大化トグル
        let g:takxlz_is_maximize = 0
        nnoremap <silent> [core]z :call takxlz#util#toggle_maximize_window()<CR>

        " ペインを閉じる、バッファを閉じる
        nnoremap <silent> [core]q :<C-u>q<CR>
        nnoremap <silent> [core]Q :<C-u>bd<CR>

        " s>...でw幅を増やす、s<...でw幅を減らす
        " s+...でw高さを増やす、s-...でw高さを減らす
        call submode#enter_with('p_resize', 'n', '', '[core]>', '<C-w>>')
        call submode#enter_with('p_resize', 'n', '', '[core]<', '<C-w><')
        call submode#enter_with('p_resize', 'n', '', '[core]+', '<C-w>+')
        call submode#enter_with('p_resize', 'n', '', '[core]-', '<C-w>-')
        call submode#map('p_resize', 'n', '', '>', '<C-w>>')
        call submode#map('p_resize', 'n', '', '<', '<C-w><')
        call submode#map('p_resize', 'n', '', '+', '<C-w>+')
        call submode#map('p_resize', 'n', '', '-', '<C-w>-')
    endif
augroup END


" タブ
augroup keymap__tab
    " 新規タブ
    nnoremap <silent> [core]t :<C-u>tabnew<CR>

    " 次のタブ、前のタブに移動
    " nnoremap [core]n gt
    " nnoremap [core]N gT
    nnoremap <TAB> gt
    nnoremap <S-TAB> gT

    " タブの位置を変更する
    nnoremap <silent> <S-RIGHT> :tabm +1<CR>
    nnoremap <silent> <S-LEFT> :tabm -1<CR>

    " 現在のタブを閉じる
    nnoremap <silent> [core]c :tabclose<CR>

    " 現在のタブ以外を閉じる
    nnoremap <silent> [core]C :tabonly<CR>

    " ラベル文字列を変更する
    nnoremap <silent> [core], :call takxlz#util#change_tab_label()<CR>
augroup END


" フォールディング
augroup keymap__fold
    autocmd!
    " プレフィックスキーを設定
    noremap [fold] <Nop>
    map <space>a [fold]

    " カーソル下の折りたたみを1段階トグル
    nnoremap [core]a za

    " カーソル下の折りたたみを全てトグル
    nnoremap [core]A zA

    " 全ての折りたたみを開く
    nnoremap [core]o zR

    " 全ての折りたたみを閉じる
    nnoremap [core]O zM

    " 選択範囲にマーカーを埋め込む(vモードで[fold]が反応しなかったので直接<space>を書く)
    "noremap <silent> <space>fm zf
    noremap [core]f zf

    " カーソル下の折りたたみマーカーを削除
    nnoremap [core]d zd
augroup END


" vscode-nvim
augroup keymap__vscode_nvim
    autocmd!
    if exists('g:vscode')
        " nnoremap <C-j> <Cmd>call VSCodeNotify('selectNextSuggestion')<CR>
        " nnoremap <C-k> <Cmd>call VSCodeNotify('selectPrevSuggestion')<CR>
    endif
augroup END
" }}}



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :plugin config  {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 「let g:plugin__XXX = 0」等して左記の変数を存在させればプラグインの設定を読み込まない
" ※ 以下で行っている独自設定を無効にするだけでプラグイン自体を無効にするわけではない

" TEXTOBJ_OPERATOR {{{
augroup plugin__textobj_operator
    autocmd!

    " vim-operator-replace
    if !exists('g:plugin__vim_operator_replace')
        map _ <Plug>(operator-replace)
    endif

    " vim-commentary
    if !exists('g:plugin__vim_commentary')
        autocmd FileType typescript setlocal commentstring=\/\/\ %s
        if exists('g:vscode')
            xmap gc  <Plug>VSCodeCommentary
            nmap gc  <Plug>VSCodeCommentary
            omap gc  <Plug>VSCodeCommentary
            nmap gcc <Plug>VSCodeCommentaryLine
        endif
    endif
augroup END
" }}}


" FORMAT {{{
augroup plugin__format
    autocmd!
    nnoremap [format] <Nop>
    nmap <space>f [format]

    " vim-easy-align
    if !exists('g:plugin__vim_easy-align')
        vmap <Enter> <Plug>(EasyAlign)
    endif

    " vim-table-mode
    if !exists('g:plugin__vim_table_mode')
        let g:table_mode_corner = '|'
        noremap <silent> [format]t :TableModeToggle<CR>
        noremap <silent> [format]T :Tableize<CR>
    endif
augroup END
" }}}


" GIT {{{
augroup plugin__git
    autocmd!
    nnoremap [git] <Nop>
    nmap <space>g [git]

    " vim-fugitive
    if !exists('g:plugin__vim_fugitive')
        nnoremap <silent> [git]b :Gblame<CR>
        nnoremap <silent> [git]s :tab Gstatus<CR>
        nnoremap <silent> [git]d :tab Gdiff<CR>
        nnoremap <silent> [git]D :tab Gvdiff<CR>
        " nnoremap <silent> [git]l :tab Glog<CR>
        nmap [git]h :diffget //2<CR>
        nmap [git]u :diffget //3<CR>

        " Gstatusで独自設定したキーマップでペイン操作等ができるように「s」を無効化（別のキーに変更）
        " autocmd FileType fugitive,git nnoremap <buffer> s <Nop>
        " keyキーへの割り当てをvalueキーに変更
        let g:nremap = {'s': '' }

        " ペイン分割
        autocmd FileType fugitive,git nnoremap <buffer> <silent> sV :<C-u>sp<CR>
        autocmd FileType fugitive nnoremap <buffer> <silent> sv :<C-u>vs<CR>
        " ペイン移動
        autocmd FileType fugitive,git nnoremap <buffer> <silent> sj <C-w>j
        autocmd FileType fugitive,git nnoremap <buffer> <silent> sk <C-w>k
        autocmd FileType fugitive,git nnoremap <buffer> <silent> sl <C-w>l
        autocmd FileType fugitive,git nnoremap <buffer> <silent> sh <C-w>h
        " タブ移動
        autocmd FileType fugitive,git nnoremap <buffer> <silent> sn gt
        autocmd FileType fugitive,git nnoremap <buffer> <silent> sp gT
        " タブを閉じる
        autocmd FileType fugitive,git nnoremap <buffer> <silent> sc :tabclose<CR>
        autocmd FileType fugitive,git nnoremap <buffer> <silent> sC :tabonly<CR>
    endif
augroup END
" }}}


" MOTION_SEARCH {{{
augroup plugin__motion
    nnoremap [motion] <Nop>
    nmap <space><space> [motion]
    autocmd!

    " vim-easymotion
    if !exists('g:plugin__vim_easymotion')
        map  [motion]1 <Plug>(easymotion-bd-w)
        nmap [motion]1 <Plug>(easymotion-overwin-w)
        map  [motion]2 <Plug>(easymotion-bd-jk)
        nmap [motion]2 <Plug>(easymotion-overwin-line)
        map  [motion]3 <Plug>(easymotion-bd-f)
        nmap [motion]3 <Plug>(easymotion-overwin-f)
    endif
augroup END
" }}}
" }}}


