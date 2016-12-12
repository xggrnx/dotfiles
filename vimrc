" Default
set nu
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
syntax on
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Vundle Load
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Core Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Shougo/neocomplete'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'ternjs/tern_for_vim'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'Yggdroot/indentLine'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdcommenter'


" Go Lang
Plugin 'fatih/vim-go'

" JavaScript
Plugin 'maksimr/vim-jsbeautify'
Plugin 'pangloss/vim-javascript'

" TypeScript
Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'

" Python 
Plugin 'davidhalter/jedi-vim'
Plugin 'lambdalisue/vim-pyenv' 


call vundle#end()
filetype plugin indent on
syntax on


"TypeScript
let g:typescript_indent_disable = 1
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''

"Python
"omnifunc=jedi#completions
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<C-]>"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

if jedi#init_python()
  function! s:jedi_auto_force_py_version() abort
    let major_version = pyenv#python#get_internal_major_version()
    call jedi#force_py_version(major_version)
  endfunction
augroup vim-pyenv-custom-augroup
   autocmd! *
   autocmd User vim-pyenv-activate-post   call s:jedi_auto_force_py_version()
   autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
augroup END
endif


"NeoComplete
let g:neocomplete#enable_at_startup = 1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
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

"JavaScript
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>

autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>

autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif


autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif

"JSHINT2

let jshint2_read = 1
let jshint2_save = 1
let jshint2_confirm = 0
let jshint2_min_height =6 
let jshint2_max_height = 12



set runtimepath+=~/.vim/bundle/jshint2.vim/
" jshint validation
nnoremap <silent><F1> :JSHint<CR>
inoremap <silent><F1> <C-O>:JSHint<CR>
vnoremap <silent><F1> :JSHint<CR>

" show next jshint error
nnoremap <silent><F2> :lnext<CR>
inoremap <silent><F2> <C-O>:lnext<CR>
vnoremap <silent><F2> :lnext<CR>
" show previous jshint error
nnoremap <silent><F3> :lprevious<CR>
inoremap <silent><F3> <C-O>:lprevious<CR>
vnoremap <silent><F3> :lprevious<CR>

"JsCtags
let g:tagbar_type_javascript = {
    \ 'ctagsbin' : '/usr/local/bin/jsctags'
    \ }

" GitBlame
map <F12> :Gblame<CR>
