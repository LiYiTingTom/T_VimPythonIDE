" ================================= Comment =================================
" Python_docString for Parameters, Return, Raises, Attributes.
nmap <C-_> gccj
imap \c"" """"""<ESC>hhi<CR><ESC>k$a
imap \cpa Parameters<CR>==========<CR>
imap \cre Return<CR>======<CR>
imap \cra Raises<CR>======<CR>
imap \cat Attributes<CR>==========<CR>
imap \cno Note<CR>====<CR>
imap \cwa Warning<CR>=======<CR>



" ============================== Comment_line ==============================
" make comment in '======= <comment> ========' format
func! BeautifulComment(symbol, width)
    " let width = virtcol('$')
	let text = getline('.')
    let text = printf(" %s ", text)
    let chrome = repeat(a:symbol, a:width/2 - strdisplaywidth(text)/2)
    call setline('.', chrome . text . chrome)
endfunc

" implement comment line
nmap \cl1 :call BeautifulComment("=", 72)<CR>gcc
nmap \cl2 :call BeautifulComment("-", 72)<CR>gcc
nmap \cs1 :call BeautifulComment("=", 60)<CR>gcc
nmap \cs2 :call BeautifulComment("-", 60)<CR>gcc
nmap \cdd gcc^diwx$diwx
