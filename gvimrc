" Vim
" The commands in this file are executed when the GUI is started.
"
" New plugin, to highlight JSX without errors: https://github.com/MaxMEllon/vim-jsx-pretty
"
set statusline=%m\ %f\ %l\:%c
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Light background (the options are "light" or "dark")
set background=light

set lines=64
set columns=132

" Hide the mouse pointer while typing
set mousehide

" Hit F3 to see the highlights of the char under the cursor
map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

" Set nice colors
highlight ErrorMsg	 guifg=navy
" highlight Ignore	guibg=White guifg=Red
highlight htmlError guibg=red guifg=navy
highlight jsParensError guibg=red guifg=navy
highlight NonText guibg=grey80
highlight Constant gui=NONE guibg=#f0f0f0
highlight String gui=NONE guibg=#f0f0f0
highlight Special gui=NONE guibg=grey95
highlight Search guibg=yellow guifg=DarkBlue 
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
highlight DiffText	guibg=Yellow
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

" font selection
" number of pixel lines between lines: compact, with ruler
set linespace=-2
set cursorline
hi CursorLine guibg=#f4f4f4
" set guifont=Droid\ Sans\ Mono\ 10
" let &guifont = "Droid Sans Mono 10"
" set guifont=Droid\ Sans\ Mono\ 10
" set guifont=Monospace\ 12
" set guifont=Ubuntu\ Mono\ 14
" set guifont=Ubuntu\ Mono\ 16
" set guifont=Liberation\ Mono\ 14
set guifont=Source\ Code\ Pro\ Regular\ 15

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

" Don't backup desktop files
set backupskip=/home/juan/Desktop/*

" Map :noh to <f12> to turn search highlight off
map <f12> :noh<CR>
" F8 to open the tags window
nnoremap <silent> <F8> :Tlist<CR> 

" switch to prev/next tab https://superuser.com/questions/410982/in-vim-how-can-i-quickly-switch-between-tabs
nmap <C-N> gt
nmap <C-P> gT

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


