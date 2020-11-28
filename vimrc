"Set the leader key
let mapleader = ","

"Open this config file for edition
nnoremap <leader>ev : vsplit $MYVIMRC<CR>

"Source Mapping
nnoremap <leader>sv : source $MYVIMRC<CR>

" Set number lines
set number

"Set higlight on yanck, also incremental search is enabled
set hls incsearch

" Enter the current millenium
" Do not limit vim to be compatible with old
" versions
set nocompatible

" Set show command mode
set showcmd

"Dracula Color Theme
packadd! dracula
colorscheme dracula

"enable syntax and plugins
syntax enable
filetype plugin on

"Add recursive file search, for opeing mutiple files"
set path+=**

"Display all matching files when we tab complete
set wildmenu

" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags

" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list

"Set autoident, and C filetype autoident
set autoindent

"Automatically inserts indentation in some cases
set smartindent

"Load the plugins
packloadall

" FILE BROWSING:

" Tweaks for browsing
"let g:netrw_banner=0        " disable annoying banner
"let g:netrw_browse_split=4  " open in prior window
"let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C global options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup myCoptions
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Doxygen
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:DoxygenToolkit_authorName="Alvaro Ramirez"
let g:DoxygenToolkit_licenseTag="This is a test"

