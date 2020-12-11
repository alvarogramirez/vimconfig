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
"setlocal softtabstop=4   "Indent by 4 spaces when pressing <TAB>
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

"Write the header template in a h file.
"Use xFileName, xFileWithExtension, xFileUpper as search replace keys
let s:headerTemplate = "/**\<CR>@file\<Tab>\<Tab>"."xFileWithExtension"."\<CR>"
let s:headerTemplate = s:headerTemplate."@author\<Tab>\<Tab>Alvaro Ramirez\<CR>"
let s:headerTemplate = s:headerTemplate."@date\<Tab>\<Tab>".strftime("%Y-%m-%d")."\<CR>"
let s:headerTemplate = s:headerTemplate."@version\<Tab>\<Tab>v1.0\<CR>"
let s:headerTemplate = s:headerTemplate."@brief TODO: BRIEF_DESCRIPTION\<CR>/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/\<Esc>79a*\<Esc>oHeader guards\<CR>"
let s:headerTemplate = s:headerTemplate."\<Esc>77a*\<Esc>A/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."#ifndef "."xFileUpper"."_H\<CR>"
let s:headerTemplate = s:headerTemplate."#define "."xFileUpper"."_H\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/\<Esc>79a*\<Esc>oDoxygen groups\<CR>"
let s:headerTemplate = s:headerTemplate."\<Esc>77a*\<Esc>A/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/**\<CR>@addtogroup TODO:Dox_project_name PROJECT_DOC_HEADER\<CR>"
let s:headerTemplate = s:headerTemplate."@{\<CR>/\<CR>\<CR>/**\<CR>"
let s:headerTemplate = s:headerTemplate."@addtogroup "."xFileName"." "."xFileUpper"."\<CR>"
let s:headerTemplate = s:headerTemplate."@brief "."xFileUpper"." TODO: BRIEF_DESCRIPTION\<CR>"
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
let s:headerTemplate = s:headerTemplate."/**\<CR>@addtogroup "."xFileName"."_defines "."xFileUpper"." definitions\<CR>"
let s:headerTemplate = s:headerTemplate."@brief Preprocessor defines, masks and magic numbers.\<CR>"
let s:headerTemplate = s:headerTemplate."@{\<CR>/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/**\<CR>@brief TODO:My Awasome define\<CR>/\<CR>"
let s:headerTemplate = s:headerTemplate."#define XXX xU\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/*End of "."xFileName"."_defines */\<CR>"
let s:headerTemplate = s:headerTemplate."/**\<CR>@}\<CR>/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/\<Esc>79a*\<Esc>oTypedefs and Structs\<CR>"
let s:headerTemplate = s:headerTemplate."\<Esc>77a*\<Esc>A/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/**\<CR>@addtogroup "."xFileName"."_typedefs "."xFileUpper"." Typedef, Enums and Structs\<CR>"
let s:headerTemplate = s:headerTemplate."@brief "."xFileName"." Typedefs, Enums and Structures used in this library.\<CR>"
let s:headerTemplate = s:headerTemplate."@{\<CR>/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/*End of "."xFileName"."_typedefs */\<CR>"
let s:headerTemplate = s:headerTemplate."/**\<CR>@}\<CR>/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/\<Esc>79a*\<Esc>oFuntion Prototypes\<CR>"
let s:headerTemplate = s:headerTemplate."\<Esc>77a*\<Esc>A/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/**\<CR>@addtogroup "."xFileName"."_functions "."xFileUpper"." Functions Prototypes\<CR>"
let s:headerTemplate = s:headerTemplate."@brief "."xFileName"." Functions.\<CR>"
let s:headerTemplate = s:headerTemplate."@{\<CR>/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/*End of "."xFileName"."_Functions */\<CR>"
let s:headerTemplate = s:headerTemplate."/**\<CR>@}\<CR>/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/\<Esc>79a*\<Esc>oC++ guards\<CR>"
let s:headerTemplate = s:headerTemplate."\<Esc>77a*\<Esc>A/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."#ifdef __cplusplus\<CR>}\<CR>#endif\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/\<Esc>79a*\<Esc>oEnd of Doxygen groups\<CR>"
let s:headerTemplate = s:headerTemplate."\<Esc>77a*\<Esc>A/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/*End of "."xFileName"." group*/\<CR>"
let s:headerTemplate = s:headerTemplate."/**\<CR>@}\<CR>/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/*End of Dox_project_name group*/\<CR>"
let s:headerTemplate = s:headerTemplate."/**\<CR>@}\<CR>/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/\<Esc>79a*\<Esc>oEnd of header guards\<CR>"
let s:headerTemplate = s:headerTemplate."\<Esc>77a*\<Esc>A/\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/*End of "."xFileUpper"."_H*/\<CR>"
let s:headerTemplate = s:headerTemplate."#endif\<CR>\<CR>"
let s:headerTemplate = s:headerTemplate."/\<Esc>79a*\<Esc>oEnd of file\<CR>"
let s:headerTemplate = s:headerTemplate."\<Esc>77a*\<Esc>A/"
let s:headerTemplate = s:headerTemplate."\<Esc>gg"

