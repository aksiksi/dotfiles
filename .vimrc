" Instructions:
"
"   1. :PlugInstall to install plugins
"   2. Get patched Fira Mono for vim-airline:
"      https://github.com/powerline/fonts/tree/master/FiraMono
"   3. macOS -> Font Book, Linux -> ~/.local/share/fonts

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
Plug 'tpope/vim-fugitive'
Plug 'tmhedberg/SimpylFold' " Python code folding
Plug 'ntpeters/vim-better-whitespace' " Highlight trailing spaces
Plug 'vim-airline/vim-airline' " Airline status bar

" Vim color schemes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'

call plug#end()

" Vim options
set tabstop=4 shiftwidth=4 expandtab " Tab = 4 spaces
set number relativenumber " Display line numbers
syntax enable " Enable syntax highlighting
set backspace=indent,eol,start " Make backspace behave like normal
set incsearch
set hlsearch
set colorcolumn=80 " Marker at 80 cols
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* " Ignore VCS directories
set encoding=utf-8
set background=dark

" GVim options
set guioptions-=m " Hide menubar
set guioptions-=T " Hide toolbar
set guioptions-=L " Hide left scrollbar
set guioptions-=r " Hide right scrollbar

"" Platform-dependent GUI options
if has("gui_running")
  let g:gruvbox_contrast_dark='hard'
  colorscheme gruvbox

  " Gvim
  if has("gui_gtk2") || has("gui_gtk3")
    " Linux GUI
    set guifont=Fira\ Mono\ for\ Powerline\ 12,DejaVu\ Sans\ Mono\ 11
  elseif has("gui_macvim")
    " MacVim
    set guifont=Fira\ Mono\ for\ Powerline:h15,Menlo\ Regular:h12
  elseif has("gui_win32")
    " Win32/64 GVim
  endif
else
  " Set different color scheme in terminal
  colorscheme dracula
endif

" Load other Vim scripts
source ~/.functions.vim

" Airline config
let g:airline_powerline_fonts = 1
if has("gui_running")
  let g:airline_theme='gruvbox'
else
  let g:airline_theme='dracula'
endif

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

" Language indent options
autocmd FileType javascript,html,css,yaml setlocal ts=2 sts=2 sw=2 expandtab

