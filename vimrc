set nocompatible
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""execute pathogen#infect()
execute pathogen#infect()
" silent! call pathogen#infect()
" silent! call pathogen#helptags()

" mkdir ~/.vimundo
set undodir=~/.vimundo
set undofile

" syntastic settings
" Plug 'scrooloose/syntastic' produces an error
let g:syntastic_javascript_checkers = ['eslint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1

set helplang=en
set ignorecase
set nowrapscan
set guioptions=egmrLt
set matchpairs+=<:>
set shiftwidth=2
set tabstop=2
set autoindent
set nosmartcase
set history=999

" Do smart autoindenting when starting a new line (ej. con "{")
" set smartindent: deprecated, has issue with initial #

" When on, a <Tab> in front of a line inserts blanks according to
" 'shiftwidth'.  'tabstop' is used in other places.
set smarttab
" use spaces, not tabs
set expandtab

" Don't write backup files in desktop
set backupskip+=,*/Desktop*,*/Escritorio/*

set errorbells
set visualbell
set showcmd

set more

" Switch on search pattern highlighting, instant first match and no wrap
set hlsearch
set incsearch
set showmatch
" Map :noh to <f12> to turn search highlight off (no hlsearch)
map <f12> :noh<CR>

set cursorline
highlight CursorLine guibg=#f0fff0
set ruler
set showmode
set columns=140
set lines=45
set scrolloff=0         " don't scroll search results

" scroll one col at a time when the cursor is at columns of the margin
set sidescroll=1
set sidescrolloff=4

filetype plugin on      " This enables filetype plugins
filetype plugin indent on

set mousehide           " Hide the mouse when typing text

if !exists("syntax_on") " Switch on syntax highlighting if it wasn't on yet.
    syntax on
endif

" Mensajes cortos en cambios de archivo, para evitar "hit return"
set shortmess=a

set encoding=utf-8

" change diff highligting
highlight DiffText guibg=yellow
highlight DiffText guifg=black

" match tag pairs
filetype plugin on 
runtime macros/matchit.vim

" set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" set additional diff UI options
set diffopt+=vertical,foldcolumn:0


" from: http://vim.wikia.com/wiki/Step_increment_and_replace 
" Usage: SReplace <search> <substitute> <increment>
" :SReplace abc xyz0 1   search for "abc", replace first w/"xyz0" 2nd w/"xyz1"...
command -nargs=+ SReplace call StepReplace(<f-args>)
" makes use of register y
function StepReplace(...)
  if a:0 == 1
    let @y = input("Replace with: ", @y)
    let y = @y
    if @y =~ "\\d\\+$"
      let n = substitute(@y, ".\\{-}\\(\\d\\+\\)$", "\\1", "") + a:1
      let @y = substitute(@y, "\\(.\\{-}\\)\\d\\+$", "\\1".n, "")
    endif
    return y
  elseif a:0 == 3
    let @y = a:2
    execute "%s/".a:1."/\\=StepReplace(".a:3.")/".(&gdefault ? "" : "g")."c"
  else
    echo "Usage: SReplace <search> <substitute> <increment>"
  endif
endfunction


" redirect vim command output to current buffer, from:
" http://unix.stackexchange.com/questions/8101/how-to-insert-the-result-of-a-command-into-the-text-in-vim
" usage: while in insert mode do  ^R=Exec('<the command>')<enter>
funct! Exec(command)
    let saveapaste = &paste
    set paste
    redir =>output
    silent exec a:command
    redir END
    return output
    set nopaste
    " let &paste = saveapaste 
endfunct!
