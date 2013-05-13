" Author: Emiliano Carlos de Moraes Firmino
" Contact: emiliano.firmino@gmail.com | elmiliox@gmail.com
" Info: Developer @ INdT Manaus 2013

scriptencoding utf-8
set encoding=utf-8

syntax enable " Highlight

set autoread                   " Reaload file if changed outside
set backspace=indent,eol,start " Expected Behaviour for Backspace
set backup                     " Always keep a backup file
set clipboard=unnamed          " Expected Behaviour for Clipboard
set foldmethod=indent          " Hide methods content
set laststatus=2               " Show Status Line
set mouse=a                    " Expected Behaviour for Mouse
set nocompatible               " Remove VI Annoyance
set nowrap                     " Don't break in virtual lines
set number                     " Show Line Number
set list                       " Show invisible characters
set wildmenu                   " Show Suggestion in Command Mode
set wildmode=list:longest,full " List Available Command Options

" Typo Fixes
cab W  w
cab Q  q
cab Wq wq
cab wQ wq
cab WQ wq

" Real programmers don't use tabs but spaces
set expandtab      " Convert pressed tab to spaces
set shiftround     " Round shiftwidth to multiples
set shiftwidth=4   " Number of spaces to use for each step of indent
set softtabstop=4  " Number of spaces that a tab counts
set tabstop=4      " Number of spaces that a tab counts

" Common Editor Shortcuts
nnoremap ; :

" Undo
noremap  <C-Z> :undo<CR>
inoremap <C-Z> :undo<CR>
vnoremap <C-Z> :undo<CR>

" Redo
noremap  <C-Y> <C-R>
inoremap <C-Y> <C-R>
vnoremap <C-Y> <C-R>

" Save
noremap  <C-S> :update<CR>
inoremap <C-S> :update<CR>
vnoremap <C-S> :update<CR>

" Copy to Clipboard
noremap  <C-C> Y
inoremap <C-C> Y
vnoremap <C-C> y


" Copy to Clipboard
noremap  <C-X> :quit<CR>
inoremap <C-X> :quit<CR>
vnoremap <C-X> :quit<CR>

" Firefox Like TabNavigation
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" Vi Like TAbNavigation
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Go to Tab
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt
nnoremap <A-0> 10gt

" Split Navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Bubble single lines
nmap <C-Up>   [e
nmap <C-Down> ]e

" Bubble multiple lines
nmap <C-Up>   [egv
nmap <C-Down> ]egv

" Sort Functions to a key when press '\'s
vnoremap <Leader>s :sort<CR>

" Toggle invisible
noremap <Leader>i :set list!<CR>

" Easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" from https://github.com/eiro/rcfiles/
noremap! "" ""<left>
noremap! '' ''<left>

noremap! (( ()<left>
noremap! (<cr> (<cr>)<c-o>O
noremap! (; ();<esc>hi
noremap! (<cr>; (<cr>);<c-o>O
noremap! ('; ('');<esc>hhi
noremap! ("; ("");<esc>hhi
noremap! (' ('')<esc>hi
noremap! (" ("")<esc>hi

noremap! {{ {}<left>
noremap! {<cr> {<cr>}<c-o>O
noremap! {; {};<esc>hi
noremap! {<cr>; {<cr>};<c-o>O
noremap! {'; {''};<esc>hhi
noremap! {"; {""};<esc>hhi
noremap! {' {''}<esc>hi
noremap! {" {""}<esc>hi

noremap! [[ []<left>
noremap! [<cr> [<cr>]<c-o>O
noremap! [; [];<esc>hi
noremap! [<cr>; [<cr>];<c-o>O
noremap! ['; [''];<esc>hhi
noremap! ["; [""];<esc>hhi
noremap! [' ['']<esc>hi
noremap! [" [""]<esc>hi

" Invisible characters
set listchars=tab:>\ ,eol:¬

" Show WhiteSpaces
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Remove WhiteSpaces
autocmd BufWritePre * :%s/\s\+$//e

" Easier formatting paragraphs
vmap Q gq
nmap Q gqap

filetype plugin indent on " Detect file type

" Alert problems
hi Problem ctermbg=red guibg=red
match Problem /\s\+$/
match Problem /^\s\*\t\+\s\*/
nnoremap <silent> ,a :call Preserve("%s/\\s\\+$//e")<CR>
autocmd BufWritePre *.py, *.js, *.dtml :call Preserver("%s/\\s\\+$//e")

execute pathogen#infect()
let g:neocomplcache_enable_at_startup = 1

" Theme
colorscheme BlackSea
if has("gui_running")
    set guifont=Consolas:h12:cANSI

    set guioptions-=m " remove menu bar
    set guioptions-=T " remove toolbar
    set guioptions-=r " remove righ-hand scroll bar
    set guioptions-=e " remove visual tabs
    set guioptions+=c " console dialogs over gui dialogs
endif

