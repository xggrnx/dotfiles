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

"Tmux and vim
set clipboard=unnamed


" set termguicolors = 1 
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Colors
Plug 'mhartington/oceanic-next'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plug outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'


" Core Plugs
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'jlanzarotta/bufexplorer'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'

Plug 'universal-ctags/ctags'

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'


"Python virtualenv
Plug 'jmcantrell/vim-virtualenv'
"Go to definitions and other stuff
Plug 'davidhalter/jedi-vim'


" Git Plugs
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"jinja2
Plug 'Glench/Vim-Jinja2-Syntax'

"emmet
Plug 'mattn/emmet-vim'

"js css html beautify
Plug 'maksimr/vim-jsbeautify'


" Initialize plugin system
call plug#end()
" Core Commands 
" if u forgot  sudo
" command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
 
" Completion
let g:deoplete#enable_at_startup = 1

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=[ '\.pyc$', '__pycache__$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '\.egg-info$', '^\.git$', '\.gem$',  '\.rbc$', '\~$']
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

"CTAGS
set tags=./tags,tags;$HOME


"Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"https://github.com/python-mode/python-mode/issues/384
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

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

" AirLine
set laststatus=2

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
      \   'readonly': '%{&readonly?"<U+E0A2>":""}',
      \ },
      \ 'separator': { 'left': '<U+E0B0>', 'right': '<U+E0B2>' },
      \ 'subseparator': { 'left': '<U+E0B1>', 'right': '<U+E0B3>' }
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

set tags=./tags,./TAGS,tags;~,TAGS;~

"Jedi Vim config
let g:jedi#auto_vim_configuration = 0
let g:jedi#goto_assignments_command = ''  " dynamically done for ft=python.
let g:jedi#goto_definitions_command = ''  " dynamically done for ft=python.
let g:jedi#use_tabs_not_buffers = 0  " current default is 1.
let g:jedi#rename_command = '<Leader>gR'
let g:jedi#usages_command = '<Leader>gu'
let g:jedi#completions_enabled = 0
let g:jedi#smart_auto_mappings = 1

  " Unite/ref and pydoc are more useful.
let g:jedi#documentation_command = '<Leader>_K'
let g:jedi#auto_close_doc = 1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme OceanicNext
let g:airline_theme='oceanicnext'


