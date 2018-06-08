"==================== lang.rc.vim ====================

" オートインデント（前の行のインデントを継続）を有効化
set autoindent

" 末尾の文字に合わせてインデントを増減する
set smartindent

" タブキーを押した時にソフトタブ（スペースインデント）を有効化
set expandtab

" タブの文字数
set tabstop=4

" 連続した空白に対してBSなどでカーソルが動く幅
set softtabstop=4

" オートインデント時のインデント数
set shiftwidth=4

" ファイルタイプごとのインデント設定
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" 空行で改行しても、インデントのスペースを削除しない
nnoremap o oX<C-h>
nnoremap O OX<C-h>
inoremap <CR> <CR>X<C-h>
