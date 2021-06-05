set      relativenumber
set      smartindent
set      shiftwidth=4
set      tabstop=4
syntax   on
set      mouse=a
set  	 encoding=utf8
nmap <silent> // <C-L>:nohlsearch<CR>
set colorcolumn=79



" ================================== easy alian ==================================
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap     ga <Plug>(EasyAlign) " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap     ga <Plug>(EasyAlign)


" ========================= external_file_configurations  =========================
for f in split(glob('$NVIM/custom/*.conf.vim'), '\n')
    exe 'source' f
endfor

" ==================================== Folding ====================================
" Simple_Folding
let g:SimpylFold_fold_blank = 0
let g:SimpylFold_docstring_preview = 1
nmap <SPACE> za
