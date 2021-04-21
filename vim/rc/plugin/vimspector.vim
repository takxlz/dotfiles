fun! GotoWindow(id)
    call win_gotoid(a:id)
    call takxlz#util#toggle_maximize_window()
endfun

" Debugger remaps
nnoremap [debug]c :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap [debug]t :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap [debug]v :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap [debug]w :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap [debug]s :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap [debug]o :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap [debug]e :call vimspector#Reset()<CR>

nnoremap [debug]d :call vimspector#Launch()<CR>
nnoremap [debug]d<space> :call vimspector#Continue()<CR>
nnoremap [debug]B :call vimspector#CleanLineBreakpoint()<CR>

nmap [debug]l <Plug>VimspectorStepInto
nmap [debug]j <Plug>VimspectorStepOver
nmap [debug]k <Plug>VimspectorStepOut
nmap [debug]_ <Plug>VimspectorRestart

nmap [debug]rc <Plug>VimspectorRunToCursor
nmap [debug]b <Plug>VimspectorToggleBreakpoint
nmap [debug]cb <Plug>VimspectorToggleConditionalBreakpoint

" let g:vimspector_enable_mapping = 'HUMAN'
" nmap <F5>    <Plug>VimspectorContinue
" nmap <S-F5>  <Plug>VimspectorStop
" nmap <F4>    <Plug>VimspectorRestart
" nmap <S-F4>  :<C-u>call vimspector#Reset()<CR>
" nmap <F9>    <Plug>VimspectorToggleBreakpoint
" nmap <S-F9>  <Plug>VimspectorAddFunctionBreadkpoint
" nmap <F10>   <Plug>VimspectorStepOver
" nmap <F11>   <Plug>VimspectorStepInto
" nmap <S-F11> <Plug>VimspectorStepOut
