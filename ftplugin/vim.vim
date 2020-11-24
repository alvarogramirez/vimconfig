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
nnoremap <buffer> <leader>n onnoremap <lt>buffer> <lt>leader><esc>kI"<esc>jA

"Create a section header
nnoremap <buffer> <leader>sh o<esc>Do<esc>60i"<esc>yyppklDA
