set nu
set nowrap
set backupdir=~/.vim/backup " Directories for backup files
set noswapfile
set background=dark
set termencoding=utf-8
set encoding=utf-8          " use utf-8 by default
set history=10000           " Number of things to remember in history.
set hlsearch                "enable highlight search
set tabstop=4
set shiftwidth=4
set expandtab
set matchtime=5   
set modeline
set clipboard=unnamed   "Copy to system clipboard
"Backspace in osX
set backspace=indent,eol,start
syntax on

"Tmux and vim
set clipboard=unnamed


" if u forgot about sudo 
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

"Vundle Start
" Vundle Load
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Core Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'Yggdroot/indentLine'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdcommenter'
Plugin 'wincent/command-t'

"CTAGS
Plugin 'universal-ctags/ctags'

"autogenerate
Plugin 'craigemery/vim-autotag'


"Syntax checking
"Plugin 'scrooloose/syntastic'

"Python
Plugin 'python-mode/python-mode'


"Completition
Plugin 'Shougo/neocomplete.vim'

"Python virtualenv
Plugin 'jmcantrell/vim-virtualenv' 

"emmet
Plugin 'mattn/emmet-vim'

"jinja2
Plugin 'Glench/Vim-Jinja2-Syntax'

"Js
Plugin 'maksimr/vim-jsbeautify'


call vundle#end()
filetype plugin indent on
syntax on

"CTAGS
set tags=./tags,tags;$HOME
set tags=./tags,./TAGS,tags;~,TAGS;~;$HOME

"Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall



"PyMode
let g:pymode_python = 'python3'
"let g:pymode_rope_autoimport=0
let g:pymode_rope_goto_definition_bind = "<C-b>"
let g:pymode_doc_bind = "<C-S-d>"

"https://github.com/python-mode/python-mode/issues/384
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


"NeoComplete
let g:neocomplete#enable_at_startup = 1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


" IdentLine
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'


" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
   set conceallevel=2 concealcursor=niv
endif

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '\.egg-info$', '^\.git$', '\.gem$',  '\.rbc$', '\~$']
let NERDTreeShowBookmarks=1       " Show the bookmarks table on startup
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" Nerdtree
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']
let NERDTreeKeepTreeInNewTab=1
" Auto open nerd tree on startup
let g:nerdtree_tabs_open_on_gui_startup = 1

let g:nerdtree_tabs_focus_on_files = 1
let g:NERDTreeUpdateOnWrite = 0

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }


" AirLine
set laststatus=2

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1

let g:airline_powerline_fonts = 1
let g:lightline = {
      \ 'colorscheme': 'papercolor',
      \ }

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

"GitGutter
let g:gitgutter_avoid_cmd_prompt_on_windows = 0 
let g:gitgutter_max_signs = 1500

"BuffExplorer toggle
nmap <F5> <Esc>:BufExplorer<cr>
vmap <F5> <esc>:BufExplorer<cr>
imap <F5> <esc>:BufExplorer<cr>

" F6 - prev buffer
nmap <F6> :bp<cr>
vmap <F6> <esc>:bp<cr>i
imap <F6> <esc>:bp<cr>i

" F7 - next buffer
nmap <F7> :bn<cr>
vmap <F7> <esc>:bn<cr>i
imap <F7> <esc>:bn<cr>i

" TagBar
nmap <F8> :TagbarToggle<CR>

" GitBlame
map <F12> :Gblame<CR>


"JsBeautify
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

"For visual mode
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>



