""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"File: c.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Brief: Maps, setup and other awasome stuff to write c code
"Author: Alvaro Ramirez
"Version: 1.0
"Date: 2020-11-20

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Prevent cpp options to be overwrited
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Use filetype to select only c files, filer out cpp files {{{
if (&ft != 'c')
    finish
endif
"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Local functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:BufferIsEmpty() "{{{
    if (line('$') == 1 && getline(1) == '') "{{{
	return 1
    else
	return 0
    endif "}}}
endfunction "}}}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Funtions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! <SID>CreateHeader() "{{{
    if (s:CheckHeaderTemplateExist())
	echom "Archivo encontrado"
    else
	echom "No encontrado"
    endif
endfunction "}}}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command! -nargs=0 AddHeader :call <SID>CreateHeader()
