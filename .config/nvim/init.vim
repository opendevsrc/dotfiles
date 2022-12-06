" GENERAL SETS

set background=dark
colo habamax 
set termguicolors
set nocompatible
set hidden
set ttyfast
set mouse=
set lazyredraw
set ruler
set noeb vb t_vb=
set nu
set linebreak
set autoread
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=120
set smartcase
set expandtab
set ai
set si
set fileformat=unix
set mat=1
set wildmenu
set wildmode=longest:full,full
set wildoptions="pum,tagfile"
set pumheight=5
set pumwidth=5
set ignorecase
set hlsearch
set incsearch
set showmatch
set smarttab
set path+=**
set cmdheight=1
set backspace=start,eol,indent
set encoding=utf-8
set completeopt+=menuone
set shortmess+=c
set omnifunc=syntaxcomplete#Complete
syntax on

" AUTOCOMMANDS

filetype plugin on

au BufEnter * :syn sync minlines=256

au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif

au FileType css,php,html,xhtml,javascript,sh
    \ set tabstop=2 |
    \ set shiftwidth=2 |
    \ set softtabstop=2 |

au Filetype html,xhtml,php inoremap ><Tab> ><Esc>F<lyt>o</<C-r>"><Esc>O<Tab>

" Remaps

inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-^> <C-o><C-^>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>

inoremap <expr> <cr> getline(".")[col(".")-2:col(".")-1]=="{}" ? "<CR><C-o>O" : "<cr>"

inoremap <expr> <space> 
    \   getline(".")[col(".")-2:col(".")-1]=="{}" ? "<space><space><C-o>h"
    \ : getline(".")[col(".")-2:col(".")-1]=="()" ? "<space><space><C-o>h"
    \ : getline(".")[col(".")-2:col(".")-1]=="[]" ? "<space><space><C-o>h"
    \ : "<space>"

inoremap <expr> <BS> 
    \   getline(".")[col(".")-2:col(".")-1]=="\"\"" ? "<BS><del>"
    \ : getline(".")[col(".")-2:col(".")-1]=="\'\'" ? "<BS><del>"
    \ : getline(".")[col(".")-2:col(".")-1]=="``"   ? "<BS><del>"
    \ : getline(".")[col(".")-2:col(".")-1]=="{}"   ? "<BS><del>"
    \ : getline(".")[col(".")-2:col(".")-1]=="()"   ? "<BS><del>"
    \ : getline(".")[col(".")-2:col(".")-1]=="\[\]" ? "<BS><del>"
    \ : "<BS>"

nnoremap ,sh :vert term<CR>
nnoremap ,sb :%s/<C-r><C-w>\C//g<left><left>
nnoremap // :noh<return>

nnoremap K :m .-2<CR>==
nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

nnoremap L xp
nnoremap H xhP
vnoremap L xpv`[
vnoremap H xhPv`[

command! MakeTags !ctags -R .
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_list_hide=netrw_gitignore#Hide() " Se repositório git
let g:netrw_list_hide=',\(^\|\s\s\)\zs\.\S\+'

map <F5> :call CompileRun()<CR>
imap <F5> <Esc>:call CompileRun()<CR>
vmap <F5> <Esc>:call CompileRun()<CR>
func! CompileRun()
exec "w"
if &filetype == 'c'
    exec "!make %:t:r"
    exec "!./%:t:r"
elseif &filetype == 'cpp'
    exec "!make %:t:r"
    exec "!./%:t:r"
elseif &filetype == 'html'
    exec "!%"
endif
endfunc

map <F4> :call Compile()<CR>
imap <F4> <Esc>:call Compile()<CR>
vmap <F4> <Esc>:call Compile()<CR>
func! Compile()
exec "w"
if &filetype == 'c'
    exec "!make %:t:r"
elseif &filetype == 'cpp'
    exec "!make %:t:r"
endif
endfunc
