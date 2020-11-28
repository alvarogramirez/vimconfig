""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"File: c.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Brief: Maps, setup and other awesome stuff to write c code
"Author: Alvaro Ramirez
"Version: 1.0
"Date: 2020-11-20

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Prevent CPP options to be overwritten
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Use the file type to select only c files, filer out CPP files {{{
if (&ft != 'c') 
    finish
endif
"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Local Options for C files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setlocal cindent
setlocal shiftwidth=4    "Indent by 4 spaces when using >>, <<, == etc.
setlocal softtabstop=4   "Indent by 4 spaces when pressing <TAB>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Local variables
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Get file name without extension
let s:fileName = expand('%:t:r')

"Change file name to upper case
let s:fileNameUpper = toupper(s:fileName)

" Get file name
let s:fileNameComplete = expand('%:t')


let s:headerTemplate = "/**\<CR>"
let s:headerTemplate = s:headerTemplate."@file\<Tab>\<Tab>".s:fileNameComplete."\<CR>"
let s:headerTemplate = s:headerTemplate."@author\<Tab>\<Tab>Alvaro Ramirez\<CR>"
let s:headerTemplate = s:headerTemplate."@date\<Tab>\<Tab>".strftime("%Y-%m-%d")."\<CR>"
let s:headerTemplate = s:headerTemplate."@version\<Tab>\<Tab>v1.0\<CR>"
let s:headerTemplate = s:headerTemplate."@brief\<Tab>\<Tab>".s:fileNameUpper."\<CR>"
let s:headerTemplate = s:headerTemplate."/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."#ifndef ".s:fileNameUpper."_H\<CR>"
let s:headerTemplate = s:headerTemplate."#define ".s:fileNameUpper."_H\<CR>\<Esc>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Local functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Verify that the file is empty before inserting the header {{{
function! s:BufferIsEmpty() 
    "if the cursor is in the first line and is empty {{{
    if (line('$') == 1 && getline(1) == '') 
	return 1
    else
	echo "The file is not empty."
	return 0
    endif 
    "}}}
endfunction 
"}}}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Function to create the header skeleton
function! <SID>CreateHeader() 
    if (s:BufferIsEmpty())
        exec "normal! i".s:headerTemplate
    endi
endfunction 




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command! -nargs=0 AddHeader :call <SID>CreateHeader()


