" ================================= Windows =================================
" <C-n> will create new vertical window and focus to NERDTree
func! NewFile()
    exec ':vnew'
endfunc
nmap <C-n> :call NewFile()<CR>

func! OpenFile()
    exec ':vnew'
    exec ':NERDTreeFocus'
endfunc
nmap <C-o> :call OpenFile()<CR>




" ================================ NERDTree ================================
" Auto_load
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
" NERDTree resize
let g:NERDTreeWinSize=21
" Hide specific files in NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.egg-info$', '__pycache__', '__pycache__']
