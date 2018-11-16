" Install vim-plug if not available
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plug for plugin management
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle' " Toggles relative numbering in insert mode
Plug 'scrooloose/nerdtree' 
Plug 'majutsushi/tagbar'
Plug 'justinmk/vim-sneak' " Use s + 2 chars as a better f/F

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

"" Platform-dependent gvim options
if has("gui_running")
  " Gvim
  if has("gui_gtk2") || has("gui_gtk3")
    " Linux GUI
    " Quirk: Font size must have space
    set guifont=DejaVu\ Sans\ Mono\ 12
  elseif has("gui_macvim")
    " MacVim
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    " Win32/64 GVim
  endif
endif

" Load other Vim scripts
source ~/.functions.vim

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

" Map Enter to clear highlight in normal mode
nnoremap <CR> :noh<CR><CR>

" Tagbar key
nmap <F7> :TagbarToggle<CR>

