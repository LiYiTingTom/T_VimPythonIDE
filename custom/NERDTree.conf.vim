" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" Enable folder icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Fix directory colors
highlight! link NERDTreeFlags NERDTreeDir

" Remove expandable arrow
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"
let NERDTreeNodeDelimiter = "\x07"

" Autorefresh on tree focus
function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction

autocmd BufEnter * call NERDTreeRefresh()



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
