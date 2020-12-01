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
setlocal tabstop=4
setlocal shiftwidth=4    "Indent by 4 spaces when using >>, <<, == etc.
setlocal softtabstop=4   "Indent by 4 spaces when pressing <TAB>
setlocal expandtab
setlocal colorcolumn=80
highlight colorColumn ctermbg=red


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Awasome remaps to help coding C
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Insert a header to clearly identify a section of code
nnoremap <buffer> <leader>sh o<Esc>0Di/<Esc>79a*<Esc>o<CR><Esc>77a*<Esc>A/<CR><Esc>kkA

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Local variables
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Get file name without extension
let s:fileName = expand('%:t:r')

"Change file name to upper case
let s:fileNameUpper = toupper(s:fileName)

" Get file name
let s:fileNameComplete = expand('%:t')


let s:headerTemplate = "/**\<CR>@file\<Tab>\<Tab>".s:fileNameComplete."\<CR>"
let s:headerTemplate = s:headerTemplate."@author\<Tab>\<Tab>Alvaro Ramirez\<CR>"
let s:headerTemplate = s:headerTemplate."@date\<Tab>\<Tab>".strftime("%Y-%m-%d")."\<CR>"
let s:headerTemplate = s:headerTemplate."@version\<Tab>\<Tab>v1.0\<CR>"
let s:headerTemplate = s:headerTemplate."@brief TODO: BRIEF_DESCRIPTION\<CR>/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/\<Esc>79a*\<Esc>oHeader guards\<CR>"
let s:headerTemplate = s:headerTemplate."\<Esc>77a*\<Esc>A/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."#ifndef ".s:fileNameUpper."_H\<CR>"
let s:headerTemplate = s:headerTemplate."#define ".s:fileNameUpper."_H\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/\<Esc>79a*\<Esc>oDoxygen groups\<CR>"
let s:headerTemplate = s:headerTemplate."\<Esc>77a*\<Esc>A/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/**\<CR>@addtogroup TODO:Dox_project_name PROJECT_DOC_HEADER\<CR>"
let s:headerTemplate = s:headerTemplate."@{\<CR>/\<CR>\<CR>/**\<CR>"
let s:headerTemplate = s:headerTemplate."@addtogroup ".s:fileName." ".s:fileNameUpper."\<CR>"
let s:headerTemplate = s:headerTemplate."@brief ".s:fileNameUpper." TODO: BRIEF_DESCRIPTION\<CR>"
let s:headerTemplate = s:headerTemplate."@{\<CR>\<CR>TODO: FULL DESCRIPTION OF THE MODULE\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."@par Changelog\<CR>Version 1.0\<CR>- Initial Release\<CR>"
let s:headerTemplate = s:headerTemplate."\<Tab>TODO: Add the library functions, definitions, macros, etc.\<CR>/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/\<Esc>79a*\<Esc>oIncludes\<CR>"
let s:headerTemplate = s:headerTemplate."WARNING: Only headers with datatypes or definitions used here are allowed.\<CR>"
let s:headerTemplate = s:headerTemplate."         Avoid include headers here, if so add clarification note.\<CR>"
let s:headerTemplate = s:headerTemplate."\<Esc>77a*\<Esc>A/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."Delete Ex if not use\<CR>#include <stdint.h> /*!< Necessary to use Fixed-Width Integers */\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/\<Esc>79a*\<Esc>oC++ guards\<CR>"
let s:headerTemplate = s:headerTemplate."\<Esc>77a*\<Esc>A/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."#ifdef __cplusplus\<CR>extern \"C\"{//}<--Prevent indent\<CR>#endif\<CR>tmp\<Esc>0Di\<CR>"
let s:headerTemplate = s:headerTemplate."/\<Esc>79a*\<Esc>oDefines Constants\<CR>"
let s:headerTemplate = s:headerTemplate."\<Esc>77a*\<Esc>A/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/**\<CR>@addtogroup ".s:fileName."_defines ".s:fileNameUpper." definitions\<CR>"
let s:headerTemplate = s:headerTemplate."@brief Preprocessor defines, masks and magic numbers.\<CR>"
let s:headerTemplate = s:headerTemplate."@{\<CR>/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/**\<CR>@brief TODO:My Awasome define\<CR>/\<CR>"
let s:headerTemplate = s:headerTemplate."#define XXX xU\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/*End of ".s:fileName."_defines */\<CR>"
let s:headerTemplate = s:headerTemplate."/**\<CR>@}\<CR>/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/\<Esc>79a*\<Esc>oTypedefs and Structs\<CR>"
let s:headerTemplate = s:headerTemplate."\<Esc>77a*\<Esc>A/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/**\<CR>@addtogroup ".s:fileName."_typedefs ".s:fileNameUpper." Typedef, Enums and Structs\<CR>"
let s:headerTemplate = s:headerTemplate."@brief ".s:fileName." Typedefs, Enums and Structures used in this library.\<CR>"
let s:headerTemplate = s:headerTemplate."@{\<CR>/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/*End of ".s:fileName."_typedefs */\<CR>"
let s:headerTemplate = s:headerTemplate."/**\<CR>@}\<CR>/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/\<Esc>79a*\<Esc>oFuntion Prototypes\<CR>"
let s:headerTemplate = s:headerTemplate."\<Esc>77a*\<Esc>A/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/**\<CR>@addtogroup ".s:fileName."_functions ".s:fileNameUpper." Functions Prototypes\<CR>"
let s:headerTemplate = s:headerTemplate."@brief ".s:fileName." Functions.\<CR>"
let s:headerTemplate = s:headerTemplate."@{\<CR>/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/*End of ".s:fileName."_Functions */\<CR>"
let s:headerTemplate = s:headerTemplate."/**\<CR>@}\<CR>/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/\<Esc>79a*\<Esc>oC++ guards\<CR>"
let s:headerTemplate = s:headerTemplate."\<Esc>77a*\<Esc>A/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."#ifdef __cplusplus\<CR>}\<CR>#endif\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/\<Esc>79a*\<Esc>oEnd of Doxygen groups\<CR>"
let s:headerTemplate = s:headerTemplate."\<Esc>77a*\<Esc>A/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/*End of ".s:fileName." group*/\<CR>"
let s:headerTemplate = s:headerTemplate."/**\<CR>@}\<CR>/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/*End of Dox_project_name group*/\<CR>"
let s:headerTemplate = s:headerTemplate."/**\<CR>@}\<CR>/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/\<Esc>79a*\<Esc>oEnd of header guards\<CR>"
let s:headerTemplate = s:headerTemplate."\<Esc>77a*\<Esc>A/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/*End of ".s:fileNameUpper."_H*/\<CR>"
let s:headerTemplate = s:headerTemplate."#endif\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/\<Esc>79a*\<Esc>oEnd of file\<CR>"
let s:headerTemplate = s:headerTemplate."\<Esc>77a*\<Esc>A/"
let s:headerTemplate = s:headerTemplate."\<Esc>gg"

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


