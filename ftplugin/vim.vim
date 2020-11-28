""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"File: vim.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Brief: Maps, setup and other awasome stuff to create vim plugins
"Author: Alvaro Ramirez
"Version: 1.0
"Date: 2020-11-20

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"VIM specific settings for editing vimrc or plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setlocal foldmethod=marker

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Useful and awasome abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Normal mode remapings to speed edition
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Result: nnoremap <buffer> <leader> 
nnoremap <buffer> <leader>nn o<Esc>0Di"xxx<CR><BS>nnoremap <buffer> <lt>leader>

"Create a section header
nnoremap <buffer> <leader>sh o<Esc>0D60i"<Esc>yyppklDA

"Insert the snippet for a function
nnoremap <buffer> <leader>fun  o<Esc>0Di"xxx  {{{<Esc>
                              \o<Esc>0Difunction!  ()<Esc>
			      \o<Esc>0Diendfunction<Esc>
			      \o<Esc>0Di"}}}<Esc>
			      \2kt(

