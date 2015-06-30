" Default
set nu
set backupdir=~/.vim/backup " Directories for backup files

hi  NonText ctermfg=black guifg=black
colorscheme   molokai
set termencoding=utf-8
set encoding=utf-8          " use utf-8 by default
set history=10000           " Number of things to remember in history.
set hlsearch                "enable highlight search
set tabstop=4
set shiftwidth=4
set expandtab
set matchtime=5   
set modeline
syntax on


" Pathogen load
hi nontext ctermfg=bg guifg=bg cterm=NONE gui=NONE 
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '\.gem$',  '\.rbc$', '\~$']
let NERDTreeShowBookmarks=1       " Show the bookmarks table on startup

"Powerline
let g:airline_theme='dark'
let g:airline_powerline_fonts = 1

"BuffExplorer
nmap <C-F5> <Esc>:BufExplorer<cr>
vmap <C-F5> <esc>:BufExplorer<cr>
imap <C-F5> <esc>:BufExplorer<cr>

" F6 - предыдущий буфер
nmap <C-F6> :bp<cr>
vmap <C-F6> <esc>:bp<cr>i
imap <C-F6> <esc>:bp<cr>i

" F7 - следующий буфер
nmap <C-F7> :bn<cr>
vmap <C-F7> <esc>:bn<cr>i
imap <C-F7> <esc>:bn<cr>i


"PyMode
let g:pymode_virtualenv = 1
