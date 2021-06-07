syntax on
set encoding=utf8

set mouse=a
set smartindent
set relativenumber
set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4
set ai
set splitright

map <C-j> <C-n>
map <C-k> <C-p>
nmap <MiddleMouse> <LeftMouse>

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3
" clear search results
nnoremap <silent> // :noh<CR>
" color column
set colorcolumn=79


" ======================== easy alian ========================
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap \ea :EasyAlign 
nmap \ea :EasyAlign 

" ===================== external_file_configurations  =====================
for f in split(glob('$NVIM/self_def/*.conf.vim'), '\n')
    exe 'source' f
endfor

" ================================ Folding ================================
" Simple_Folding
let g:SimpylFold_fold_blank        = 0
let g:SimpylFold_docstring_preview = 1

nmap <SPACE> za
set foldmethod=indent