"Write the source template in a c file
"Use xFileName, xFileWithExtension, xFileUpper as search replace keys
let s:sourceTemplate = "/**\<CR>@file\<Tab>\<Tab>"."xFileWithExtension"."\<CR>"
let s:sourceTemplate = s:sourceTemplate."@author\<Tab>\<Tab>Alvaro Ramirez\<CR>"
let s:sourceTemplate = s:sourceTemplate."@date\<Tab>\<Tab>".strftime("%Y-%m-%d")."\<CR>"
let s:sourceTemplate = s:sourceTemplate."@version\<Tab>\<Tab>v1.0\<CR>"
let s:sourceTemplate = s:sourceTemplate."@brief TODO: BRIEF_DESCRIPTION\<CR>/\<CR>\<CR>"
let s:sourceTemplate = s:sourceTemplate."/\<Esc>79a*\<Esc>oIncludes\<CR>"
let s:sourceTemplate = s:sourceTemplate."\<Esc>77a*\<Esc>A/\<CR>\<CR>"
let s:sourceTemplate = s:sourceTemplate."#include \""."xFileName".".h\"\<Tab>\<Tab>/*!< Always include this header. */\<CR>\<CR>"
let s:sourceTemplate = s:sourceTemplate."/\<Esc>79a*\<Esc>oLocal Variables\<CR>"
let s:sourceTemplate = s:sourceTemplate."\<Esc>77a*\<Esc>A/\<CR>\<CR>\<CR>\<CR>"
let s:sourceTemplate = s:sourceTemplate."/\<Esc>79a*\<Esc>oFunction Prototypes\<CR>"
let s:sourceTemplate = s:sourceTemplate."\<Esc>77a*\<Esc>A/\<CR>\<CR>\<CR>\<CR>"
let s:sourceTemplate = s:sourceTemplate."/\<Esc>79a*\<Esc>oFunction Definitions\<CR>"
let s:sourceTemplate = s:sourceTemplate."\<Esc>77a*\<Esc>A/\<CR>\<CR>\<CR>\<CR>"
let s:sourceTemplate = s:sourceTemplate."/\<Esc>79a*\<Esc>oEnd of file\<CR>"
let s:sourceTemplate = s:sourceTemplate."\<Esc>77a*\<Esc>A/"
let s:sourceTemplate = s:sourceTemplate."\<Esc>gg"

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

"Format the input value with the current filename as described in the keywords{{{
"Use xFileName, xFileWithExtension, xFileUpper as search replace keys
function! s:ReplaceFileName(value)
	let l:formatTemplate = substitute(a:value,"xFileName",expand('%:t:r'),"g")
	let l:formatTemplate = substitute(l:formatTemplate,"xFileUpper",toupper(expand('%:t:r')),"g")
	let l:formatTemplate = substitute(l:formatTemplate,"xFileWithExtension",expand('%:t'),"g")
	return l:formatTemplate
endfunction
"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Insert a TypedefEnum asking the name and adding the filename {{{
"Todo, add doxygen comments
function! <SID>TypedefEnum ()
	let l:tEnumName = input("typedef Enum name: ")
	let l:tEnumName = toupper(expand('%:t:r'))."_".l:tEnumName
	let l:todo = "/**\<CR>@brief ".tolower(l:tEnumName)." enumeration\<CR>"
	let l:todo = l:todo."\<CR>/\<CR>"
	let l:todo = l:todo."typedef enum\<CR>{\<CR>"
	let l:todo = l:todo . toupper(l:tEnumName)."_\<Tab>=\<Tab>,\<Tab>/*!< */\<CR>"
	let l:todo = l:todo."}".tolower(l:tEnumName)."_t;\<CR>\<Esc>kkf=F_"
	exec "normal! i".l:todo
endfunction
"}}}

"Function to create the header skeleton {{{
function! <SID>CreateTemplate() 
    if (s:BufferIsEmpty())
	let l:fileExtension = expand('%:e')
	if (l:fileExtension == 'h')	
		exec "normal! i".s:ReplaceFileName(s:headerTemplate)
	elseif (l:fileExtension == 'c')
		exec "normal! i".s:ReplaceFileName(s:sourceTemplate)
	else
		echo "Could not identify the file extension."	
	endif
    endif
endfunction 
"}}}



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command! -nargs=0 AddTemplate :call <SID>CreateTemplate()

command! -nargs=0 Tenum :call <SID>TypedefEnum()
