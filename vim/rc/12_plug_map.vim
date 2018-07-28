" プラグインのキーバインドの設定を記述

" --------------------------------------------------------------------------------
" unite

nnoremap [unite] <Nop>
nmap <Space>u [unite]

" カレントディレクトリのファイルとディレクトリの一覧を表示
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>

" 最近開いたファイルの一覧を表示(neomru.vimが必要)
nnoremap <silent> [unite]r :<C-u>Unite file_mru<CR>

" 開かれているバッファの一覧を表示
nnoremap <silent> [unite]B :<C-u>Unite buffer<CR>

" ヤンク(コピー)の履歴の一覧を表示(neoyank.vimが必要)
nnoremap <silent> [unite]y :<C-u>Unite history/yank<CR>

" レジスタの一覧を表示
nnoremap <silent> [unite]R :<C-u>Unite -buffer-name=register register<CR>

" マッピング一覧
nnoremap <silent> [unite]m :<C-u>Unite mapping<CR>

" ブックマーク一覧
nnoremap <silent> [unite]b :<C-u>Unite bookmark<CR>

" カレントディレクトリ一覧
nnoremap <silent> [unite]d :<C-u>Unite directory<CR>



" --------------------------------------------------------------------------------
" neocomplete





" --------------------------------------------------------------------------------
" vimfiler

nnoremap <silent> <Space>d :VimFilerExplorer<CR>



" --------------------------------------------------------------------------------
" ale

nnoremap [ale] <Nop>
nmap <Space>a [ale]

" aleのトグル
nnoremap <silent> [ale]t :call AleListToggle()<CR>

" エラー間の移動
call submode#enter_with('alemove', 'n', 'r', '[ale]k', '<Plug>(ale_previous_wrap)')
call submode#enter_with('alemove', 'n', 'r', '[ale]j', '<Plug>(ale_next_wrap)')
call submode#map('alemove', 'n', 'r', 'k', '<Plug>(ale_previous_wrap)')
call submode#map('alemove', 'n', 'r', 'j', '<Plug>(ale_next_wrap)')



" --------------------------------------------------------------------------------
" tcomment

nnoremap <silent> [tcomment]t :TComment<CR>
nnoremap <silent> [tcomment]b :TCommentBlock<CR>
nnoremap <silent> [tcomment]r :TCommentRight
vnoremap <silent> [tcomment]t :TComment<CR>
vnoremap <silent> [tcomment]b :TCommentBlock<CR>
vnoremap <silent> [tcomment]r :TCommentRight<CR>



" --------------------------------------------------------------------------------
" previm

nnoremap <silent> <Space>m :PrevimOpen<CR>



" --------------------------------------------------------------------------------
" vim-easy-align

vmap <Enter> <Plug>(EasyAlign)



