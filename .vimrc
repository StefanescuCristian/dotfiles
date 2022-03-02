syntax on
map <leader>n :set number!<CR>
set number
set ruler
set hlsearch
set ttyfast
set laststatus=2
map <leader>l :set list!<CR>
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
