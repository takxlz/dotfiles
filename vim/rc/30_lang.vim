" 言語の設定を記述

" --------------------------------------------------------------------------------
" defalut indent

" 改行のときの自動コメントを無効化
augroup newLineAutoComment
    autocmd!
    autocmd FileType * setlocal formatoptions-=ro
augroup END

" オートインデント（前の行のインデントを継続）を有効化
set autoindent

" 末尾の文字に合わせてインデントを増減する
set smartindent

" タブキーを押した時にソフトタブ（スペースインデント）を有効化
set expandtab

" 空行で改行しても、インデントのスペースを削除しない
nnoremap o oX<C-h>
nnoremap O OX<C-h>
inoremap <CR> <CR>X<C-h>

" タブの文字数
set tabstop=4

" 連続した空白に対してBSなどでカーソルが動く幅
set softtabstop=4

" オートインデント時のインデント数
set shiftwidth=4


" --------------------------------------------------------------------------------
" filetype set
augroup setFileType
    autocmd!
    autocmd BufRead,BufNewFile *.toml setfiletype toml
augroup END


" --------------------------------------------------------------------------------
" filetype indent

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    " autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END




