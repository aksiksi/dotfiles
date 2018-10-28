" Plug for plugin management
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle' " Toggles relative numbering in insert mode
Plug 'scrooloose/nerdtree' 
Plug 'majutsushi/tagbar'

" Vim color schemes
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

" Vim options
set tabstop=4 shiftwidth=4 expandtab " Tab = 4 spaces
set number relativenumber " Display line numbers
syntax on " Enable syntax highlighting
colo dracula " Color scheme
set backspace=indent,eol,start " Make backspace behave like normal
set hlsearch

" gvim options
set guioptions-=T " Hides toolbar

" Custom shortcuts
map <C-n> :NERDTreeToggle<CR>

" Remaps
" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

