" dein configurations

" ----------------------------------------------------------------------
" vim-plug:
let s:plug_dir = expand(g:vim_dir . '/plugged')

call plug#begin(s:plug_dir)

Plug 'kana/vim-submode'

if has('unix')
  Plug Shougo/vimproc.vim'
endif

Plug 'Shougo/neocomplete.vim'

Plug 'Shougo/vimfiler.vim'

Plug 'Shougo/vimshell.vim'

Plug 'itchyny/vim-parenmatch'

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'

Plug 'Yggdroot/indentline'

Plug 'w0rp/ale'

Plug 'itchyny/lightline.vim'

Plug 'gorodinskiy/vim-coloresque'

Plug 'tomtom/tcomment_vim'

Plug 'tpope/vim-surround'

Plug 'LeafCage/foldCC.vim'

Plug 'joshdick/onedark.vim'

Plug 'w0ng/vim-hybrid'

Plug 'severin-lemaignan/vim-minimap'

Plug 'Shougo/neoyank.vim'

Plug 'Shougo/unite.vim', { 'for' : 'md' }

Plug 'Shougo/neomru.vim'

Plug 'kannokanno/previm'

Plug 'tyru/open-browser.vim'


call plug#end()




" ----------------------------------------------------------------------
" deinの後にすべき設定:

" シンタックスをon
syntax on

" ファイルタイプ検出と各種プラグインの有効
filetype plugin indent on
