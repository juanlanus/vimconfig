" Vim
" The commands in this file are executed when the GUI is started.
"
" set shell=%SystemRoot%\system32\cmd.exe
" set shell+=\ /D 

" Fondo claro (las opciones son "light" o "dark")
set background=light

set lines=64
set columns=132

" Hide the mouse pointer while typing
set mousehide

" Set nice colors
highlight Normal guibg=white
highlight NonText guibg=grey80
highlight Constant gui=NONE guibg=#f0f0f0
highlight String gui=NONE guibg=#f0f0f0
highlight Special gui=NONE guibg=grey95
highlight Search guibg=lightyellow guifg=DarkBlue 
" highlight Constant guibg=bg guifg=DarkGreen
highlight Comment guifg=Navy
" colorscheme shine
highlight Cursor guibg=blue guifg=white
highlight LineNr guibg=#f0f0f0 guifg=#404040

" Colores y opciones para diff
"DiffChange diff mode: Changed line |diff.txt|
"DiffText   diff mode: Changed text within a changed line |diff.txt|
"DiffAdd    diff mode: Added line |diff.txt|
"DiffDelete diff mode: Deleted line |diff.txt|
highlight DiffChange    guibg=#ffffcc
highlight DiffText	guibg=LightYellow
highlight DiffAdd   guibg=#eeffee
highlight DiffDelete    guibg=#eeeeff
set diffopt=filler,icase,iwhite,context:999
set foldcolumn=0
set highlight=n:FoldColumn

" Colores para syn
highlight Statement	gui=bold guifg=magenta
highlight String	gui=bold guifg=navy
highlight fortranIO	gui=bold guifg=DarkCyan
highlight constant	gui=bold guifg=SeaGreen guibg=#f0f0f0
highlight Special	gui=bold guifg=DarkBlue guibg=#f0f0f0
highlight fortranComment guifg=#404040
highlight fortranContinueMark	guibg=#f8f8ff guifg=#202080
highlight Folded guibg=#f0f0f0 guifg=darkBlue	" gris más claro para los folds

" font selection: Consolas "h"pts
" set guifont=Monospace
" set guifont=Consolas:h9:cANSI
" set printfont=Consolas:h8
" number of pixel lines between lines: compact, with ruler
set linespace=-1
set cursorline
hi CursorLine guibg=#d8d8d8

" supress toolbar
set guioptions-=T

" FORTRAN syntax options
" let fortran_have_tabs = 1			" hay tabs en el formato de las líneas
" let fortran_free_source=1			" free-format
" let fortran_fold=1				" folds subroutines & functions
" let fortran_fold_conditionals=1			" folds if, do, ... ranges
" let fortran_fold_multilinecomments=1		" folds comments with +3 lines
" let fortran_more_precise=0			" slower, better recognizion
" set foldmethod=syntax

" FORTRAN options:
" :source C:\vim\vimfiles\ftplugin\fortran.vim

" Switch syntax highlighting (after options)
syntax on

" F8 to open the tags window
nnoremap <silent> <F8> :Tlist<CR> 

" FORTRAN: Comandos y sus terminaciones para matchit.vim:
" Los del archivo ftplugin/fortran.vim andan OK excepto por if continuados
" let b:match_words = '^\s*\d*\s*\<if\>\s*(:^\selse\s*if\>:^\s*\<else\>:end\s*if,\<do\>\s\s*\D\D:end *do,function:^\s\s*end\s*,^\s\s*\<subroutine\>\s:^\s*\zs\<end\>\s*$\|^\s*\<end\>\s\s*!,structure:end *structure,map:end *map,union:end *union'
" let b:match_words = '\<if\>:\<else\s*if\>:\<else\>:end\s*if'

" Showmarks: configuración
" Highlighting: Setup some nice colours to show the mark position.
highlight ShowMarksHL ctermfg=blue ctermbg=lightblue cterm=bold guifg=darkblue guibg=lightgreen gui=bold
" esto no funciona, está modificado dentro del script showmarks.vim:
" let showmarks_textlower="_"
" let showmarks_textupper="-"

" _F muestra el nombre de la subroutine/function 
" map _F mo?^\s\+subroutine\\|^\s\+function\\|^\s\+program
"xy$'o:echo @x
" mapleader reemplaza el string <leader> en algunos comandos, \ en este caso (default)
let mapleader="\\"

" encoding:
set encoding=utf-8


