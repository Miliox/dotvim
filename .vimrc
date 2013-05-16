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

execute pathogen#infect()

" Typo Fixes
cab W  w
cab Q  q
cab Wq wq
cab wQ wq
cab WQ wq
cab Qa qa

" Real programmers don't use tabs but spaces
set expandtab      " Convert pressed tab to spaces
set shiftround     " Round shiftwidth to multiples
set shiftwidth=4   " Number of spaces to use for each step of indent
set softtabstop=4  " Number of spaces that a tab counts
set tabstop=4      " Number of spaces that a tab counts

" Common Editor Shortcuts
nnoremap ; :

" Undo
noremap  <silent> <C-Z> :undo<CR>
vnoremap <silent> <C-Z> :undo<CR>
inoremap <silent> <C-Z> <ESC>:undo<CR>i

" Redo
noremap  <silent> <C-Y> <C-R>
inoremap <silent> <C-Y> <C-R>
vnoremap <silent> <C-Y> <C-R>

" Save
noremap  <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> :update<CR>
inoremap <silent> <C-S> <ESC>:update<CR>i

" Copy to Clipboard
noremap  <C-C> Y
vnoremap <C-C> y
inoremap <C-C> <ESC>Yi

" Close Vim
noremap  <C-X> :quit<CR>
vnoremap <C-X> :quit<CR>
inoremap <C-X> <ESC>:quit<CR>i

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
map <silent> <C-h> <C-w>h
map <silent> <C-j> <C-w>j
map <silent> <C-k> <C-w>k
map <silent> <C-l> <C-w>l

" Bubble single lines
nmap <silent> <C-Up>   [e
nmap <silent> <C-Down> ]e

" Bubble multiple lines
nmap <silent> <C-Up>   [egv
nmap <silent> <C-Down> ]egv

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
set listchars=tab:>\ ,eol:¬,trail:.

" Show WhiteSpaces
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Remove WhiteSpaces
autocmd BufWritePre * :%s/\s\+$//e

" Easier formatting paragraphs
vmap Q gq
nmap Q gqap

" Alert problems
highlight Problem ctermbg=red guibg=red
match Problem /\s\+$/
match Problem /^\s\*\t\+\s\*/
nnoremap <silent> ,a :call Preserve("%s/\\s\\+$//e")<CR>
autocmd BufWritePre *.py, *.js, *.dtml :call Preserver("%s/\\s\\+$//e")

let g:vimshell_prompt = "$"
let g:vimshell_secondary_prompt = ">"

colorscheme BlackSea
filetype plugin indent on " Detect file type
