set number
set sw=2
set smartindent
set hlsearch
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set backspace=indent,eol,start
set clipboard=unnamedplus


filetype plugin on
filetype indent on

call plug#begin()
Plug 'Valloric/YouCompleteMe'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'Chiel92/vim-autoformat'
Plug 'chrisbra/vim-commentary'
Plug 'antoinemadec/vim-verilog-instance'
Plug 'mhinz/vim-signify'
Plug 'lfiolhais/vim-chisel'


call plug#end()

colorscheme gruvbox
set bg=dark

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

let g:formatterpath = ['/usr/bin/clang-format-10']
noremap <F3> :Autoformat<CR>
let ftexclude = ['python']
" au BufWrite * :Autoformat
au BufWrite * if index(ftexclude, &ft) < 0 | :Autoformat
noremap <F4> :NERDTreeFocus<CR>

let g:NERDTreeMinimalMenu=1
