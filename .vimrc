execute pathogen#infect()

filetype plugin indent on
syntax on

map <leader>n :set number!<CR>
set number
set ruler

" search stuff
set incsearch
set hlsearch
set autoindent
set backspace=indent,eol,start
set ttyfast
set laststatus=2

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

map <leader>l :set list!<CR>
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»

" open file from the last line
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" kill trailing whitespaces automatically
autocmd BufWritePre * :%s/\s\+$//e

"airline https://github.com/vim-airline/vim-airline
let g:airline_powerline_fonts = 1
let g:airline_highlighting_cache = 1
function! MyLineNumber()
    return substitute(line('.'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g'). ' | '.
    \    substitute(line('$'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g')
endfunction

call airline#parts#define('linenr', {'function': 'MyLineNumber', 'accents': 'bold'})
let g:airline_section_z = airline#section#create(['%3p%%: ', 'linenr', ':%3v'])
