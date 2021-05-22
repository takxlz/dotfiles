" 定義へ移動
nnoremap <silent> [protocol]l :<C-u>call CocActionAsync('jumpDefinition', 'tab drop')<CR>
nnoremap <silent> [protocol]L :<C-u>call CocAction('jumpDefinition', 'vsplit')<CR>

" 型定義へ移動
nnoremap <silent> [protocol]t :<C-u>call CocActionAsync('jumpTypeDefinition', 'tab drop')<CR>
nnoremap <silent> [protocol]T :<C-u>call CocActionAsync('jumpTypeDefinition', 'vsplit')<CR>

" 実装へ移動
nnoremap <silent> [protocol]i :<C-u>call CocActionAsync('jumpImplementation', 'tab drop')<CR>
nnoremap <silent> [protocol]I :<C-u>call CocActionAsync('jumpImplementation', 'vsplit')<CR>

" diagnostic
nnoremap [protocol]d :<C-u>CocList diagnostics<CR>
nnoremap [protocol][ <Plug>(coc-diagnostic-prev)
nnoremap [protocol]] <Plug>(coc-diagnostic-next)
nnoremap <silent> [protocol]p <Plug>(coc-diagnostic-prev-error)
nnoremap <silent> [protocol]n <Plug>(coc-diagnostic-next-error)

" 参照へ移動
nnoremap [protocol]r <Plug>(coc-references)

" リネーム
nnoremap [protocol]R <Plug>(coc-rename)

" 型を表示
nnoremap gh :<C-u>call CocActionAsync('doHover')<CR>

" リスタート
nnoremap <silent> [protocol]<space>l :<C-u>CocRestart<CR>
